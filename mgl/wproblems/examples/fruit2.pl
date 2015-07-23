% abs:fromProp (E1owns john (aplus (ConsAmount (gen (Qual red Apple) n2) (BaseAmount (some Orange) (gen (Qual green Banana) n3)))))
% Eng:John has two red apples , some oranges and three green bananas .
-(p(_3, adj(red, apple), own(john, _3)), *(2, unit(adj(red, apple)))).
-(p(_4, adj(green, banana), own(john, _4)), *(3, unit(adj(green, banana)))).
-(p(_5, orange, own(john, _5)), some(orange)).
% abs:fromProp (E1owns john (gen Fruit n7))
% Eng:John has seven fruit .
-(p(_7, fruit, own(john, _7)), *(7, unit(fruit))).
% abs:fromQuestion (Q1owns john Apple)
% Eng:how many apples does John have ?
find(_9, apple, own(john, _9)).
