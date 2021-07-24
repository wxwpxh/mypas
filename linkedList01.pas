program linkedList01(input, output);
type
    point=^node;
    node=record
        data:integer;
        next:point;
    end;
var
    i,n,e:integer;
    head,last:point;
procedure inserthead(var head:point;item:integer);
var
    p:point;
begin
  new(p);
  p^.data:=item;
  p^.next:=nil;
  if (head = nil) then begin head:=p; last:=head end
  else begin
         p^.next:=head;
         head :=  p
       end
end;{end of procedure inserthead}
procedure insertail(var last:point;item:integer);
var
    p:point;
begin
  new(p);
  p^.data:=item;
  p^.next:=nil;
  if (last = nil) then begin head:=p; last:=head end
  else begin
         last^.next:=p;
         last :=  p
       end
end;{end of procedure insertail}
procedure printlist(var head:point);
var
    q:point;
begin
    if head = nil then writeln('the list is empty')
    else begin
      q:=head;
      while q^.next<>nil do
        begin
            write(q^.data,' ');
            q:=q^.next;
        end;
      write(q^.data);
      writeln
    end{end of else}
end;{end of procedure printlist}
function delhead(var head:point):point;
var
    p:point;
begin
    if head = nil then delhead:=nil
    else if head = last then begin p:=head; head:=nil; last:=nil; delhead:=p end
	else begin
           p:=head;
           head:=head^.next;
           delhead:=p
         end{end of else}
end;{end of function delhead}
begin
{Initialization the linked list}
    head:=nil;
    last:=nil;
    write('Input the number count:');
    readln(n);
    {Establishing a linked list}
    if n>=1 then
      for i:=1 to n do begin
        writeln('Input an int:');
        read(e);
        insertail(last,e){inserthead(head,e)}
      end;
    {print the linked list}
    printlist(head);
	inserthead(head,999);
	printlist(head);
	while delhead(head)<>nil do printlist(head);
end.
