PROGRAM hl;
VAR a,b,c,s,x,area:real;
BEGIN
	write('Input a,b,c:');
	readln(a,b,c);
	If (a>0) and (b>0) and (c>0) and (a+b>c)and(a+c>b)and(b+c>a) Then
		Begin 
			s:=(a+b+c)/2;  
			x:=s*(s-a)*(s-b)*(s-c);
			If x>=0 Then 
				Begin 
					Area:=SQRT(x);
					writeln('Area=',area:8:5); 
				End;
		End
	Else 
		writeln('Input error!')
END.
