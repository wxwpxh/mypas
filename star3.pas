
program star3;
var
	row,col,n:byte;
  begin
    n:=7;	
    for row:=1 to n do
    begin
    	for col:=1 to (n-row)+1 do
	   write(' ');
	for col:=1 to 2*row-1 do
	   write('*');
        writeln;
    end
  end.

