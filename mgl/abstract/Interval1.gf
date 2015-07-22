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
 $Date:: 2008-10-07 1#$:  Date of last commit

-}

abstract Interval1 = Ground ** {
--1 interval1
-- Both discrete and continuous 1-dimensional intervals (with open/closed end points).

fun
	integer_interval,                       -- the integer interval from a to b
	interval,                               -- the interval from a to b
	interval_oo,                            -- the open interval from a to b
	interval_cc,                            -- the closed interval from a to b
	interval_oc,                            -- the left-open interval from a to b
	interval_co : (a,b: ValNum) -> ValSet ;
}