%
:- consult(tactics).
:- consult(categories).
:- dynamic defined/2, solutions/1.

choose_var(Vs,P,A) :-
	choose(P,Vs,A).


%choose(P,Vs,A) :-
%	notify(P),
%	(obtain(chosen(P,A)); !, ask(choose(Vs))).


all_related(Pu, Ams) :-
	setof(A, get_related(Pu,A), Ams).

get_related(Pu, aeq(Pu,Am)) :-
	normal(Pu; Pn),
	related(Pn,An),
	unnormal(An; Am).

direct_related(Pn, A) :- Pn-A. % remove_sum(S;A).
related(Pn, As) :- direct_related(Pn,Q), Q=p(_,_,_), related(Q,As).
related(Pn, As) :- direct_related(Pn,As).
remove_sum(sum([S]); S).
remove_sum(sum(Ss); Ss).
remove_sum(S; S).

%% Top goal
%%
% Take a list of commands (going from ambiguous parsing of usr command) and
% use the first that succeds
interact_many(Cmds, O) :-
	member(Cmd,Cmds),
	interact(Cmd, O).
% Take user command Cmd, give feedback O.
interact(Cmd, O) :- var(Cmd),
	help_all(help, O).
interact(tell(S), Out) :- tell_about(S, Out).
interact(Cmd, Out) :- help_all(Cmd, Out).

% Command: tell about variable or amount predicate
tell_about(V, O) :- V = '$VAR'(_),
	is_defined(V, O).
tell_about(Pu, told(A)) :- 
	all_related(Pu, A).
tell_about(_, none).

is_defined(V, told(def(V,Pu))) :-
	defined(V,Pn),
	safe(unnormal(Pn;Pu), 'unnormal failed').
is_defined(_, none).


help_all(Cmd, Out) :-
	help_define_all(Cmd, Out), Out\=true.
	% writefd("EXITING help_all coming from define with %w\n", [Out]).
help_all(Cmd, Out) :-
	help_discover_relations(Cmd, Out), Out\=true.
	% writefd("EXITING help_all coming from discover with %w\n", [Out]).
help_all(Cmd, Out) :-
	help_write_equations(Cmd, Out), Out\=true.
	% current_model(M),
	% writefd("EXITING help_all coming from write with '%w'. Model is %w.\n", [Out,M]).
help_all(Cmd, Out) :- 
	help_show_solution(Cmd, Out).




display_all_equations(S) :-
	findall(Eu ,
		(neqs(_)=E, E, unnormal(E;Eu)),
		Eus),
	list_to_set(Eus,S).


%% Goal
%% help_show_solution

help_show_solution(_, solutions(Ds)) :- \+ solutions(_),
	describe_solutions(Ds),
	add_rec(solutions(Ds), model).
help_show_solution(_, true).




%% Goal help_write_equations
%%
help_write_equations(Cmd, Out) :-
	%(P-_,needs_equation(P)) -> help_equation(P, Cmd,Ex).
	suggest_predicate(P,_) ->  help_equation(P, Cmd, Out).
help_write_equations(_, true).


needs_equation(P) :-
	P-_,
	find_equation(P,Eq),
	full_model([Eq], M1),
	\+ find_equivalent(M1,_).

current_model(M) :-
	findall(E, (E=neqs(_),E), Es),
	full_model(Es,M).

enough_equations :-
	current_model(Mp),
	make_model(M),
	equivalent(Mp,M).


find_equivalent(M1,M2) :-
	neqs(E),
	full_model([neqs(E)], M2),
	equivalent(M1,M2).


help_equation(Pn, help,hint(write_eq(Aeq))) :-
	unnormal(Pn; Pu),
	get_related(Pu, Aeq).
help_equation(Pn, example, Ex) :- help_equation(Pn, help, Ex). % not implemented
	% get_categories(eq(_,_), equation, Ex).
help_equation(Pn, Eu, Out) :-
	normal(Eu;E2),
	check_for_equation(Pn,E2, Out).
	%find_equation(Pn, E1),
	%full_model([E1],M1),
	%check_equations(Pn, M1, [E2], Ex).
