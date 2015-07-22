% abs:fromProp (E1owns john (gen Fruit n7))
% Eng:John has seven fruit .
-(p(_1, fruit, own(john, _1)), *(7, unit(fruit))).
% abs:fromProp (E1owns john (aplus (ConsAmount (gen Apple n2) (BaseAmount (some Orange) (gen Banana n3)))))
% Eng:John has two apples , some oranges and three bananas .
-(p(_5, apple, own(john, _5)), *(2, unit(apple))).
-(p(_6, banana, own(john, _6)), *(3, unit(banana))).
-(p(_7, orange, own(john, _7)), some(orange)).
% abs:fromQuestion (Q1owns john Orange)
% Eng:how many oranges does John have ?
find(_19, orange, own(john, _19)).
