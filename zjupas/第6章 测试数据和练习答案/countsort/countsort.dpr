program countsort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  MaxN = 1000000;  

var
  i, j, t, N, Cur, Max : Longint;
  Num : String;
  D : array [0..MaxN + 1] of Longint;

  procedure Work;
  begin
    Readln(N);
    Fillchar(D, Sizeof(D), 0);
    Max := -MaxLongint;
    
    for i := 1 to N do
    begin
      Readln(Cur);
      Inc(D[Cur]);
      if Cur > Max then
        Max := Cur;
    end;

    for i := 1 to Max do
      for j := 1 to D[i] do
        Writeln(i);
  end;

begin
  for t := 1 to 10 do
  begin
    Num := IntToStr(t);
    Assign(input, 'countsort' + Num + '.in');
    Reset(input);
    Assign(output, 'countsort' + Num + '.out');
    Rewrite(output);
    Work;
    Close(input);
    Close(output);
  end;
end.
 