help_equation(Pn,_, Ex) :- help_equation(Pn,help, Ex).


check_for_equation(_,E, O) :-
	is_compatible([],E, O).
check_for_equation(Pn,Ep, O) :-
	find_equation(Pn, E1),
	is_compatible([Pn-E1], Ep, O).
check_for_equation(_,E, O) :-
	gather_equations(PAs),
	(is_full_compatible(PAs, E, O);
	 is_entailed(PAs, E, O)).
check_for_equation(_,E, ok) :-
	 add_rec(E, model).

find_equation(P, N) :-
	gather_equations_for(P, E),
	card(E, N),
	full_model([N], M) -> M\=[].

check_equations(Pn,_,Es, inconsistent(Pn,Es)) :-
	full_model(Es,M),
	length(Es,Ne),
	length(M,Nm),
	Nm < Ne.
check_equations(Pn,Mb,Es, Ex) :-
	are_compatible(Pn,Mb,Es, Ex).
check_equations(Pn,Mb,Es, Ex) :-
	are_equivalent(Pn,Mb,Es, Ex).
check_equations(_,_,Es, ok) :-
	forall(member(E,Es),
		add_rec(E, model)).


is_compatible([], E, inconsistent) :-
	\+ full_model([E],_).	
is_compatible(PAs, E, incompatible(Pi)) :-
	findall(P-N,
		(member(P-A,PAs),card(A,N),!),
		PNs),
	findall(N, member(_-N,PNs), Ns),
	findall(P, member(P-_,PNs), Ps),
	full_model(Ns,M1),
	full_model([E],[Et]),!,
	\+ compatible(Et,M1),
	maplist(sunnormal, Ps, Pus),
	flatten_single(Pus,Pi).

flatten_single([A], A). % remove list if singleton
flatten_single(B, B).


sunnormal(A,B) :- unnormal(A;B).

is_full_compatible(PAs,E, Out) :-
	all_subsets(PAs, SPAs),
	member(SPA, SPAs),
	is_compatible(SPA,E, Out).

fsubset([],_).
fsubset(C, B) :- C = [A|As],
	member(A,B),
	delete(B,A,Bp),
	fsubset(As,Bp),
	is_set(C),
	sort(C,C).

all_subsets(C,Sp) :-
	setof(N-D, 
		(fsubset(D,C), length(D,N)),
		 NDs),
	keysort(NDs,Ds),
	findall(X, member(_-X,Ds), Sp).


is_entailed(PAs,E, not_entailed) :-
	findall(N,
		(member(_-A,PAs),card(A,N)),
		Ns),
	full_model(Ns,M),
	full_model([E],Mp),
	\+ entails(M,Mp).


suggest_predicate(P,N) :-
	gather_equations(Es),
	current_model(M),
	member(P-A,Es),
	amount_not_entailed(M,A,N).

amount_not_entailed(M,A,N) :-
	safe(
		(card(A,N),full_model([N],Nn)),
		'amount_not_entailed'(M,A,N)),
	\+ entails(M,Nn).

are_compatible(_,_,Es, incomplete) :- var(Es).
are_compatible(Pn,Mb, [E|_], incompatible(E,Pu)) :-
	full_model([E],[N]),
	\+ compatible(N,Mb),
	unnormal(Pn; Pu).
are_compatible(Pn,Mb,[_|Es], Ex) :-
	are_compatible(Pn,Mb,Es, Ex).

are_equivalent(Pn,Mb,Es, overdetermined(Es,Pu)) :-
	full_model(Es,M),
	\+ entails(Mb,M),
	unnormal(Pn; Pu).






%% Goal help_discover_relations
%% this goal consists of:
%%  * Partite
%%  * Decompose



help_discover_relations(Cmd, Ex) :-
	help_discover_all(Cmd, Ex).
	% writefd("EXITING help_discover_relations with %w\n", [Ex]).

