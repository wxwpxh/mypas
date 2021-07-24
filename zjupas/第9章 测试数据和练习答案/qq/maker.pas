var
	s:set of 1..100;
	num,tot,i,j,n,m,t:longint;
begin
	randomize;
	for t:=0 to 9 do
	begin
		assign(output,'qq'+chr(48+t)+'.in');rewrite(output);
		n:= random(10)+1;m:= random(10)+1;
		tot:= m+3;
		writeln(tot,' ',n,' ',m);
		for i:=1 to n do
		begin
			s:=[];
			for j:=1 to m do
				begin 
					num:= random(tot)+1;
					while num in s do num:= random(tot)+1;
					s:=s+[num];
					if j=m then writeln(num) else write(num,' ');
				end;
		end;
		close(output);
	end;
end.