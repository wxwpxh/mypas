{
procedure printlist(var list:point);
function creatlist(lenth:integer):point;
procedure inserthead(var list:point;item:datatype);
procedure insertail(var list:point;item:datatype);
procedure insertloc(var list:point;loc:integer;item:datatype);
procedure PurgeItem(var list:point;item:datatype);            Clear items from the list
procedure delItem(var list:point;item:datatype);            Delete the first item in the list

}
program mylinkedList(input, output);
type
  datatype=integer;
  point=^pp;
  pp=record
    data:datatype;
    link:point;
  end;
var
    head:point;
    ListLenth,i:integer;
procedure printlist(var list:point);
var
    k:point;
begin
   k:=list;
   writeln('total number is :',ListLenth);
   if (list = nil) then
     writeln('List is empty:')
   else begin
     while k^.link<>nil do
     begin
       write(k^.data,'->');
       k:=k^.link;
     end;{end of while}
     write(k^.data,'->')
   end;{end of else}
   writeln;
end;{end of procedure printlist}
function creatlist(lenth:integer):point;
var
    p1,p2,k:point;
begin
   if lenth < 1 then begin
       writeln('List lenth is less than 0,empty list created');
       ListLenth:=0;
       creatlist:=nil
   end{create empty list}
   else
   begin
     new(p1);
     writeln('input data');
     readln(p1^.data);
     k:=p1;    {Pointer K points to the list head}
     {Generate nine new nodes with a loop, each of which is connected after the last node}
     for i:=1 to lenth-1 do
       begin
         new(p2);
         writeln('input data');
         readln(p2^.data);
         p1^.link:=p2;
         p1:=p2;
       end;
     {Assign a null value NIL to the LINK field of the last node}
     p2^.link:=nil;   {Assign a null value NIL to the LINK field of the last node}
     ListLenth:=lenth;
     creatlist:=k
   end{else}
end;{end of function creatlist}
{Insert item before the header of the list}
procedure inserthead(var list:point;item:datatype);
var
    p:point;
begin
  new(p);
  p^.data:=item;
  p^.link:=nil;
  if (list = nil) then begin
    ListLenth:=1;
    list:=p
  end
  else begin
    p^.link:=list;
    ListLenth:=ListLenth+1;
    list :=  p
  end
end;{end of procedure inserthead}
procedure insertail(var list:point;item:datatype);
var
    p,q:point;
begin
  new(p);
  p^.data:=item;
  p^.link:=nil;
  if (list = nil) then begin
    ListLenth:=1;
    list:=p
    end
  else begin
    q:=list;
    while (q^.link <>nil)  do q:=q^.link;
    q^.link:=p;
    ListLenth:=ListLenth+1
    end
end;{end of procedure insertail}
procedure insertloc(var list:point;loc:integer;item:datatype);
var
    p,q:point;
begin
  if (loc > ListLenth) then insertail(list,item)
  else if (loc <= 1) then inserthead(list,item)
  else begin
         q:=list;
         for i:=2 to loc-1 do q:=q^.link;
         new(p);
         p^.data:=item;
         p^.link:=q^.link;
         q^.link:=p;
         ListLenth:=ListLenth+1
       end
end;{end of procedure insertloc}
procedure PurgeItem(var list:point;item:datatype);
var
    p,q:point;
begin
  while (list <>nil)and(list^.data = item)  do
  begin
      q :=  list;
      list:=  list^.link;
      dispose(q);
      ListLenth:=ListLenth-1
  end;
  if (list <>nil) and (list^.link <>nil) then
  begin
    p :=  list;
    q :=  list;
    p :=  list^.link;
    while p^.link<>nil do
    if (p^.data = item) then begin
      q^.link := p^.link;
      dispose(p);
      p := q^.link;
      ListLenth:=ListLenth-1
    end
    else begin
      q :=  p;
      p :=  p^.link;
    end;
    if (p^.data = item) then begin
      q^.link :=  nil;
      dispose(p);
      ListLenth:=ListLenth-1
    end;
  end{end of if (list <>nil) and (list^.link <>nil)  }
end;{end of procedure PurgeItem}
procedure delItem(var list:point;item:datatype);
var
    p,q:point;
begin
  p :=  list;
  while (p <>nil)and(p^.data <> item)  do
  begin
      q :=  p;
      p:=  p^.link;
  end;
  if (list = p) then
  begin  if (list <> nil) then 
                          begin
                            list :=  list^.link;
                            ListLenth:=ListLenth-1;
                            dispose(p)
                          end
  end           {end of if (list = p) then}
  else if (p^.data = item) then
       begin
           q^.link :=  p^.link;
           dispose(p);
           ListLenth:=ListLenth-1
       end
end;{end of procedure delItem}
begin  {Generate a new node head as the head of the list}
   head:=creatlist(10);
   {Output the DATA fields in the list from the list head in turn}
   printlist(head);
   writeln('call procedure delItem to del first data 2');
   delItem(head,2);
   printlist(head);
   writeln('call procedure PurgeItem to del all data 2');
   PurgeItem(head,2);
   printlist(head);
   writeln('call procedure inserthead & insertail to insert data 2 before head&tail of list:');
   inserthead(head,2);
   insertail(head,2);
   printlist(head);
   writeln('call procedure insertloc(head,3,100) to insert 100 as 3th item of list:');
   insertloc(head,3,100);
   printlist(head);
end.
