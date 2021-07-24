{
    This file is part of the Free Pascal run time library.
    Copyright (c) 1993-98 by the Free Pascal Development Team

    Hello World Example

    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 **********************************************************************}

program circle(input,output);
const PI=3.14159;
var
	r,l,s:real;
begin
	read(r);
	l:=2*PI*r;
	s:=PI*r*r;
	writeln(r,l,s);
end.

