:- multifile isclass/1, isin/2, own/2, dsubclass/2, (-)/2.
:- dynamic dsubclass/2, find/1, find/3, (-)/2, section/1, sdebug/0, aeqs/1.
:- op(1000, xfx, (=>)).

%:- dynamic isclass/2, find/3, (-)/2.

%sdebug.

writefd(S,L) :- sdebug, writef(S,L); true.


erase_recorded(Tag,T) :- recorded(Tag,T,Ref), erase(Ref).

forget_all :-
	findall(E, (E=_ - _, E, retract(E)),_).

% 
% Classes
%
isclass(C) :- istopclass(C).
isclass(C) :- dsubclass(C,_).
isclass(D) :- dsubclass(_,D).

istopclass(countable).

sum([A]; A).
% sum([A,B]; A + B).
sum([A|As]; Bs + A) :- sum(As; Bs).

unsum(A+B; [B|As]) :- unsum(A; As),!.
unsum(A; [A]).



%
% Auto replace 'some' or predicates with variables
% (Replacing all 'some' is required for core language)
% 



mkVar(C;'$VAR'(K)) :- atom_codes(C,[I]), K is I - 97.
	

define(Pp,V,Tag) :-
	Pp = p(_,Cl,P),
	unnormal(Pp; Up),
	writefd("Defined $%w$ as %w.\n", [V,Up]),
	add_rec(defined(V,Pp), Tag),
	forall(find(Y,Cl,P), 
			replace_rec(find(Y,Cl,P),[find(V), p(Y,Cl,P) - V*unit(Cl)], Tag)),
	forall(p(Y,Cl,P) - some(Cl), 
		replace_rec(p(Y,Cl,P)-some(Cl), [p(Y,Cl,P)-V*unit(Cl)], Tag)).
		
add_rec(A, Token) :-
	asserta(A),
	writefd("Recorded %w under %w.\n", [add(A), Token]),
	recorda(Token,add(A)).

add_tag(Token) :-
	section(Token); (asserta(section(Token)), writefd("New section '%w'\n", [Token])).
rm_tag(Token) :-
	retract(section(Token)).
add_many_tags(Tokens) :-
	listmap(add_tag, Tokens).

by_rec(A, Token) :-
	recorda(Token, by(A)).

rm_rec(A,Token) :-
	retract(A),
	recorda(Token,rm(A)).

replace_rec(A,[B|Bs],Token) :-
	forall(member(X,[B|Bs]), asserta(X)),
	retract(A),
	forall(member(X,[B|Bs]), recorda(Token, add(X))),
	recorda(Token,rm(A)).


undo(Token) :-
	forall(recorded(Token,P,R), (undo_this(P),erase(R))).

recorded_into(Token, Rs) :-
	findall(recorda(Token,P), recorded(Token,P), Rs).


undo_this(add(P)) :- retract(P).
undo_this(rm(P))  :- asserta(P).


define_all :- define_all_with([a,b,c,d,e]).
define_all_with(_) :- \+ must_define(_).
define_all_with(Vs) :-
	must_define(P),
	!, choose_var(Vs, P,Code),
	mkVar(Code; V),
	delete(Vs,Code,Vr),
	add_tag(define_all), 
	define(P,V,define_all), !,
	define_all_with(Vr).

	

describe(V, U) :- 
	P-V*unit(_),
	unnormal(P;U).

have_definibles :- P-A, must_define(P-A).
must_define(p(X,Cl,P)) :- find(X,Cl,P).
must_define(P) :- P-some(_).




unsome(N, find(X,Cl,P),p(X,Cl,P)-V*unit(Cl), N1, [V]) :-
	numbervars(V,N,N1).
unsome(N, P,P, N,[]) :- P = dsubclass(_,_).
unsome(N, [],[], N,[]).
unsome(N, [X|Xs],[Xr|Xsr], Nr,[G1|Gs]) :-
	unsome(N,  X,Xr,   N1,G1),
	unsome(N1, Xs,Xsr, Nr,Gs).
