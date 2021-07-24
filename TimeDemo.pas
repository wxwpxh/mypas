Program DateDemo;
uses sysutils;
var
   YY,MM,DD : Word;
begin
   writeln ('Date : ',Date);
   DeCodeDate (Date,YY,MM,DD);
   writeln (format ('Today is (DD/MM/YY): %d/%d/%d ',[dd,mm,yy]));
   writeln ('Date and Time at the time of writing : ',DateTimeToStr(Now));
   writeln ('Current time : ',TimeToStr(Time));
 end.
