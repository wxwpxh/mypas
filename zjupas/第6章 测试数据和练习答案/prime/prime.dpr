program prime;
uses
  SysUtils;
const
  MaxN = 2000000;
var
  i, j, k, N, TestCaseCount : Longint;
  Flag : Array [0..MaxN + 1] of Boolean;
  Num : String;

  procedure Solve;
  var
    IsFirst : Boolean;
  begin
    Read(N);
    FillChar(Flag, SizeOf(Flag), True);
    IsFirst := True;
    for j := 2 to N do
      if Flag[j] then
      begin
        for k := j to (N div j) do
          Flag[j * k] := False;

        if IsFirst then
        begin
          Write(j);
          IsFirst := False;
        end
        else
          Write(' ', j);
      end;
  end;

begin
  for i := 1 to 10 do
  begin
    Num := IntToStr(i);
    Assign(input, 'prime' + Num + '.in');
    Reset(input);
    Assign(output, 'prime' + Num + '.out');
    Rewrite(output);
    Solve;
    Close(input);
    Close(output);
  end;
end.
