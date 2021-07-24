var
	i,j,n,m:longint;
begin
	randomize;
	assign(output,'sticks26.in');rewrite(output);
	n:=10000;m:=400000;
	writeln(n);
	for i:=1 to n do
		writeln(random(1500)+1);
	writeln(m);
	for i:=1 to m do
		writeln(random(128)+1);
	close(output);
end.