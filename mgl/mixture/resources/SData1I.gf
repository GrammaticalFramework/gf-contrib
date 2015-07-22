{-
    Copyright 2006,2008 WebALT Inc.
    This file is part of the Mathematical Grammar Library, MGL.

    MGL is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    MGL is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with MGL.  If not, see <http://www.gnu.org/licenses/>.


 History:
 $Rev::               $:  Revision of last commit
 $Author:: caprotti   $:  Author of last commit
 $Date:: 2008-09-29 1#$:  Date of last commit

-}

--# -path=.:../Ground:../lexicon:../mathres:prelude:present:mathematical

incomplete concrete SData1I of SData1 = GroundI **
open 
  Math,
  Prelude,
  (L = SData1LaTeX)
in {
--1 SData1

lin
        mean terms      = mkMathObj (DefGenCN mean_CN (andNP terms.v)) ; 			--(L.mean terms.s) terms ;    
	sdev terms 	= mkMathObj (DefGenCN standard_deviation_CN (andNP terms.v)) ; 		--(L.sdev terms.s) terms ;
	variance terms 	= mkMathObj (DefGenCN variance_CN (andNP terms.v)) ; 			--(L.variance terms.s) terms ;
	mode terms 	= mkMathObj (DefGenCN mode_CN (andNP terms.v)) ; 			--(L.mode terms.s) terms ;
	median terms 	= mkMathObj (DefGenCN median_CN (andNP terms.v)) ; 			--(L.median terms.s) terms ; 


	moment index point list =      --Index -> ValNum -> [ValNum] -> ValNum ;  
        	let i = mkOrd index.v
        	in mkMathObj (DefGenCNOrd moment_CN i (adverbNP (atAdv point.v) (andNP list.v))) ;    --(L.moment index.s point.s list.s) False;
															
}
