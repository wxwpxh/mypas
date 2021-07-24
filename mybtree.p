program mybtree(input, output);
type
  btree=^node;
  node=record
    data:char;
    l,r:btree;
  end;
var
  head : btree;
procedure inittree(var t:btree);
var
  ch:char;
begin
  read(ch);
  if (ch<>'#') then  begin
      new(t);
      t^.data:=ch;
      t^.l:=nil;
      t^.r:=nil;
      inittree(t^.l);
      inittree(t^.r);
  end
  else t:=nil

end;

procedure TBTpre(var p:btree);
begin
  if (p<>nil) then begin
    write(p^.data:2);
    TBTpre(p^.l);
    TBTpre(p^.r)
  end;
end;

procedure TBTin(var p:btree);
begin
  if (p<>nil) then begin
    TBTin(p^.l);
    write(p^.data:2);
    TBTin(p^.r);
  end;
end;

procedure TBTpost(var p:btree);
begin
  if (p<>nil) then begin
    TBTpost(p^.l);
    TBTpost(p^.r);
    write(p^.data:2);
  end
end;

begin
  new(head);
  writeln('please input string like ABD##E##C## to make preorder binary tree(#:means nil)');
  inittree(head);
  readln;
  write('this binary tree preorder is: ');
  TBTpre(head);
  writeln;
  write('this binary tree inorder is:  ');
  TBTin(head);
  writeln;
  write('this binary tree postorder is:');
  TBTpost(head);
  readln;
end.
