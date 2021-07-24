PROGRAM area2(input,output);
VAR 
	l1,l2,l3,l4,l5,l6,l7:real;
	function ts(x,y,z:real):real;
	var s:real;
	begin
		s:=(x+y+z)/2;
		ts:=sqrt(s*(s-x)*(s-y)*(s-z))
	end;	
BEGIN
	writeln('l1,l2,l3,l4,l5,l6,l7:');
	read(l1,l2,l3,l4,l5,l6,l7);
	writeln(ts(l1,l2,l3)+ts(l3,l4,l5)+ts(l5,l6,l7))
END.
