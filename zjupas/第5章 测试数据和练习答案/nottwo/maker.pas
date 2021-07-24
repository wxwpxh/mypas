var
	i,j,n,m:longint;
begin
	randomize;
	for i:=0 to 9 do
		begin
			assign(output,'nottwo'+chr(i+48)+'.in');rewrite(output);
			if i<3 then writeln(random(15)+1,' ',random(15)+1) else
			if i<6 then writeln(random(1000)+1,' ',random(1000)+1) else
			writeln(random(1000000)+1,' ',random(1000000)+1);
			close(output);
		end;
end.