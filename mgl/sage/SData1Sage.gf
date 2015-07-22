--# -path=.:../Ground:../lexicon

concrete SData1Sage of SData1 =  GroundSage **
open 
	myFormal,
	mySage in
{
oper
	delimited_command_list: Str -> TermPrec -> TermPrec = 
		\com,x -> mkPrec highest (com ++ "([" ++ (usePrec 0 x) ++ "])" ) ; 

--2 s_data1
lin
	mean l 	  	= delimited_command_list "mean" (mkPrec 1 l.s) ;   			-- mean(l)
	sdev l 	  	= delimited_command_list "std" (mkPrec 1 l.s);  			-- std(l)
	variance l 	= delimited_command_list "variance" (mkPrec 1 l.s) ;			-- variance(l) 
	mode l 		= delimited "mode_sage([" "])" (mkPrec 1 l.s);				-- multimodality returns an error 
	median l	= delimited_command_list "median" (mkPrec 1 l.s);			-- median(l)
	moment n w xs  	= mkPrec highest ("moment(" ++ n.s ++ "," ++ w.s ++ ", [" ++ xs.s ++ "] )" ) ; 
											-- moment(n, w, [xs]) defined in prelude.sage (sample moment)
											-- moment: Index -> ValNum -> [ValNum] -> ValNum ;     
											-- the nth moment of x, y and z about w
}

