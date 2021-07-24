Program formats;
const
	multiplier=10;
	finalvalue=1000000;
var
	power:longint;	
begin
	power:=multiplier;
	REPEAT
	    WriteLn('*',pred(power):1,'*');
	    power:=power*multiplier
	UNTIL power > finalvalue
end.
