program recdemo(input,output);
type
  TEmployee = record
                name      : string[25];
                address   : string[40];
                age       : byte;
                position  : string[10];
                commision : real;
              end;

var
  x : TEmployee;
begin
  x.name      := 'Paul Doherty';
  x.address   := '11th Kingston Avenue';
  x.age       := 35;
  x.position  := 'Salesman';
  x.commision := 0.10;
end.
