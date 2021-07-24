program lx214(input,output);
type point=^people;			{Define node type}
     people=record
       name:string[10]; 
       next:point;
     end;
var head,p,q1,q2:point;
    n,i:integer;
 
begin
  new(head);
  head^.next:=nil;								{Define the header node, the initial list is empty}
  write('n= ');
  readln(n);
  for i:=1 to n do
    begin
      new(p);
      readln(p^.name);
      p^.next:=nil;
      if head^.next=nil then head^.next:=p		{Insert P-pointed nodes into an empty list}
      else  begin
                q1:=head;
                q2:=q1^.next;
                while (q2<>nil) and (q2^.name<p^.name) do
                begin
                  q1:=q2;
                  q2:=q1^.next;
                end;     							{Find where node p should be inserted}  
                q1^.next:=p;
                p^.next:=q2;             			{After inserting p into q1, before q2}
            end;   
    end;
  writeln;
  p:=head^.next;
  while p<>nil do     
    begin
      writeln(p^.name);
      p:=p^.next;
    end;
end.
