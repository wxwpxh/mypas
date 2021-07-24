program mybtree(input, output);

type btree=^node;

  node=record

      data:char;

      l,r:btree;

    end;

var head : btree;

function inittree(var t:btree):btree;

var

  ch:char;

begin

  read(ch);

  if (ch='#') then exit(nil)

  else begin

      new(t);

      t^.data:=ch;

      t^.l:=nil;

      t^.r:=nil;

      inittree(t^.l);

      inittree(t^.r);

  end;

end;

procedure TBT_pre(var p:btree);

begin

  if (p=nil) then exit;

  write(p^.data:2);

  TBT_pre(p^.l);

  TBT_pre(p^.r);

end;

procedure TBT_in(var p:btree);

begin

  if (p=nil) then exit;

  TBT_in(p^.l);

  write(p^.data:2);

  TBT_in(p^.r);

end;

procedure TBT_post(var p:btree);

begin

  if (p=nil) then exit;

  TBT_post(p^.l);

  TBT_post(p^.r);

  write(p^.data:2);

end;

begin

  new(head);

  writeln('please input string like ABD##E##C## to make preorder binary tree(#:means nil)');

  inittree(head);

  readln;

  write('this binary tree preorder is: ');

  TBT_pre(head);

  writeln;

  write('this binary tree inorder is:  ');

  TBT_in(head);

  writeln;

  write('this binary tree postorder is:');

  TBT_post(head);

  readln;

end.
