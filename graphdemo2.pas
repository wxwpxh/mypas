program graphdemo2;
 
{$mode objfpc}{$H+}
 
uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes,crt,graph;
 
Var
  Graphics, Mode : smallint;
 
begin
 Graphics := Detect;
 Mode := detectMode;
 InitGraph(Graphics, Mode,'');
 circle(10,10,10);
 readkey;
end.
