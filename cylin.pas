program cylin(input,output);
const PI=3.14159;
var
	r,h,s:real;		{r是圆柱底面半径，h是高}
begin                           //r是圆柱底面半径，h是高
	writeln('please enter radius,high');	
	read(r,h);
	s:=2*PI*r*r;
	s:=s+2*PI*r*h;
	writeln(s);
end.