help_discover_all(Cmd, Ex) :-
	(P-_,\+ P-sum(_),find_partition(P,_)) -> help_partition(P, Cmd,Ex).
help_discover_all(Cmd, Ex) :-
	(_-Qs, member(Q,Qs), \+ Q-_, find_partition(Q,_)) -> help_partition(Q, Cmd,Ex). 
help_discover_all(_, true).


% A _partition_ is an equality 
% Predicate - sum Predicate_i where
% Predicate_i (Pi) are disjoint
% Pi is a subclass of Predicate (Pi < P)
% Predicate is the union of Predicate_i
%   (what is checked is that P < Predicate => exists Pi. P < Pi)
% Move a plain Predicate = Amount into a
% Core Predicate - list (Core Predicate)
% Partitions are identified in core by: Pn - sum([Amount])
% the 'sum' is an attribute that carries the fact that [Amount] as Amount is disjoint
% it must be removed when converted to plain.

partition_to_core(aeq(Pu,Am); Pn-An) :- % still no 'sum' at Am
	normal(Pu;Pn),
	amount_to_sum(Am;An).
amount_to_sum(V;V) :- var(V).
amount_to_sum([];[]).
amount_to_sum([A|As];[B|Bs]) :-
	as_predicate(A;B),
	amount_to_sum(As;Bs).
amount_to_sum(A;[B]) :- as_predicate(A;B).
as_predicate(Pu;Pn) :- 
	normal(Pu;Pn),
	Pn=p(_,_,_).
as_predicate(A;Pn) :- Pn-A. 

partition_to_plain(Pn-sum(S); aeq(Pu,Am)) :-
	unnormal(Pn; Pu),
	sum_to_amount(S; Am).
sum_to_amount([];[]).
sum_to_amount([An];A) :- unnormal(An; A).
sum_to_amount([An|Ans]; [A|As]) :- 
	unnormal(An; A),
	unnormal(Ans; As).


help_partition(Pn, help, hint(partite(Pu))) :-
	unnormal(Pn; Pu).
help_partition(Pn, example, Ex) :- % plain example, no 'sum'
	unnormal(Pn; Pu),
	% Pn = p(X,C,Q),
	get_categories(aeq(Pu,[_,_]),prop, Ex).
help_partition(Pn, aeq(Qu,_), hint(partite(Pu))) :-  % must relate to Pn
	unnormal(Pn;Pu), Pu\=Qu.
help_partition(Pn, L, Ex) :- % L is plain: no 'sum'
	partition_to_core(L; _-S),
	check_partition(Pn, S, Ex). % must add 'sum' in S 
	% writefd("EXITING help_partition with %w\n", [Ex]).
help_partition(P,_,Ex) :- help_partition(P,help,Ex).

get_categories(A,Cat, example(Rs,A)) :-
	bagof(R, category(A,Cat,R), Rs).

make_example(example([],A), A).
make_example(example([X-S|Rs],A), B) :- X=S,
	make_example(example(Rs,A), B).




make_partition(P,Qs,Q-_, Qns, Ex) :- Qns = [Q|Qs],
	valid_partition(P,Qns, Ex).


%% Used by help_partition goal
% Pn: core predicate
% L: list (not sum) of core predicates
% Ex: feedback
check_partition(_,L, incomplete) :- var(L).
check_partition(_,[], empty).
check_partition(Pn,L, Ex) :-
	forall_psubclass(Pn,L,Ex).
check_partition(_,L,Ex) :-
		forall_disjoint(L, Ex).
check_partition(Pn,L, Ex) :-
		covers(Pn,L, Ex).
check_partition(Pn,L, ok) :-
	simplify(L; S),
	add_rec(Pn - sum(S), deduced). % mark it as a partition (with 'sum')
	% writefd("GOING TO GIVE OK\n",[]).


eand(ok(_),E,E).
eand(E,ok(_),E).
eand(V,E,E) :- var(V).
eand(E,V,E) :- var(V).
eand(E,_,E).

