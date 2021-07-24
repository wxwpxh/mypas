program shuzu11;
const  n=100;
var  a:array[1..n] of boolean;
i,j,k:integer;
begin
	for i:=1 to n do a[i]:=true;
	for i:=2 to n do
		for j:=i to n do
			if j mod i=0 then a[j]:=not(a[j]);
		for i:=1 to n do
			if a[i] then write(i:5);
		readln
end.
