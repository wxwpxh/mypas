PROGRAM number;
VAR p:array[1..30000] of longint;
    s:array[1..200000] of integer;
    max:array[1..200000] of longint;
var tt,k,m,i:longint;
    t,j,a,b:longint;
    pa,pb:longint;
    ss:array[1..100] of byte;
BEGIN
assign(input,'number10.in');
reset(input);
assign(output,'number10.out');
rewrite(output);
readln(k,m);
fillchar(p,sizeof(p),0);
p[1]:=1;
a:=1;
b:=1;
for i:=2 to k do
  begin
  pa:=p[a]*2+1;
  pb:=p[b]*4+5;
  if pa<=pb then
    begin
    if pa=pb then inc(b);
    p[i]:=pa;
    inc(a);
    end
  else
    begin
    p[i]:=pb;
    inc(b);
    end;
  end;
t:=0;
for i:=1 to k do
  begin
  tt:=0;
  while p[i]>0 do
    begin
    inc(tt);
    ss[tt]:=p[i] mod 10;
    p[i]:=p[i] div 10;
    end;
  for j:=tt downto 1 do
    begin
    inc(t);
    s[t]:=ss[j];
    end;
  end;

for i:=1 to t do
  write(s[i]);
writeln;
max[t]:=t;
tt:=t;
for i:=t-1 downto 1 do
  if s[i]>=s[max[i+1]] then max[i]:=i else max[i]:=max[i+1];
i:=1;
while i<=t do
  begin
  if m=0 then break;
  if m=t-i+1 then
    begin
    i:=t+1;
    break;
    end;
  if (max[i]=i) then
    begin
    write(s[i]);
    inc(i);
    end
  else
    begin
    if (m+i)<max[i] then
      begin
      t:=max[i]-1;
      max[t]:=t;
      for j:=t-1 downto i do
        if s[j]>=s[max[j+1]] then max[j]:=j else max[j]:=max[j+1];
      end
    else
      begin
      inc(i);
      dec(m);
      end;
    end;
  end;
for i:=i to tt do
  write(s[i]);
writeln;
close(output);
close(input);
END.