unsome(N, P - A,P - Ar, Nr,Gs) :-
	unsome(N, A,Ar, Nr,Gs).
unsome(N, R, V*unit(C), N1,[]) :- R = some(C),
	numbervars(V,N,N1).
unsome(N, K*A,K*Ar, Nr,Goal) :-
	unsome(N, A,Ar, Nr,Goal).
unsome(N, A,A, N, []).



make_vars(A1-A2; Vs) :- 
	atom_codes(A1,[Cd1]),
	atom_codes(A2,[Cd2]),
	findall(A, (between(Cd1,Cd2,N),atom_codes(A,[N])), Vs).

unmake_vars([Va,Vb]; Va-Vb).
unmake_vars([V|Vs]; V-T) :- unmake_vars(Vs;_-T).

%do_unsome(Xs, Xr, Ds) :- 
%	unsome(0,[], Xs,Xr, _,Ds).


find_definitions(Ds) :- 
	findall(V - P, (V='$VAR'(_), P - V * unit(_)), Ds).


%
% Type inference
%

stype(unit(C); C).
stype(some(C); C).
 
 
%class(adj([],C); C).
%class(adj([P|_],C); adj([P],C)).
%class(adj([_|Ps],C); K) :- class(adj(Ps,C); K).

glb(top,C; C).
glb(C,top; C).
glb(C,D; G) :- findall(X, (subclass(X,C), subclass(X,D)), [G|_]).
lub([C|Cs]; L) :- lub(Cs; M), lub([C,M]; L).
lub([C,D]; L) :- findall(X, (subclass(C,X), subclass(D,X)), [L|_]).

getclass(K,lambda(_,Q); C) :- getclass(K,Q; C).
getclass(K,p(_,Q); C) :- getclass(K,Q; C).
getclass(K,F; C) :-
	arg(K,F,C), isclass(C). %%!; throw('not a class'(C))).


type(at(_,A); T) :- type(A; T).
type(aeq(A,B); equ(amount(G))) :- type(A; amount(G)), type(B; amount(G)). %  glb(C,D; G).
type(lambda(_,Cn, A); Cn => T) :- type(A; T).
%type(singleton(X); amount(C)) :- atom(X), isa(X,C).
type(p(_,C,_); amount(C)).
type(A; amount(D)) :- stype(A; D). % stype(A; C), subclass(C,D).
type(every(C); amount(C)).
type(times(_,A); T) :- type(A; T).
type(_ * A; T) :- type(A; T).
type(A + B; amount(C)) :- type(A; amount(Ca)), type(B; amount(Cb)), lub([Ca,Cb]; C).
type([]; _).
type([A|As]; amount(D)) :- type(A; amount(C1)), type(As; amount(C2)), lub([C1,C2]; D).
type(_ - A; T) :- type(A; T).
type(own(_,C); amount(C)) :- isclass(C).
type(own(_,A); T) :- type(A; T).
type(age(_); amount(year)).
type(isin(every(C),B); amount(C) => T) :- type(B; T). 
type(isin(A,every(C)); amount(C) => T) :- type(A; T). 
type(isin(A,B); T) :-
	isclass(A), T= amount(A);
	isclass(B), T = amount(B). 

subclass(A,A).
subclass(A,B) :- dsubclass(A,C), subclass(C,B).

dsubclass(adj(Adj,C),C) :- atom(Adj).



decompose(Cy, p(X,Cx,isin(X,G)); compose(F,P)) :-
	P = p(Y,Cy,isin(Y,G)),
	F = lambda(Y,Cy, p(X,Cx,isin(X,Y))).



partition([],D) :- asserta(isclass(D)).
partition([C|Cs], D) :-
	asserta(dsubclass(C,D)),
	asserta(isclass(C)),
	partition(Cs,D).


%
% Examine structure
%

goal(P) :- F = find(V),
	F, P-V*unit(_).
