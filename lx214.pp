Program lx214;
type point=^people;          {定义结点类型}
     people=record
       name:string[10];     {name--数据域，存放姓名}
       next:point;          {next--指针域，存放后继结点的地址}
     end;

var head,p,q1,q2:point;
    n,i:integer;

begin
  new(head);head^.next:=nil;  {定义头结点，初始链表为空}
  write('n= ');
  readln(n);
  for i:=1 to n do
    begin
      new(p);readln(p^.name);p^.next:=nil;
      if head^.next=nil then head^.next:=p   {将P指向的结点插入空链表}
        else
          begin
            q1:=head;q2:=q1^.next;
            while (q2<>nil) and (q2^.name<p^.name) do
              begin q1:=q2;q2:=q1^.next; end;     {查找结点p应插入的位置 }
            q1^.next:=p;p^.next:=q2;             {将p插入q1之后q2之前}
          end;  
     end;
  writeln;

  p:=head^.next;
  while p<>nil do        {输出}
    begin
      writeln(p^.name);
      p:=p^.next;
    end;
 end.
