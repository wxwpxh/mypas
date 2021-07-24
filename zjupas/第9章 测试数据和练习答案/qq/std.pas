var
	now,ans:set of 1..100;
	t,i,j,n,m,num:longint;
begin
	assign(input,'qq.in');reset(input);
	assign(output,'qq.out');rewrite(output);
	readln(t,n,m);
	ans:=[];
	for i:=1 to t do ans:=ans+[i];
	for i:=1 to n do
	begin
		now:=[];
		for j:=1 to m do 
		begin
			if j=m then readln(num) else read(num);
			now:=now+[num];
		end;
		ans:=ans*now;
	end;
	for i:=1 to t do
	if i in ans then writeln(i);
	close(input);close(output);
end.
	
		