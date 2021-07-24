program Salaries;
var F:text;
    Salary,max:integer;
    Name:string[20];
    MaxName:string;
    Sex:0..1;
begin
     Max:=0;
     assign(F,'Salary.txt');
     reset(F);
     While not Eof(F) Do
     begin
          readln(F,Name,Sex,Salary);
          if (Sex=1) and (Salary>Max) then
          begin
             Max:=Salary;
             MaxName:=Name;
      end
end;

     close(F);
     writeln;
     writeln('The highest ladis salary is for Mrs. ',MaxName,'By Value:',Max);
     writeln;
     writeln;
     writeln;
     writeln;
     writeln('Press Enter To Exit');
     readln
end.
