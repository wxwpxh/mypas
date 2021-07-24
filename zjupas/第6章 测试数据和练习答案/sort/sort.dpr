program sort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  MaxN = 1000;  

var
  i, t, N : Longint;
  Num : String;
  D : array [0..MaxN + 1] of Longint;

  procedure QuickSort(const L, R : Longint);
  var
    i, j, Mid, Tmp : Longint;
  begin
    i := L;
    j := R;
    Mid := D[(L + R) shr 1];
    repeat
      while D[i] < Mid do
        Inc(i);
      while D[j] > Mid do
        Dec(j);
      if i <= j then
      begin
        Tmp := D[i];
        D[i] := D[j];
        D[j] := Tmp;
        Inc(i);
        Dec(j);
      end;
    until i > j;
    if j > L then QuickSort(L, j);
    if i < R then QuickSort(i, R);
  end;

  procedure Work;
  begin
    Readln(N);
    for i := 1 to N do
      Readln(D[i]);

    QuickSort(1, N);

    for i := 1 to N do
      Writeln(D[i]);
  end;

begin
  for t := 1 to 10 do
  begin
    Num := IntToStr(t);
    Assign(input, 'sort' + Num + '.in');
    Reset(input);
    Assign(output, 'sort' + Num + '.out');
    Rewrite(output);
    Work;
    Close(input);
    Close(output);
  end;
end.
 
