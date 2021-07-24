Program Example03(input,output);
var
	i,x,y,sum:integer;
begin
	write('x=');read(x);
	sum:=0;i:=0;
	for y:=1 to x do
		if x mod y=0
			then begin
					write(y:8);
					i:=i+1;
					if i mod 5 =0 then writeln;
					sum:=sum+y;
				 end;
	writeln;				 
	WriteLn('sum=',sum);
end.
