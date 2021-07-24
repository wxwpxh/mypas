program linkjsph(input, output);
type
  datatype=integer;
  point=^pp;
  pp=record
    data:datatype;
    link:point;
  end;
var
    head,p,q:point;
    i:integer;
function linkcreate(n:integer):point;
var
    p1,p2,k:point;
begin
   if n < 1 then linkcreate:=nil
   else
   begin
     new(p1);
     p1^.data:=1;
     p1^.link:=p1;
     k:=p1;
     for i:=2 to n do
       begin
         new(p2);
         p2^.data:=i;
         p2^.link:=p1^.link;
         p1^.link:=p2;
         p1:=p2
       end;
     linkcreate:=k
   end{else}
end;{end of function linkcreate}

procedure linkprocess(var head:point;k:integer;m:integer); {Start counting from the person numbered K (1 <= K <= n), and list the person counting to M.}
begin
   p:=head;
   while p^.data<>k do p := p^.link;
   while p^.link <> p do
   begin
                for i:=0 to m-1 do
                begin
                        q := p;
                        p := p^.link;
                end;
                write(p^.data,' ');
                q^.link:= p^.link;
                dispose(p);
                p := q^.link;
   end;
   write(p^.data,' ');
   dispose(p)
end;{linkprocess}
begin
        head := linkcreate(10);
        linkprocess(head,3,1);
        writeln
end.
