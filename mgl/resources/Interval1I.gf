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
 $Author:: saludes    $:  Author of last commit
 $Date:: 2008-10-05 0#$:  Date of last commit

-}

incomplete concrete Interval1I of Interval1 =
GroundI **
{
oper
    rangeFromTo : CN -> (x0,x1:MathObj) -> MathObj =
        \n,lo,hi -> onRange (DefSgNP n) lo hi ;


    oc_interval_oper : CN = variants
		{	byLeft open_interval_CN ;
			byRight closed_interval_CN
		} ;
    co_interval_oper : CN = variants
		{	byLeft closed_interval_CN ;
			byRight open_interval_CN
		} ;

--1 interval1 based on ISO_31-11
lin
	integer_interval = rangeFromTo integral_interval_CN  ;
	interval	 = rangeFromTo interval_CN ;
	interval_oo	 = rangeFromTo open_interval_CN ;
	interval_cc	 = rangeFromTo closed_interval_CN ;
	interval_oc	 = rangeFromTo oc_interval_oper ;
	interval_co	 = rangeFromTo co_interval_oper ; 
}