goal(p(X,Cl,P)) :- F = find(X,Cl,P),
	F, isclass(Cl).
	
% A wrapped predicate:

ispredicate(p(_,_,_)).

% Amounts are either (wrapped) predicates or
% arithmetic combinations of 'unit' and 'some':

isamount(p(_,_,_)).
isamount(some(_)).
isamount(unit(_)).
isamount(A + B) :- isamount(A), isamount(B).
isamount(_ * A) :- isamount(A).

depth(aeq(A,B); N) :- depth(A;Na), depth(B;Nb), N is Na + Nb.
depth(A + B; N) :- sdepth(A + B; M), N is M + 1.
depth(_ * A; N) :- depth(A; M), N is M + 1.
depth(unit(_); 1).
depth(some(_); 0).
depth(p(_,_,_); 1).
sdepth(A + B; N) :- sdepth(A;Ma), sdepth(B;Mb), !, (Ma > Mb, !, N = Ma; N = Mb).
sdepth(A; N) :- depth(A; N).

% It is ground it does not contain numeric variables or 'some'.

% nonground(p(_,_,_)).
nonground(some(_)).
nonground(aeq(A,B)) :- nonground(A); nonground(B).
nonground(K * _) :- \+ number(K).
nonground(_ * A) :- nonground(A).
nonground(A + B) :- nonground(A); nonground(B).

% Core language forbids 'some' and bare predicates.

iscore(aeq(A,B)) :- iscore(A), iscore(B).
iscore(p(_,_,_)).
iscore(unit(_)).
iscore(_ * A) :- iscore(A).
iscore(A + B) :- iscore(A), iscore(B).


% Well-formed sums of amounts are composed of distinct classes.

isdisjunctive(E) :- isdisjunctive(E,_),!.
isdisjunctive(_).
isdisjunctive(_ * A,Cs) :- isdisjunctive(A,Cs).
isdisjunctive(A + B,Cs) :-
	isdisjunctive(A,Cas),
	isdisjunctive(B,Cbs),!,
	intersection(Cas,Cbs,[]), append(Cas,Cbs,Cs).


% intersect([],_,[]).
% intersect([L|Ls],Ms,Ds) :- intersect(Ls,Ms,Cs), (member(L,Ms),!, Ds=[L|Cs]; Ds=Cs).


%
% Convert to core language
%

%do_core(Vs,P,[P],[],Vs) :- P = dsubclass(_,_).
%do_core(Vs,P,[P],[],Vs) :- P = istopclass(_).
%do_core(Vrange,S, Cs, Defs, Vrange2) :-
%	%findall(N, (member(S,Ss),normal(S;N)), Ns),
%	normal(S;N),
%	do_unsome(Vrange, N,Cs, Defs, Vrange2).

% normal(at(T,A); at(T, normal(A))).
normal(V;V) :- var(V).
normal(sumof(A); An) 
:- normal(A; An).
normal([]; []).
normal([A|As]; [An|Ans]) :-
	normal(A;An),
	normal(As;Ans).
normal(eq(N1,N2); neqs([Nn1,Nn2])) :-
	normal_number(N1,Nn1),
	normal_number(N2,Nn2),!.
normal(aeq(_,[]);_) :- fail.
normal(aeq(A,[B|_]); aeq(A,B)).
normal(aeq(A,[_|Bs]); E) :- normal(aeq(A,Bs); E).
% 'own' predicate
normal(find(own(O,Cl)); [find(X,Cl,own(O,X))]). % :- isclass(Cl).
normal(own(H,A); Ps) :-
	%check_normal(A; Ag),
	%type(A; amount(C)),
	full_disaggregate(A; DCs),
	findall(p(X,C,own(H,X)) - D,
			member(D - C, DCs),
			Ps).
