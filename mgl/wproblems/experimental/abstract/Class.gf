abstract Class = 
open
	Syntax
in
{
cat
	Object ;
	Class ; -- [Class] {2} ;
	Prop ;
fun
	istop : Class -> Prop ;
	subclass : Class -> Class -> Prop ;
	isa : Object -> Class -> Prop ;
}
