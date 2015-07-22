% :- consult(basic). % Re-consulting 'basic' makes find/3 assertions disappear. Why?
:- consult(tactics).
:- consult(linear).

choose_var([], _,_) :- throw('No more variables').
choose_var([V|_],_,V).


auto_discover :-
	auto_discover_partitions,
	auto_discover_decompositions.


auto_discover_partitions :-
	forall(
		(p(X,C,P)-_,\+ p(X,C,P)-sum(_)),
		(do_partition(p(X,C,P),auto_discover); true)).

auto_discover_decompositions :-
	forall(
		get_predicates(P),
	 	(do_decomposition(P,auto_discover); true)).

auto_define :- define_all.

auto :- 
	auto_define,
	auto_discover,
	gather_equations,
	make_numeric.

equations(Eqs) :- 
	findall(E, neqs(E), Eqs).

unknowns(Vs) :-
	findall(P-V, (find(V),P-V*_), Vs).

