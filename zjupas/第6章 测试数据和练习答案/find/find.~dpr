program ProFind;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  MaxN = 2000;

var
  i, j, t, N, K, Cur, L, P : Longint;
  Num : String;
  D : array [0..MaxN + 1] of Longint;
  Found : Boolean;

  procedure Work;
  begin
    Readln(N);
    Readln(K);
    for i := 1 to N do
      Read(D[i]);
    Readln;
    for i := 1 to K do
    begin
      Read(Cur);
      Found := False;
      D[0] := -MaxLongint;
      P := 0;
      for j := 1 to N do
      begin
        if D[j] <> D[j - 1] then
          Inc(P);      
        if D[j] = Cur then
        begin
          Found := True;
          Break;
        end;
      end;

      if Found then
      begin
        L := 1;
        while (j + L <= N) And (D[j + L] = Cur) do
          Inc(L);
        Writeln(P, ' ', L, ' ', j - 1);
      end
      else
        Writeln('Fail!');
        
    end;
  end;

begin
  for t := 1 to 10 do
  begin
    Num := IntToStr(t);
    Assign(input, 'find' + Num + '.in');
    Reset(input);
    Assign(output, 'find' + Num + '.out');
    Rewrite(output);
    Work;
    Close(input);
    Close(output);
  end;
end.

