

--# -path=.:../mathres:prelude:resource-1.0/abstract
abstract ProvaGround = PredefAbs ** {
--1 Basic entities and categories

--2 Values
cat
    	ValFun;         -- A function value
	ValFun3 ;       -- A function of 2 o 3 variables.



--3 Construct ValFun3 out of components
fun
    	mkFun2 : (f,g:ValFun) ->  ValFun3 ;  -- the function with components f and g
  --	mkFun3 : (f,g,h:ValFun) -> ValFun3 ; -- the function with components f, g and h  --TODO!!!


}
