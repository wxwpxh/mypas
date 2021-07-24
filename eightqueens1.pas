program eightqueens1(input,output);
var
   x:array[1..8] of integer;
   a,b,c:array[-7..16] of boolean;
   i:integer;
  procedure print;
   var k:integer; 
   begin
     for k:=1 to 8 do write(x[k]:4);
     writeln;
   end;
  procedure try(i:integer);
   var j:integer;
   begin 
     for j:=1 to 8 do
       if a[j] and b[i+j] and c[i-j] 
	    then begin
          x:=j;
          a[j]:=false;
          b[i+j]:=false;
          c[i-j]:=false;
       if i<8 then try(i+1)
   	    else print;
     a[j]:=true;
     b[i+j]:=true;
     c[i-j]:=true
  end 
 end;
 begin
   for i:=-7 to 16 do
     begin
       a:=true;
       b:=true;
       c:=true
     end;
   try(1);
　end.
