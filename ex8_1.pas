program ex8_1(input,output);
var
  letter:char; 
begin 
  for letter:='a' to 'z' do 
    if (ord(letter)-ord('a'))mod 2=0
    then write(letter:3); 
  writeln; 
  for letter:='z' downto 'a' do 
    if (ord(letter)-ord('z'))mod 2 =0
    then write(letter:3); 
  writeln; 
end.
