{$M $4000,0,0}

program dosEnv;

uses 
	Dos,Crt;
var
	i:integer;
begin
    for i:=1 to EnvCount do
	writeln(EnvStr(i));

end.
