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

incomplete concrete SData1I of SData1 =
GroundI **
open 
  Math
in {
oper
    aboutObj : MathObj -> Adv = prepAdv about_Prep ;

--1 SData1
lin
	mean terms = DefGenCN mean_CN (andNP terms) ;
	sdev terms = DefGenCN standard_deviation_CN (andNP terms) ;
	variance terms = DefGenCN variance_CN (andNP terms) ;
	mode terms = DefGenCN mode_CN (andNP terms) ;
	median terms = DefGenCN median_CN (andNP terms) ; 
	moment index point list =
        let i = mkOrd index
        in DefGenCNOrd moment_CN i (adverbNP (atAdv point) (andNP list)) ;
}
