program eightqueens1(input,output);
	var a:array [1..8] of integer;
	b,c,d:array [-7..16] of integer;
	t,i,j,k:integer;

procedure print;
begin
	t:=t+1;
	write(t,' ');
	for k:=1 to 8 do write(a[k],' ');
	writeln;
end;

procedure mytry(i:integer);
	var j:integer;
begin
	for j:=1 to 8 do {每个皇后都有8种可能位置}
		if (b[j]=0) and (c[i+j]=0) and (d[i-j]=0) then {判断位置是否冲突}
		begin
			a[i]:=j; {摆放皇后}
			b[j]:=1; {宣布占领第J行}
			c[i+j]:=1; {占领两个对角线}
			d[i-j]:=1;
			if i<8 then mytry(i+1) {8个皇后没有摆完，递归摆放下一皇后}
			else print; {完成任务，打印结果}
			b[j]:=0; {回溯}
			c[i+j]:=0;
			d[i-j]:=0;
		end;
end;

begin
	for k:=-7 to 16 do {数据初始化}
	begin
		b[k]:=0;
		c[k]:=0;
		d[k]:=0;
	end;
	mytry(1);{从第1个皇后开始放置}
end.