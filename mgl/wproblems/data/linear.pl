:- multifile rate/3.
:- consult(library(clpq)).
:- dynamic neqs/1.

card(A, Nu) :- 
	app(countable,A, N),
	reduce_sum(N,Nu).

reduce_sum(neqs(L),neqs(Lr)) :-
	maplist(reduce_sum,L,Lr).
reduce_sum(sum([N]),Nr) :-
	reduce_sum(N,Nr).
reduce_sum(sum(L),sum(Lr)) :- length(L,Nl), Nl > 1,
	maplist(reduce_sum,L,Lr).
reduce_sum(K*N, Kr*Nr) :-
	reduce_sum(K,Kr),
	reduce_sum(N,Nr).
reduce_sum(N,N) :- N = '$VAR'(_).
reduce_sum(N,N) :- number(N).

nub([],[]).
nub([A|As], Bs) :- member(A,As),!,nub(As,Bs).
nub([A|As], [A|Bs]) :- nub(As, Bs).

app(F,aeqs(As), neqs(Cs)) :-
	app(F,As, Bs),
	nub(Bs,Cs), length(Cs,N), N >= 2.
app(_, [], []).
app(F, [A|As], [N|Ns]) :-
	app(F,A, N), app(F,As, Ns).
app(F, sum(As),  sum(Ns)) :- app(F,As,Ns).
app(F, A + B, N1 + N2) :- app(F,A,N1), app(F,B,N2).
app(F, K * A, N) :- app(F, A, N1), simplify(K*N1;N).
app(F, unit(C), R) :- rate(F,C, R).
app(_,some(C),_) :- throw('app on some'(C)).
app(F, P, N) :- P = p(_,_,_),
	P - A, app(F, A, N).

app(F, compose(L,P), M) :-
	app(F,L, K),
	app(countable,P, N),
	simplify(K*N; M).
app(F, L, N) :- L = lambda(_,_,_),
	L - A, app(F,A, N).

rate(countable,_, 1) :- !. % Assume all classes are countable!
rate(C, D, 1) :- subclass(D,C),!.
rate(C, D, 0) :- subclass(C,D), C \= D, throw('invalid rate'(D,C)); true.


% Format
cons(Es,Fs) :- maplist(cons,Es,Fs).
cons(A-B,Ac=:=Bc) :-
	cons(A,Ac),cons(B,Bc).
cons(sum([A|As]), Ac + Asc) :-
	cons(A,Ac), 
	cons(sum(As),Asc).
cons(sum([A]), Ac) :- cons(A,Ac).

cons(K*A, Kc*Ac) :- cons(A,Ac), cons(K,Kc).
cons(X,X) :- X = '$VAR'(_).
cons(X,X) :- number(X).





flatten_sum(A + B; Cs) :-
	(flatten_sum(A; As); As = [A]),
	(flatten_sum(B; Bs); Bs = [B]),
	append(As,Bs, Cs).

unflatten_sum([X]; X).
unflatten_sum([X|Xs]; N + X) :-
	unflatten_sum(Xs; N).

simplify(neqs(Es); neqs(Fs)) :-
	simplify(Es;Fs),!.
simplify(sum([A]); Am) :-
	simplify(A; Am),!.
simplify(sum([A|As]); Asm + Am) :-
	simplify(A; Am),
	simplify(sum(As); Asm),!.
simplify([];[]).
simplify([N|Ns]; Ss) :-
	simplify(N; Nr),
	simplify(Ns; Nsr),
	(member(Nr,Nsr), Ss=Nsr;  Ss=[Nr|Nsr]).
simplify(N; Nl + Lv) :- N = _ + _, 
	flatten_sum(N; Ns),
	findall(U, (member(T,Ns),simplify(T;U)), Us),
	findall(T, (member(T,Us),number(T)), Literals),
	findall(T, (member(T,Us), \+ number(T)), NotLiterals),
	unflatten_sum(Literals; L), Lv is L,
	unflatten_sum(NotLiterals; Nl).
simplify(K * A; O) :-
	simplify(A; Ar),
	simplify(K;Kr),
	one_simplify(Kr,Ar, O),!.
simplify(N; N).
zero_simplify(N,0,N).
zero_simplify(0,N,N).
zero_simplify(N,M,N + M).
one_simplify(_,0, 0).
one_simplify(K,1, K).
one_simplify(1,K, K).
one_simplify(K,L, K*L).

use_module(library(varnumbers)).
use_module(library(clpq)).


model(M) :-
	findall(E, (neqs(_)=E,E), Eqs),
	full_model(Eqs,M).


consistent(Es) :-
	cons(Es,Fs),
	varnumbers(Fs,Fsv),
	maplist({},Fsv).

compatible(E,M) :-
	consistent([E|M]).

entails(M1,M2) :-
	forall(member(E,M2), redundant(E,M1)).

equivalent(M1,M2) :-
	entails(M1,M2),
	entails(M2,M1).

redundant(E,Ms) :-
	cons([E|Ms], EMv),
	varnumbers(EMv,[Ev|Msv]),
	maplist({},Msv), entailed(Ev).


complete_for(Vs,Es) :-
	cons(Es,Fs),
	varnumbers(Fs-Vs,Fsv-Vsv),
	maplist({},Fsv),
	forall(member(V,Vsv), number(V)).


grow_model(Ms,neqs([_]),Ms).
grow_model(Ms,neqs([]),Ms).
grow_model(Ms, neqs([N1,N2|Ns]), Mm2) :-
	grow_model(Ms,N1-N2, Mm),
	grow_model(Mm, neqs([N2|Ns]), Mm2).
grow_model(M, E, M) :-
	redundant(E,M).
grow_model(M, E, [E|M]) :-
	compatible(E,M).


full_model([],[]).
full_model([E|Es], M) :-
	full_model(Es,M1),
	grow_model(M1,E,M).



solve_for(Model, Vs, Ss) :-
	cons(Model, Fs),
	varnumbers(Fs-Vs,Fsv-Ss),
	maplist({},Fsv).

solve_for_and_describe(Model,Vs,Ds) :-
	solve_for(Model,Vs,Ss),
	findall(aeq(P,S*unit(C)),
		(member(V,Vs),member(S,Ss),p(C,C,P)-V*_),
		Us),
	sort(Us, Ds).


describe_solutions(Ds) :-
	model(M),
	setof(V, find(V), Vs),
	solve_for_and_describe(M,Vs,Ds).


problem_complete :-
	model(M),
	findall(V, find(V),Vs),
	complete_for(Vs,M).

problem_consistent :-
	model(M),
	consistent(M).

problem_solve(Sols) :-
	findall(V, find(V), Vs),
	model(M),
	solve_for(M,Vs,Sols).


size(X,1) :- atom(X).
size(X,1) :- number(X).
size('$VAR'(_),1).
size(sum(L),S) :-  size(L,S1), S is S1 + 1.
size([], 0).
size([A|As], N) :- 
	size(A,Na), size(As,Nas), N is max(Na,Nas).
size(A-B,N) :- size(A,Na), size(B,Nb), N is max(Na,Nb).
size(A*B,N) :- size(A,Na), size(B,Nb), N is max(Na,Nb) + 1.	