normal(own(H,Cl); p(X,Cl,own(H,X))) :- isclass(Cl).
% 'isin' predicate
normal(find(isin(Cl,O)); [find(X,Cl,isin(X,O))]) :- isclass(Cl).
normal(isin(A,every(D)); [P - Ag]) :-
	check_normal(A; Ag),type(Ag; amount(C)),
	P = lambda(Y,D,p(X,C,isin(X,Y))),!.
	%revar(P).
normal(isin(A,B); Ps) :-
	%check_normal(A; Ag), type(Ag; amount(C)),
	full_disaggregate(A; DCs),
	findall(p(X,C,isin(X,B)) - D, 
		member(D - C,DCs),
		Ps).
normal(isin(A,B); P - Ag) :-
	check_normal(B; Ag), type(Ag; amount(C)),
	P = p(Y,C,isin(A,Y)).
	%revar(P).
% subclassing
normal(S; [S]) :- S = dsubclass(_,_).
% amounts (not predicates)
normal(A; A) :- type(A; amount(_)).
% 'find' command
normal(find(isin(Cl,O)); Pn) :- 
	isclass(Cl),
	normal(isin(some(Cl),O); Pn).

normal_number(A+B,sum(C)) :- 
	normal_number(A,An),
	normal_number(B,Bn),
	(Bn=sum(L) -> C=[An|L]; C=[An,Bn]).
normal_number(A,A) :- number(A).
normal_number(K,K) :- K= '$VAR'(_).


unnormal(def(N,P); def(N,Pu)) :-
	unnormal(P;Pu).
% 'own' and 'isin'
unnormal(find(X,Cl,own(O,X)); find(own(O,Cl))) :- !.
unnormal(find(X,Cl,isin(X,O)); find(isin(Cl,O))) :- !.

unnormal(lambda(X,Cx,P) - A; N) :-
	X=every(Cx), unnormal(P - A; N).
unnormal(A - B; aeq(An,Bn)) :- 
	unnormal(A; An),
	unnormal(B; Bn).
unnormal(p(X,Cx,isin(X,L)); isin(Cx,L)) :- !.
unnormal(p(X,Cx,own(H,X)); own(H,Cx)) :- !.
unnormal(sum([A]); Au) :- unnormal(A; Au), !.
unnormal(sum(As); Ag) :- 
	aggregate(As; Ag), !.
unnormal(neqs([L,R]); eq(Lu,Ru)) :- 
	unnormal_number(L,Lu),
	unnormal_number(R,Ru),!.
unnormal(E; E).

unnormal_number(sum(A), Au) :- unsum_list(A,Au).
unnormal_number(A,A) :- number(A).
unnormal_number(V,V) :- V = '$VAR'(_).

unsum_list([], 0).
unsum_list([A], Au) :- unnormal_number(A,Au).
unsum_list([A|Bs], Au + Bu) :- 
	unnormal_number(A,Au),
	unsum_list(Bs,Bu).

aggregate([A,B]; [Au,Bu]):-
	unnormal(A; Au),
	unnormal(B; Bu).
aggregate([A|As]; [Au|Aus]) :-
	unnormal(A; Au),
	aggregate(As; Aus).


revar(P) :- numbervars(P,23,24).

	
check_normal(A; Ag) :-
	isdisjunctive(A),!,disaggregate(A;Ag); 
	throw('not disjunctive'(A)).


full_disaggregate(L; Lg) :- L=[_,_|_],
	full_disaggregate(sumof(L); Lg).
full_disaggregate(sumof(As); Ds) :-
	sum(As; An),
	findall(D - C,
		(disaggregate(An; D), type(D;amount(C))),
		Ds).
full_disaggregate(A; [A - C]) :- type(A; amount(C)).
disaggregate(A + B; C) :-
	disaggregate(A; Ag), C = Ag;
	disaggregate(B; Bg), C = Bg,!.
disaggregate(A; A).





is_right_def([]).
is_right_def([D|Ds]) :-
	is_right_def(D),
	is_right_def(Ds).
is_right_def(def(X,_)) :- var(X).
