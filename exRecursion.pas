program exRecursion;
var
   num, f: integer;
function fact(x: integer): integer; (* calculates factorial of x - x! *)
begin
   if x=0 then
      fact := 1
   else
      fact := x * fact(x-1); (* recursive call *)
end; { end of function fact}
begin
   writeln(' Enter a number: ');
   readln(num);
   f := fact(num);
   writeln(' Factorial ', num, ' is: ' , f);
end.
