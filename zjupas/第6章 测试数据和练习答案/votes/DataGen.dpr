program DataGen;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  t, i, N : Longint;
  Num : String;

  procedure Work;
  begin
    N := Random(1000) + 1;
    Writeln(N);
    for i := 1 to (N shl 6) do
      Write(Random(N) + 1, ' ');
    Writeln(-1);
  end;

begin
  Randomize;

  for t := 1 to 10 do
  begin
    Num := IntToStr(t);
    Assign(output, 'votes' + Num + '.in');
    Rewrite(output);
    Work;
    Close(output);
  end;
end.
