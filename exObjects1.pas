{
Pascal对象的构造函数和析构函数：
这是一个对象被创建时自动被称为方法，构造函数是特殊类型。你可以创建一个构造函数Pascal声明方法与关键字的构造函数。
但是传统的方法的名称是init，您可以提供自己的任何有效的标识符。可以通过你喜欢的构造函数的参数。
析构函数是期间调用该对象的销毁的方法。析构函数摧毁任何通过构造函数创建的内存分配。
下面的例子将提供一个构造函数和析构函数将初始化为矩形的长度和宽度在创建对象的时候，并摧毁它时，它超出范围的Rectangle类。
*****************************************}
program exObjects1;
type 
   Rectangle = object  
   private  
      length, width: integer; 
   public  
      constructor init(l, w: integer);
      destructor done;
      procedure setlength(l: integer);
      function getlength(): integer;  
      procedure setwidth(w: integer);  
      function getwidth(): integer;  
      procedure draw;
end;
var
   r1: Rectangle;
   pr1: ^Rectangle;
constructor Rectangle.init(l, w: integer);
begin
   length := l;
   width := w;
end;

destructor Rectangle.done;
begin
   writeln(' Desctructor Called');
end; 

procedure Rectangle.setlength(l: integer);
begin
   length := l;
end;

procedure Rectangle.setwidth(w: integer);
begin
   width :=w;
end;

function Rectangle.getlength(): integer;  
begin
   getlength := length;
end;

function Rectangle.getwidth(): integer;  
begin
   getwidth := width;
end;

procedure Rectangle.draw;
var 
   i, j: integer;
begin
   for i:= 1 to length do
   begin
      for j:= 1 to width do
         write(' * ');
      writeln;
   end;
end;

begin
   r1.init(3, 7);
   writeln('Draw a rectangle:', r1.getlength(), ' by ' , r1.getwidth());
   r1.draw;
   new(pr1, init(5, 4));
   writeln('Draw a rectangle:', pr1^.getlength(), ' by ',pr1^.getwidth());
   pr1^.draw;
   pr1^.init(7, 9);
   writeln('Draw a rectangle:', pr1^.getlength(), ' by ' ,pr1^.getwidth());
   pr1^.draw;
   dispose(pr1);
   r1.done;
end.