% Pn: core predicate
% L: list of core predicates
% Ex: feedback
forall_psubclass(_,L, incomplete) :- var(L).
forall_psubclass(p(X,C,F),[p(X,D,G)|_], unrelated(Qu,Pu)) :-
	F \= G,
	unnormal(p(X,C,F); Qu),
	unnormal(p(X,D,G); Pu).
forall_psubclass(p(_,C,_), [p(_,D,_)|_], superclass(D,C)) :- 
	subclass(C,D).
forall_psubclass(p(_,C,_), [p(_,D,_)|_], not_subclass(D,C)) :- 
	\+ subclass(D,C).
forall_psubclass(Pn, [_|L], Ex) :- forall_psubclass(Pn,L, Ex).

forall_disjoint(L, incomplete) :- var(L).
%forall_disjoint([], ok).
%forall_disjoint([_], ok).
forall_disjoint([Pu|L], Ex) :- 
	normal(Pu; p(_,C,_)),
	forall_disjoint_with(C,L, Ex), Ex\=ok;
	forall_disjoint(L, Ex).

forall_disjoint_with(_,L, _) :- var(L).
forall_disjoint_with(_,[], ok).
forall_disjoint_with(C,[Pu|_], not_disjoint(C,D)) :- 
	normal(Pu; p(_,D,_)),
	(subclass(C,D); subclass(D,C)).
forall_disjoint_with(C,[_|L], Ex) :- forall_disjoint_with(C,L, Ex).

covers(_,L, incomplete) :- var(L).
covers(p(X,C,P),L, not_covering(R)) :- 
	get_psubclass(p(X,C,P); Cs),
	findall(D, (member(Qu,L),normal(Qu;p(_,D,_))), Ds),
	findall(X,
		(member(X,Cs), member(D,Ds), subclass(X,D)), Ms),
	subtract(Cs,Ms,[R|_]).




% A _decomposition_ splits {x:C | P x} into
% (y:D -> {x:C | R x y }) `compose` {y:D | Q y}
% whether P x :- exists y. R x y, Q y.
% In this implementation we consider only P,Q,R = isin.

help_decomposition(Pn, help, hint(decompose(Pu))) :-
	unnormal(Pn; Pu).
help_decomposition(Pn, compound(isin,_,D,Ob), _) :-
	find_decomposition(Pn,sum(Bs)),
	Cp = compose(lambda(Y,D,p(X,isin(X,Y))), p(Z,D,isin(Z,Ob))),
	member(Cp,Bs).




%% Goal:
%% help_define_all

help_define_all(Cmd, Ex) :- 
	must_define(P) ->  help_define(P, Cmd, Ex); Ex=true.

%% help_define goal
help_define(P,help, hint(define(Pu))) :-
	unnormal(P; Pu).
help_define(P,example, Ex) :- 
	example_pattern(P;Pu),
	get_categories(define(_,Pu), command, Ex).
help_define(P,define(V,Q), Ex) :- check_define(P,Q,V, Ex).
help_define(P,_, Ex) :- help_define(P, help, Ex).

example_pattern(P; own(_,_)) :- unnormal(P; own(_,_)).
example_pattern(P; isin(_,_)) :- unnormal(P; isin(_,_)). 

define_message(P, msg(help_define(P), define(P))).
check_define(P,Qu,_, hint(define(Pu))) :-
	unnormal(P; Pu),
	Pu \= Qu.
check_define(_,_,X, already_defined(X,Au)) :- 
	defined(X,An), unnormal(An;Au).
check_define(P,Qu,_, not_found(Qu)) :-
	normal(Qu; Q),
	Q = P, P = p(X,Cl,Pp),
	\+ (Q -_), \+ find(X,Cl,Pp).
check_define(P,Qu,X, ok) :- 
	normal(Qu; P),
	define(P,X, user_define).






start(help_define_all,'We are going to define all which needs definition.').
start(_,'New goal').

finish(help_define_all, 'You have now all defined').
finish(_,'Exit goal').

feedback(_,_,_) :- fail.

mkExample(L,Pt,Ex) :- member(Ex,L), Pt=Ex.
