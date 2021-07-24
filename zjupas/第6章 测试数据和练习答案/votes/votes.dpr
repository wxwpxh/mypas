program votes;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  MaxN = 5000;  

var
  t, i, j, N, Cur : Longint;
  Counter : array [-1..MaxN + 1] of Longint;
  Num : String;

  procedure Solve;
  begin
    Readln(N);
    Fillchar(Counter, Sizeof(Counter), 0);
    Repeat
      Read(Cur);
      Inc(Counter[Cur]);
    Until Cur = -1;

    for i := 1 to N do
      Writeln(i, ' ', Counter[i]);
  end;

begin
  for t := 1 to 10 do
  begin
    Num := IntToStr(t);
    Assign(input, 'votes' + Num + '.in');
    Reset(input);
    Assign(output, 'votes' + Num + '.out');
    Rewrite(output);
    Solve;
    Close(input);
    Close(output);
  end;
end.
