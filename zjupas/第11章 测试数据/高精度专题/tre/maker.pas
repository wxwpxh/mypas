var
	testcase,i,j,n,m:longint;
begin
	randomize;
	for testcase:=0 to 9 do
		begin
			assign(output,'tre'+char(48+testcase)+'.in');rewrite(output);
			n:=random(1000)+1;
			if testcase<5 then writeln('M ',n) else writeln('D ',n);
			for i:=1 to n do write(char(48+random(10)));
			if testcase<5 then write('*') else write('/');
			for i:=1 to 1 do write(char(49+random(9)));
			writeln;
			close(output);
		end;
end.