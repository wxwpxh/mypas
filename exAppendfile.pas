{
追加到文件书面形式向已经有一些数据文件，而不会覆盖现有的文件。下面的程序说明了这一点：
*****************************************************}
program exAppendfile;
var
   myfile: text;
   info: string;
begin
   assign(myfile, 'contact.txt');
   append(myfile);
   writeln('Contact Details');
   writeln('webmaster@tutorialspoint.com');
   close(myfile);
   (* let us read from this file *)
   assign(myfile, 'contact.txt');
   reset(myfile);
   while not eof(myfile) do
   begin
      readln(myfile, info);
      writeln(info);
   end;
   close(myfile);
end.
