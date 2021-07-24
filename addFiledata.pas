{
作为子程序参数的文件
Pascal可以被用来作为标准的和用户定义的子程序的参数在文件中的变量。下面的例子演示了这一概念。该程序创建一个文件名为rainfall.txt，
并存储一些降雨量数据。接下来，打开该文件，读取数据，并计算平均降雨量。

请注意，如果您使用的是文件的子程序的参数，它必须被声明为一个var参数。

下面的代码编译和执行时，它会产生以下结果：
Enter the File Name:
rainfall.txt
Enter rainfall data:
34
Enter rainfall data:
45
Enter rainfall data:
56
Enter rainfall data:
78
Average Rainfall: 53.25
************************************}
program addFiledata;
const
   MAX = 4;
type
   raindata = file of real;
var
   rainfile: raindata;
   filename: string;
procedure writedata(var f: raindata);
var
   data: real;
   i: integer;
begin
   rewrite(f, sizeof(data));
   for i:=1 to MAX do
   begin
      writeln('Enter rainfall data: ');
      readln(data);
      write(f, data);
   end;
   close(f);
end;

procedure computeAverage(var x: raindata);
var
   d, sum: real;
   average: real;
begin
   reset(x);
   sum:= 0.0;
   while not eof(x) do
   begin
      read(x, d);
      sum := sum + d;
   end;
   average := sum/MAX;
   close(x);
   writeln('Average Rainfall: ', average:7:2);
end;
begin
   writeln('Enter the File Name: ');
   readln(filename);
   assign(rainfile, filename);
   writedata(rainfile);
   computeAverage(rainfile);
end.
