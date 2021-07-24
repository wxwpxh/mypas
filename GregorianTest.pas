Program GregorianTest(output);
type
	StringArray = array[0..6] of string[3];
var
	t: TimeStamp;
	a: StringArray;
procedure Init;
begin
	a[0] := "Sun";
	a[1] := "Mon";
	a[2] := "Tue";
	a[3] := "Wed";
	a[4] := "Thu";
	a[5] := "Fri";
	a[6] := "Sat";
end;
begin
	Init;
	GetTimeStamp(t);
	WriteLn(a[t.DayOfWeek], ' ', Date(t));
	t.Year := 1582;
	t.Month := 10;
	t.Day := 4;
	t.DayOfWeek := 4;
	WriteLn(a[t.DayOfWeek], ' ', Date(t));
end.
