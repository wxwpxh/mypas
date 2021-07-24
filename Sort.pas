program Sort;

var
A: array[1..10] of Integer;
B: array[1..20] of Integer;
F: Text;
i,j,k,l,m,temp: Integer;

begin
{Read in array A}
Assign(F, 'arrayA.txt');
Reset(F);
i:= 0;
while not EOF(F) do begin
Inc(i);
Read(F, A[i]);
end;

{Read in array B}
Assign(F, 'arrayB.txt');
Reset(F);
j:= 0;
while not EOF(F) do begin
Inc(j);
Read(F, B[j]);
end;
i:=10;
j:=20;

{Print out the unsorted arrays}
WriteLn('Unsorted Arrays:');
WriteLn('Array A:');
for k:=1 to i do
Write(A[k], ' ');
WriteLn();
WriteLn('Array B:');
for k:=1 to j do
Write(B[k], ' ');
WriteLn();
WriteLn('=========================');
WriteLn('Sorting Arrays...');
WriteLn('=========================');

{Selection Sort Array A}
for l := 1 to i do
for m := l + 1 to i do
if A[l] > A[m] then
begin
temp := A[l];
A[l] := A[m];
A[m] := temp;
end;
{Selection Sort Array B}
for l := 1 to j do
for m := l + 1 to j do
if B[l] > B[m] then
begin
temp := B[l];
B[l] := B[m];
B[m] := temp;
end;

{Print out the sorted arrays}
WriteLn('Selection Sorted Arrays:');
WriteLn('Array A: ');
for k:=1 to i do
Write(A[k], ' ');
WriteLn();
WriteLn('Array B: ');
for k:=1 to j do
Write(B[k], ' ');
WriteLn();
end.
