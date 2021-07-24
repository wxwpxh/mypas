
program star1;
var
	row,col:byte;
  begin
    for row:=1 to 7 do
    begin
    	for col:=1 to row do
    	   write('* ');
        writeln;writeln;
    end
  end.

