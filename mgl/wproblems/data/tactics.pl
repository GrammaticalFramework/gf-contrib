convert_to_core(Vrange,Fs) :- 
	findall(P,
		(member(F/N,Fs), functor(P,F,N), P), Ps),
	do_core(Vrange, Ps,Ns, _),
	findall(N, (member(N,Ns), asserta(N)), _).



write_goal :- 
	prolog_current_frame(Frame),
	prolog_frame_attribute(Frame,parent,PFrame),
	prolog_frame_attribute(PFrame,clause,Value),
	write(Value).


auto(Nos) :-
	Tactics = [partite_tactic, decompose_tactic],
	findall(N , 
		(member(Tac,Tactics), P - A, call(Tac, aeqs([P,A]), E), card(E,N)),
		Ns),
	sort(Ns, Nos).

findone(R, Q) :-
	findall(R, R - _, [Q|_]).


gather_equations_for(P,aeqs([P,sum(Qs)])) :- P=p(X,C,Pn),
	findall(D,
		(p(X,D,Pn)-_, D\=C, subclass(D,C)),
	LDs),
	sort(LDs, Ds),
	findall(A,
		(member(A,Ds),member(B,Ds), B\=A, subclass(A,B)),
	Dups),
	subtract(Ds,Dups,Cs),
	findall(p(X,D,Pn), member(D,Cs), Qs).


% Not using partitions: Get all equations
gather_equations :-
	findall(P-aeqs(Es),
		(setof(A, X^(p(X,_,P)-A),Es), length(Es,N), N>1),
		  PEs),
	forall(member(P-E,PEs),
		(add_rec(E, gather_equations),
		 writefd("Are equal: %w.\n", [E]))).

gather_equations(PEs) :-
	findall(p(X,C,P)-aeqs(Es),
		(setof(A, X^(p(X,C,P)-A),Es), length(Es,N), N>1),
		  PEs).

make_numeric :-
	findall(F,
			(aeqs(E), card(aeqs(E),F)),
			Fs),
	list_to_set(Fs,Ss),
	forall(member(F,Ss),
		(add_rec(F, make_numeric),
		 writefd("as number: %w;\n", [F]))).

make_model(M) :-
	gather_equations(Es),
	findall(N, (member(_-A,Es),card(A,N)), Ns),
	full_model(Ns,M).


partite_tactic(aeqs([A,B]), aeqs([Ap,Bp])) :-
	(partite_by_class(A, Ap); Ap=A),
	(partite_by_class(B, Bp); Bp=B).

partite_by_class(p(X,C,P), A) :-
	setof(Csub,
		(subclass(Csub,C), Csub\=C),
		Csubs),
	findall(Q,
		(member(D,Csubs), findone(p(X,D,P),Q)),
		 Ps),
	length(Ps,N), N > 0 -> hint_at(partite_by_class(p(X,C,P),Ps)),
	sum(Ps;A).



partite_by_elems(p(X,C,P),  S) :-
	findall(X, (isa(X,C), P - _),  Xs),
	hint_at(partite_by_elems(C)),
	sum(Xs; S).


find_partition(Pp, p(X,C,P)) :- Pp = p(X,_,P),
	writefd("Going to see what refers to %w:\n", [Pp]),
	get_psubclass(Pp; Cs),
	(get_duplicates(Cs, Ms),!; Ms=[]),
	subtract(Cs,Ms,Ds),
	setof(C,
		X^A^(member(C,Ds),p(X,C,P)-A),
		Es),
	member(C,Es).

do_partition(Pp,Tag) :-
	setof(S, find_partition(Pp,S), Ss),
	%% by_rec(discover_partition(Pp), deduced),
	%simplify(sum(Ss); Sms),
	Sm = sum(Ss),
	add_rec(Pp - Sm, Tag),
	writefd("Found that %w = %w.\n", [Pp,Sm]).


find_decomposition(Pp,B) :- decompose_tactic(Pp,B).


do_decomposition(Pp,Tag) :-
	find_decomposition(Pp,B),
	add_rec(Pp - B, Tag),
	writefd("Found that %w decomposes as %w.\n", [Pp,B]).




get_predicates(P) :- P-_, P=p(_,_,_).
get_predicates(P) :-
	aeqs(As), member(P-_,As), P=p(_,_,_).

get_psubclass(p(_,C,P); Us) :-
	setof(D,
		X^A^(p(X,D,P)-A, D\=C, subclass(D,C)),
		Ds),
	forall(member(D,Ds), writefd("%w is a kind of %w;\n", [D,C])),
	list_to_set(Ds,Us).


get_duplicates(Cs, Dss) :-
	setof((D-C),
		(member(C,Cs), member(D,Cs), C\=D, subclass(D,C)),
		Ms),
	forall(member(D-C,Ms), writefd("but %w is also a kind of %w;\n", [D,C])),
	findall(D, member(D-_,Ms),Ds),
	list_to_set(Ds,Dss).

decompose_tactic(P, sum(Bs)) :- P = p(_,_,_),
	findall(C, decompose_by(P,C), Cs),
	lub(Cs;D),
	decompose(D,P; compose(_,Q)),
	partite_by_class(Q,A), unsum(A;As),
	findall(L,
		(member(B,As), L=compose(_,B), decompose(_,P; L)),
		Bs).
	%sum(Bs; B).

decompose_tactic(aeqs(As), aeqs(Bs)) :-
	findall(Bd, (member(B,As), (decompose_tactic(B,Bd); Bd=B)), Bs).


unzip([],[],[]).
unzip([A - B|ABs], [A|As], Bss) :- 
	unzip(ABs, As, Bs), append(B,Bs,Bss).

decompose_by(P,C) :-
	decompose(C,P; compose(F,Q)),
	F - _, Q - _, type(Q;amount(C)),
	writefd("You may consider %w and %w.\n", [F,Q]).




hint_at(P) :- recordz(hint, P).



check_classes :- 
	findall(C, (_-A, type(A;amount(C)),\+ isclass(C)), Cs),
	sort(Cs, Us),
	forall(member(D,Us), writefd("'%w' is not a class.\n", [D])).



safe(Goal, Exc) :- Goal,!; throw(Exc).  



