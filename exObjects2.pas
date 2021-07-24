{
Pascal对象可以有选择地继承了父对象。下面程序说明Pascal对象的继承。
让我们创建另一个对象命名为桌面，这是继承Rectangle对象
************************************************}
program exObjects2;
type 
   Rectangle = object  
   private  
      length, width: integer; 
   public  
      procedure setlength(l: integer);  
      function getlength(): integer;  
      procedure setwidth(w: integer);  
      function getwidth(): integer;  
      procedure draw;
end;
TableTop = object (Rectangle)
   private
     material: string;
   public
      function getmaterial(): string;
      procedure setmaterial( m: string);
      procedure displaydetails;
      procedure draw;
end;
var
   tt1: TableTop;

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

function Rectangle.getwidth():integer;
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

function TableTop.getmaterial(): string;
begin
   getmaterial := material;
end;

procedure TableTop.setmaterial( m: string);
begin
   material := m;
end;

procedure TableTop.displaydetails;
begin
   writeln('Table Top: ', self.getlength(), ' by ' , self.getwidth());
   writeln('Material: ', self.getmaterial());
end;

procedure TableTop.draw();
var
   i, j: integer;
begin
   for i:= 1 to length do
   begin
      for j:= 1 to width do
         write(' * ');
   writeln;
   end;
   writeln('Material: ', material);
end;

begin
   tt1.setlength(3);
   tt1.setwidth(7);
   tt1.setmaterial('Wood');
   tt1.displaydetails();
   writeln;
   writeln('Calling the Draw method');
   tt1.draw();
end.
