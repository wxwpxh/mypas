program DataGen;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i, t, N, K : Longint;
  Num : String;

  procedure Work;
  begin
    N := Random(1500) + 1;
    Writeln(N);
    K := Random(N) + 1;
    Writeln(K);

    for i := 1 to N - 1 do
      Write(Random(600) + 1, ' ');
    Writeln(Random(600) + 1);

    for i := 1 to K - 1 do
      Write(Random(600) + 1, ' ');
    Writeln(Random(600) + 1);
  end;

begin
  Randomize;
  for t := 1 to 10 do
  begin
    Num := IntToStr(t);
    Assign(output, 'find' + Num + '.in');
    Rewrite(output);
    Work;
    Close(output);
  end;
end.

