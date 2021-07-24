program linearListObj;
const maxlen=100;
type 
   mylist = object  
   private  
       data : array[1..maxlen] of char;
       last : 0..maxlen;
   public  
      constructor init(l: integer);
      function length() : integer;
      procedure printlist();
      procedure insert(x:char;p:integer);
      function locate(x:char):integer;
      procedure empty();
      function get(i:integer):char;
end;
var
  l,l1 : mylist;
  p: integer;
  x:char;

      constructor mylist.init(l: integer);
      var
       i:integer;
      begin
      randomize;
      if (l<= 0) then begin
         last:=0;
         exit;
      end;
      if (l>maxlen) then l:= maxlen;
      for i:=1 to l do
      begin
        data[i]:=chr(65+round(random(26)));
        inc(last);
       end;
     end;

     function mylist.length() : integer;
     begin
       length := last;
     end;
     procedure mylist.printlist();
     var
       i:integer;
     begin
       for i:=1 to last do write(data[i]);
         writeln;
     end;

     procedure mylist.insert(x:char;p:integer);
     var
        i:integer;
     begin
        if (p<= 1) then p:= 1;
        if (p>last) then p:= last+1;
  	for i:=last+1 downto p do
  	  data[i+1]:=data[i];
  	data[p]:=x;
  	last:=last+1;
     end;

     function mylist.locate(x:char):integer;
     var
       i:integer;
     begin
       for i:=1 to last do begin
           if(data[i]=x) then begin
              exit(i);
            end;
       end;
       exit(0);
     end;

     procedure mylist.empty();
     begin
      last := 0;
     end;

     function mylist.get(i:integer):char;
     begin
        if ((i< 1) or(i>last) ) then  exit(chr(0));
	exit(data[i]);
     end;

operator +(A:mylist; B:mylist) C:mylist;
var
  i:integer;
begin
  C.init(0);
  for i:=1 to A.last do begin
     C.insert(A.data[i],C.length+1);
  end;
  for i:=1 to B.last do begin
      C.insert(B.data[i],C.length+1);
  end;
end;
operator *(A:mylist; B:mylist) C:mylist;
var
  i:integer;
begin
  C.init(0);
  for i:=1 to A.last do begin
      if(C.locate(A.data[i])=0) then C.insert(A.data[i],C.length+1);
  end;
  for i:=1 to B.last do begin
      if(C.locate(B.data[i])=0) then C.insert(B.data[i],C.length+1);
  end;
end;

begin
  l.init(10);
  l.printlist();  
  writeln('输入一个字符和整数如:c 4,将字符c插如到第四个字符:');
  readln(x,p);
  l.insert(x,p);	
  l.printlist();  
  writeln('再生成个线性表:');
  l1.init(10);
  l1.printlist(); 
  writeln('合并两个线性表:');
  l:=l*l1;  
  l.printlist();
  writeln('不去重复项合并两个线性表:');
  l:=l+l1;  
  for p:=1 to l.length() do write(l.get(p));
  writeln;
end.
