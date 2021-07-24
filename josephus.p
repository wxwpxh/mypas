{Joseph's problem:consists of n people sitting around a round table.
Now we start counting from the s person to the m person.
Then we start counting from the next person to the m person.
}
program josephus(input, output);
var
   i,n,k,m,s,w,j :integer;
   p:array[1..100] of integer;
begin
   writeln('Enter n s m:n for total people ,start counting from the s person,m out:');
   repeat readln(n,s,m); until s<=n;
   for i:=1 to n do p[i]:=i;
   k:=s;
   for i:=n downto 2 do
     begin
       k:=(k+m-1)mod i;
       if k=0 then k:=i;
       w:=p[k];
       if k<i then for j:=k to i-1 do p[j]:=p[j+1];
       p[i]:=w;
     end;
   for i:=n downto 1 do writeln(n-i+1,':',p[i],' ');
   writeln;
end.
