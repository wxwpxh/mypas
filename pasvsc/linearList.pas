program linearList;
const maxlen=100;
type mylist=record
   data : array[1..maxlen] of char;
   last : 0..maxlen
end;
var
  i,p: integer;
  l,l1,l2 : mylist;
  x:char;
function length(var sq:mylist) : integer;
begin
  length :=sq.last;
end;

function locate(var sq:mylist;x:char):integer;
var
  i:integer;
begin
  for i:=1 to length(sq) do begin
    if(sq.data[i]=x) then begin
      exit(i);
    end;
  end;
  exit(0);
end;

procedure intlist(var sq:mylist);
begin
  randomize;
  for i:=1 to 10 do
      begin
      sq.data[i]:=chr(65+round(random(26)));
      inc(sq.last);
      end;
end;
procedure intlist0(var sq:mylist);
begin
      sq.last:=0
end;
procedure printlist(var sq:mylist);
begin
    for i:=1 to length(sq) do write(sq.data[i]);
    writeln;
end;
procedure insert(var sq:mylist;x:char;p:integer);
var
  i:integer;
begin
  for i:=sq.last+1 downto p do
  sq.data[i+1]:=sq.data[i];
  sq.data[p]:=x;
  sq.last:=sq.last+1;
end;
procedure delete(var sq:mylist;p:integer);
var
  i:integer;
begin
  for i:=p to sq.last do
  sq.data[i]:=sq.data[i+1];
  sq.last:=sq.last-1;
end;
procedure merge(var A:mylist;B:mylist);
var
  i:integer;
begin
  for i:=1 to B.last do begin
       if(locate(A,B.data[i])=0) then insert(A,B.data[i],length(A)+1);
  end;
end;

procedure merge_list( A,B:mylist;var C:mylist);
{已知非递减线性表A、B，合并后的C仍然非递减}
var
  i,j,k:integer;
begin
    intlist0(C);
    i:=1;j:=1;k:=0;
    while(i<=length(A))and(j<=length(B)) do
	if ord(A.data[i]) <=ord(B.data[j]) then
	    begin
		insert(C,A.data[i],k+1);
		k:=k+1;
		i:=i+1;
            end
        else begin
		insert(C,B.data[j],k+1);
		k:=k+1;
		j:=j+1;
        end; 
   while i<=length(A) do begin
		insert(C,A.data[i],k+1);
		k:=k+1;
		i:=i+1;
            end;
   while j<=length(B) do begin
		insert(C,B.data[j],k+1);
		k:=k+1;
		j:=j+1;
        end; 
end;

begin
  intlist(l);
  printlist(l);	
  writeln('输入一个字符和整数如:c 4,将字符c插如到第四个字符:');
  readln(x,p);
  insert(l,x,p);
  printlist(l);
  writeln('输入一个整数如:4,将字符第四个字符删除');
  readln(p);
  delete(l,p);
  printlist(l);
  writeln('合并两个线性表:');
  intlist(l1);
  printlist(l1);  
  merge(l,l1);
  printlist(l);
  intlist0(l); intlist0(l1);
  for i:=1 to 10 do
      begin
	if (i<=5) then begin
		insert(l,chr(65+2*i),i);
		insert(l1,chr(65+2*i-1),i)
		end
	else begin
		insert(l,chr(65+11+i),i);
		insert(l1,chr(65+14+i),i)
	end;
      end;
  printlist(l);    
  printlist(l1);  
  merge_list(l,l1,l2);
  printlist(l2);
end.
