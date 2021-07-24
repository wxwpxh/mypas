program DataGen;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i, t, N : Longint;
  Num : String;

  procedure Work;
  begin
    N := Random(1000) + 1;
    Writeln(N);

    for i := 1 to N do
      Writeln(Random(8000000) + 1);
  end;

begin
  Randomize;
  for t := 1 to 10 do
  begin
    Num := IntToStr(t);
    Assign(output, 'sort' + Num + '.in');
    Rewrite(output);
    Work;
    Close(output);
  end;
end.

