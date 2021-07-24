program YHTriangle;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  MaxN = 60;

var
  i, j, t, N : Longint;
  Num : String;
  Map : array [0..MaxN + 1, 0..MaxN + 2] of Int64;

  procedure Work;
  begin
    Read(N);
    Fillchar(Map, Sizeof(Map), 0);
    Map[0, 0] := 1;
    Writeln(1);
    
    for i := 1 to N do
    begin
      Map[i, 0] := 1;
      Write(1, ' ');

      for j := 1 to i - 1 do
      begin
        Map[i, j] := Map[i - 1, j] + Map[i - 1, j - 1];
        Write(Map[i, j], ' ');
      end;

      Map[i, i] := 1;
      Writeln(1);
    end;
  end;

begin
  for t := 1 to 10 do
  begin
    Num := IntToStr(t);
    Assign(input, 'YHTriangle' + Num + '.in');
    Reset(input);
    Assign(output, 'YHTriangle' + Num + '.out');
    Rewrite(output);
    Work;
    Close(input);
    Close(output);
  end;
end.
