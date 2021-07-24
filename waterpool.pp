{
./waterpool 
6 6
1 2 3 4 5 6
1
1 2 3 4 5 

}
program waterpool;
type pool=record
  left:integer;
  right:integer;
  data:integer;
  end;
var
  n,r,i,j,p:integer;
  a:array[1..1000] of pool;
  tmp:pool;
begin
  readln(n,r);
  for i:=1 to n do begin
    read(a[i].data);
    a[i].right:=a[i].data+r;
    a[i].left:=a[i].data-r;
    if(a[i].left<0) then a[i].left:=0;
  end;
  readln;
  for i:=1 to n-1 do
    for j:=i+1 to n do begin
       if(a[i].data>a[j].data) then begin
         tmp:=a[i];
         a[i]:=a[j];
         a[j]:=tmp;
       end;
    end;
  i:=1;
  p:=n;
  while(i<=n) do begin
    if(a[i].left>=a[i+1].left)and(a[i].right<=a[i+1].right) then dec(p);
    inc(i);
  end;
  writeln(p);
  readln;
end.
