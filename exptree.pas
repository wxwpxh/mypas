{
 https://www.cnblogs.com/gw811/archive/2012/10/12/2720777.html
 【算法分析】表达式不合法有三种情况：①左右括号不匹配；②变量名不合法；③运算符两旁无参与运算的变量或数。
 分析表达式树可以看到：表达式的根结点及其子树的根结点为运算符，其在树中的顺序是按运算的先后顺序从后到前，表达树的叶子为参与运算的变量或数。
 例如，表达式：a+(b-c)/d
 运算顺序：    ③ ① ②
 表达式树如图8-11-2
 处理时，首先找到运算级别最低的运算符“+”作为根结点，继而确定该根结点的左、右子树结点在表达式串中的范围为a和(b-c)/d，再在对应的范围内寻找运算级别最低的运算符作为子树的根结点，直到范围内无运算符，则剩余的变量或数为表达式树的叶子。
 【算法步骤】
 ① 设数组ex存放表达式串的各字符，lt、rt作为结点的左右指针，变量left、right用于存放每次取字符范围的左、右界。
 ② 设置左界初值为1；右界初值为串长度。
 ③ 判断左右括号是否匹配，不匹配则认为输入有错误。
 ④ 在表达式的左右界范围内寻找运算级别最低的运算符，同时判断运算符两旁有否参与运算的变量或数。若无，则输入表达式不合法；若有，作为当前子树的根结点，设置左子树指针及其左右界值，设置右子树指针及其左右界值。
 ⑤ 若表达式在左右界范围内无运算符，则为叶子结点，判断变量名或数是否合法。
 ⑥ 转④，直到表达式字符取完为止。
 源程序中的h、d、w用于存放文本画图时结点的坐标位置。
}

program exptree;
uses crt;
type
  point=^tree;
  tree=record
         data:string;
         lt:point;
         rt:point;
       end;
var
  n,len,k:integer;
  ex:string;
  letters:set of char;
  root:point;
procedure error(er:byte);    {出错信息提示}
begin
  write('Enter error:');
  case er of
    1:writeln('No letter');
    2,3:writeln('No expressint');
    4:writeln('No+,*,-or/');
    5:writeln('No(or)');
  end;
  write('Press<enter>...');readln;halt(1);
end;
procedure create(left,right:integer;var p:point);
var q:point;
    k,n:integer;
begin     {找运算级别最低的运算符}
  if ex[left]='(' then
    begin
      n:=left+1;k:=0;
      while (n<right) and (k>=0) do
        begin
          if ex[n]='(' then inc(k);
          if ex[n]=')' then dec(k);
          inc(n);
        end;
      if n=right then
        begin
          dec(right);inc(left);
        end;
    end;
  if right<left then error(1);
  n:=right;k:=0;
  repeat
    if ex[n]=')' then inc(k);
    if ex[n]='(' then dec(k);
    dec(n);
  until (((ex[n]='+') or (ex[n]='-')) and (k=0)) or (n<left);
  if n=left then error(3);
  if n>left then
    begin
      with p^ do
        begin
          data:=ex[n];
          new(q);lt:=q;
          new(q);rt:=q;
        end;
      create(left,n-1,p^.lt);
      create(n+1,right,p^.rt);
    end
  else     {not found '+''-'}
    begin
      n:=right;
      repeat
        if ex[n]=')' then inc(k);
        if ex[n]='(' then dec(k);
        dec(n);
      until (((ex[n]='*') or (ex[n]='/')) and (k=0)) or (n<left);
      if n=left then error(3);
      if n>left then
        begin
          with p^ do
            begin
              data:=ex[n];
              new(q);rt:=q;
              new(q);lt:=q;
            end;
          create(left,n-1,p^.lt);
          create(n+1,right,p^.rt);
        end
      else    {only string}
        begin       {求叶子结点的字串}
          for k:=left to right do
            if not(ex[k] in letters) then error(1);
          p^.data:='';
          for k:=left to right do
            p^.data:=p^.data+ex[k];
          p^.lt:=nil;
          p^.rt:=nil;
        end;
    end;
end;
procedure pr_tree(w,dep:integer;p:point);    {画出生成的表达式树}
var h,i,lt,rt:integer;
begin
  h:=40;for i:=1 to dep do h:=h div 2;
  gotoxy(w-1,dep*3);write('(',p^.data,')');
  if p^.lt=nil then lt:=w
  else begin
         lt:=w-h;pr_tree(lt,dep+1,p^.lt)
       end;
  if p^.rt=nil then rt:=w
  else begin
         rt:=w+h;pr_tree(rt,dep+1,p^.rt);
       end;
  if lt<>rt then
    begin
      gotoxy(w,dep*3+1);write('|');
      gotoxy(lt,3*dep+2);write('|');
      for i:=lt to rt-2 do write('-');write('|');
    end;
end;
begin
  clrscr;
  letters:=['A'..'Z','a'..'z','0'..'9'];
  repeat
    write('Enter expression:');readln(ex);
    len:=length(ex)
  until len>0;
  n:=1;
  k:=0;
  while (n<=len) and (k>=0) do   {判断左括号是否匹配}
    begin
      if ex[n]='(' then inc(k);
      if ex[n]=')' then dec(k);
      inc(n);
    end;
  if k<>0 then error(5);
  new(root);create(1,len,root);
  pr_tree(40,1,root);readln
end.
