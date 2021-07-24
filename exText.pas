{
一个正常的文件的字符和文本文件之间的区别是，一个文本文件被分成的行，每行由一个特殊的行结束标记终止，由系统自动插入。
下面的示例创建并写入一个文本文件名为contact.txt：
**************************************************************}
program exText;
var
   filename, data: string;
   myfile: text;
begin
   writeln('Enter the file name: ');
   readln(filename);
   assign(myfile, filename);
   rewrite(myfile);
   writeln(myfile, 'Note to Students: ');
   writeln(myfile, 'For details information on Pascal Programming');
   writeln(myfile, 'Contact: Tutorials Point');
   writeln('Completed writing'); 
   close(myfile);
end.
