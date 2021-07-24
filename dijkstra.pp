program dijkstra;
var
state:array[1..100]of boolean;
data:array[1..100,1..100]of longint;
n,i,j,k,min,node:longint;
begin
	assign(input,'dijkstra.in');
	assign(output,'dijkstra.out');
	reset(input);
	rewrite(output);
	fillchar(data, sizeof(data), 0);
	fillchar(state,sizeof(state),0);
	readln(n);
	for i:=1 to n do
	for j:=1 to n do
	begin
		read(data[i,j]);
		if data[i,j]=0 then data[i,j]:=maxint;
	end;
	state[1]:=true;
	for k:=2 to n do
	begin
		min:=maxint;
		{查找权值最小的点为node}
		node:=1;
		for i:=2 to n do
		if (data[1,i]<min)and(state[i]=false) then
		begin
		min:=data[1,i];
		node:=i;
		end;
		{更新其他各点的权值}
		state[node]:=true;
		for j:=1 to n do
		if (data[1,node]+data[node,j]<data[1,j]) and (state[j]=false) then
		data[1,j]:=data[1,node]+data[node,j];
	end;
	for i:=1 to n-1 do
	if data[1,i]<>maxint then
		write(data[1,i],' ')
	else
		write(-1,' ');
	writeln(data[1,n]);
	close(input);
	close(output);

end.
