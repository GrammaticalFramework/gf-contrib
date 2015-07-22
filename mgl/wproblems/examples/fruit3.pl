% abs:fromProp (E1owns mary (aplus (BaseAmount (gen Apple n2) (gen Banana n6))))
% Eng:Mary has two apples and six bananas .
-(p(_2, banana, own(mary, _2)), *(6, unit(banana))).
-(p(_3, apple, own(mary, _3)), *(2, unit(apple))).
% abs:fromQuestion (Q1owns mary Fruit)
% Eng:how many pieces of fruit does Mary have ?
find(_5, fruit, own(mary, _5)).
