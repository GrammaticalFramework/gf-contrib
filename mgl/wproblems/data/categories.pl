category(X,Cat,X-Cat) :- var(X),!.
category(define(V,_),command,R) :- category(V,variable,R).
category(define(_,A),command,R) :- category(A,amount,R).
category(V,variable,V-variable) :- V='$VAR'(_).
category([A|_],amount,R)  :- category(A,amount,R).
category([_|As],amount,R) :- category(As,amount,R).
category(aeq(A,_), prop,R) :- category(A,amount, R).
category(aeq(_,B), prop,R) :- category(B,amount, R).
category(K * _, amount, R) :- category(K,scalar,R).
category(_ * A, amount, R) :- category(A,amount,R).
category(unit(C), amount, R) :- category(C,class, R).
category(eq(A,_), equation, R) :- category(A,number,R).
category(eq(_,B), equation, R) :- category(B,number,R).
category(own(Ob,_), amount, R) :- category(Ob,object,R).
category(own(_,Cl), amount, R) :- category(Cl,class,R).