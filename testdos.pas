{$M $4000,0,0}
uses Dos,Crt;

const    maxn=10;
var    res,his,chki,chkj:text;
n:longint;
exn,pathc,filen,pathf:string;
auto:boolean;
time:array[1..maxn]of real;

procedure Main(x:longint); forward;
procedure Options(x:longint); forward;

procedure Pause;
begin
	gotoxy(1,10);
	textcolor(LightGreen);
	writeln('Press any key to continue...');
	readkey;
end;

procedure Title;
begin
	auto:=false;
	if FSearch('History.txt','')=''
	then begin
		n:=2;
		exn:='pas';
		pathc:='c:\pp\bin\go32v2\fpc.exe';
		filen:='bst';
		pathf:='';
		assign(his,'History.txt'); rewrite(his);
		writeln(his,n);
		writeln(his,exn);
		writeln(his,pathc);
		writeln(his,filen);
		writeln(his,pathf);
		close(his);
	end
	else begin
		assign(his,'History.txt'); reset(his);
		readln(his,n);
		readln(his,exn);
		readln(his,pathc);
		readln(his,filen);
		readln(his,pathf);
		close(his);
	end;
	clrscr;
	writeln('+----------------------+');
	writeln('|     BOB-TESTER       |');
	writeln('+----------------------+');
	writeln('|                      |');
	writeln('|    V-1.01.00 Beta    |');
	writeln('|                      |');
	writeln('| Check Your Programs! |');
	writeln('|                      |');
	writeln('+----------------------+');
	Pause;
end;

procedure Window;
begin
	clrscr;
	textcolor(White);
	writeln('+-------------------------+');
	writeln('|                         |');
	writeln('+-------------------------+');
	writeln('|                         |');
	writeln('|                         |');
	writeln('|                         |');
	writeln('|                         |');
	writeln('|                         |');
	writeln('+-------------------------+');
end;

procedure MakeResults(x,m:longint);
var    i:longint;
begin
	assign(res,'Result.txt');
	rewrite(res);
	writeln(res,'Answer Comparation:');
	if x=1
	then writeln(res,'Totally one Case has been finished.')
else writeln(res,'Totally ',x,' Cases have been finished.');
if m=0
then writeln(res,'All cases are OK.')
	else if m=1
	then writeln(res,'There is a case that gets wrong answers.')
else writeln(res,'There are ',m,' Cases gets wrong answers.');
writeln(res,(1-m/x)*100:0:3,'% of Cases are Accepted.');
writeln(res,'Arrange Time Cost:');
for i:=1 to n do
	writeln(res,'Program ',i,':[',time[i]/x:0:3,'s]');
fillchar(time,sizeof(time),0);
close(res);
end;

procedure Test;
var    i,j,k,w:longint;
hs1,hs2,h1,h2,s1,s2,m1,m2:word;
chi,chj,ch:char;
flag,bool:boolean;
tt:real;
begin
	clrscr;
	Textcolor(LightRed);
	writeln('Compiling...');
	Textcolor(LightGreen);
	writeln('->Compile Data Making Program...');
	Textcolor(White);
	SwapVectors;
	Exec(pathc,filen+'d.'+exn);
	SwapVectors;
	for i:=1 to n do
	begin
		Textcolor(LightGreen);
		writeln('->Compile Program ',i,'...');
		SwapVectors;
		Exec(pathc,filen+char(i+48)+'.'+exn);
		SwapVectors;
	end;
	Textcolor(LightGreen);
	writeln('Press Enter to Continue...');
	ch:=readkey;
	Textcolor(LightRed);
	writeln('Testing...');
	if auto
	then begin
		k:=0;
		flag:=true;
		while flag do
		begin
			inc(k);
			Textcolor(LightGreen);
			writeln('Test Case ',k,':');
			writeln('->Making Data...');
			SwapVectors;
			Exec(pathf+filen+'d.exe','');
			SwapVectors;
			for i:=1 to n do
			begin
				write('->Running Program ',i,'...');
				SwapVectors;
				GetTime(h1,m1,s1,hs1);
				Exec(pathf+filen+char(i+48)+'.exe','');
				GetTime(h2,m2,s2,hs2);
				SwapVectors;
				tt:=(h2-h1)*3600+(m2-m1)*60+s2-s1+(hs2-hs1)/100;
				time[i]:=time[i]+tt;
				writeln('[Time Cost: ',tt:0:2,'s]');
			end;
			Textcolor(LightRed);
			write('->Difference:');
			for i:=1 to n-1 do
			begin
				for j:=i+1 to n do
				begin
					assign(chki,pathf+filen+char(i+48)+'.out');
					assign(chkj,pathf+filen+char(j+48)+'.out');
					reset(chki);
					reset(chkj);
					while (not eof(chki))and(not eof(chkj)) do
					begin
						read(chki,chi);
						read(chkj,chj);
						if chi<>chj
						then begin
							flag:=false;
							write('[',i,' ',j,']');
							break;
						end;
					end;
					if (flag)and((not eof(chki))or(not eof(chkj)))
					then begin
						flag:=false;
						write('[',i,' ',j,']');
					end;
					close(chki);
					close(chkj);
				end;
			end;
			if flag then write('None.');
			writeln;
		end;
	end
	else begin
		k:=0; w:=0;
		while (ch<>'E')and(ch<>'e') do
		begin
			flag:=true; bool:=true;
			inc(k);
			Textcolor(LightGreen);
			writeln('Test Case ',k,':');
			writeln('->Making Data...');
			SwapVectors;
			Exec(pathf+filen+'d.exe','');
			SwapVectors;
			for i:=1 to n do
			begin
				write('->Running Program ',i,'...');
				SwapVectors;
				GetTime(h1,m1,s1,hs1);
				Exec(pathf+filen+char(i+48)+'.exe','');
				GetTime(h2,m2,s2,hs2);
				SwapVectors;
				tt:=(h2-h1)*3600+(m2-m1)*60+s2-s1+(hs2-hs1)/100;
				time[i]:=time[i]+tt;
				writeln('[Time Cost: ',tt:0:2,'s]');
			end;
			Textcolor(LightRed);
			write('->Difference:');
			for i:=1 to n-1 do
			begin
				for j:=i+1 to n do
				begin
					assign(chki,pathf+filen+char(i+48)+'.out');
					assign(chkj,pathf+filen+char(j+48)+'.out');
					reset(chki);
					reset(chkj);
					while (not eof(chki))and(not eof(chkj)) do
					begin
						read(chki,chi);
						read(chkj,chj);
						if chi<>chj
						then begin
							flag:=false;
							write('[',i,' ',j,']');
							if bool then inc(w);
							bool:=false;
							break;
						end;
					end;
					if (flag)and((not eof(chki))or(not eof(chkj)))
					then begin
						flag:=false;
						write('[',i,' ',j,']');
						if bool then inc(w);
						bool:=false;
					end;
					close(chki);
					close(chkj);
				end;
			end;
			if flag    then write('None.');
			writeln;
			Textcolor(LightGreen);
			writeln('Press Enter to Continue...');
			ch:=readkey;
		end;
		MakeResults(k,w);
	end;
	clrscr;
	textcolor(LightGreen);
	writeln('Finished!');
	writeln('Press any key to Go Back to Main Menu...');
	readkey;
	Main(5);
end;

procedure Update;
begin
	assign(his,'History.txt');
	rewrite(his);
	writeln(his,n);
	writeln(his,exn);
	writeln(his,pathc);
	writeln(his,filen);
	writeln(his,pathf);
	close(his);
end;

procedure Amount;
begin
	clrscr;
	textcolor(White);
	writeln('+-------------------------+');
	writeln('|     Amount:             |');
	writeln('+-------------------------+');
	gotoxy(15,2);
	readln(n);
	update;
	gotoxy(1,4);
	textcolor(LightGreen);
	writeln('Press any key to Back to Options...');
	readkey;
	Options(4);
end;

procedure TestMode(x:longint);
var    ch:char;
begin
	Window;
	gotoxy(10,2);
	write('Test Mode');
	textcolor(White);
	gotoxy(3,5);
	write('    Hand Actuated.');
	gotoxy(3,6);
	write('    Automatic.');
	gotoxy(3,7);
	write('    Back to Options.');
	gotoxy(3,x);
	textcolor(LightRed);
	case x of
	5:write('==> Hand Actuated.');
	6:write('==> Automatic.');
	7:write('==> Back to Options.');
end;
ch:=readkey;
while ch<>#13 do
begin
	case ch of
	#87,#119:
	begin
		if x=5
		then begin
			x:=6;
			ch:=#83;
			continue;
		end;
		textcolor(White);
		gotoxy(3,5);
		write('    Hand Actuated.');
		gotoxy(3,6);
		write('    Automatic.');
		gotoxy(3,7);
		write('    Back to Options.');
		dec(x);
		gotoxy(3,x);
		textcolor(LightRed);
		case x of
		5:write('==> Hand Actuated.');
		6:write('==> Automatic.');
		7:write('==> Back to Options.');
	end;
end;
#83,#115:
begin
	if x=7
	then begin
		x:=6;
		ch:=#87;
		continue;
	end;
	textcolor(White);
	gotoxy(3,5);
	write('    Hand Actuated.');
	gotoxy(3,6);
	write('    Automatic.');
	gotoxy(3,7);
	write('    Back to Options.');
	inc(x);
	gotoxy(3,x);
	textcolor(LightRed);
	case x of
	5:write('==> Hand Actuated.');
	6:write('==> Automatic.');
	7:write('==> Back to Options.');
end;
			end;
		end;
		ch:=readkey;
	end;
	case x of
	5:auto:=false;
	6:auto:=true;
	7:Options(5);
end;
TestMode(x);
end;

procedure FilePN(x:longint);
var    ch:char;
begin
	Window;
	gotoxy(7,2);
	write('File Paths&Names');
	textcolor(White);
	gotoxy(3,5);
	write('    File Name');
	gotoxy(3,6);
	write('    File Path');
	gotoxy(3,7);
	write('    Back to Options.');
	gotoxy(3,x);
	textcolor(LightRed);
	case x of
	5:write('==> File Name');
	6:write('==> File Path');
	7:write('==> Back to Options.');
end;
ch:=readkey;
while ch<>#13 do
begin
	case ch of
	#87,#119:
	begin
		if x=5
		then begin
			x:=6;
			ch:=#83;
			continue;
		end;
		textcolor(White);
		gotoxy(3,5);
		write('    File Name');
		gotoxy(3,6);
		write('    File Path');
		gotoxy(3,7);
		write('    Back to Options.');
		dec(x);
		gotoxy(3,x);
		textcolor(LightRed);
		case x of
		5:write('==> File Name');
		6:write('==> File Path');
		7:write('==> Back to Options.');
	end;
end;
#83,#115:
begin
	if x=7
	then begin
		x:=6;
		ch:=#87;
		continue;
	end;
	textcolor(White);
	gotoxy(3,5);
	write('    File Name');
	gotoxy(3,6);
	write('    File Path');
	gotoxy(3,7);
	write('    Back to Options.');
	inc(x);
	gotoxy(3,x);
	textcolor(LightRed);
	case x of
	5:write('==> File Name');
	6:write('==> File Path');
	7:write('==> Back to Options.');
end;
			end;
		end;
		ch:=readkey;
	end;
	textcolor(LightGreen);
	case x of
	5:
	begin
		gotoxy(1,6);
		insline;
		gotoxy(3,6);
		readln(filen);
		gotoxy(1,6);
		delline;
	end;
	6:
	begin
		gotoxy(1,7);
		insline;
		gotoxy(3,7);
		readln(pathf);
		gotoxy(1,7);
		delline;
	end;
	7:
	begin
		Update;
		Options(6);
	end;
end;
FilePN(x);
end;

procedure CompileMode(x:longint);
var    ch:char;
begin
	Window;
	gotoxy(10,2);
	write('Compile Mode');
	textcolor(White);
	gotoxy(3,5);
	write('    Extension Name');
	gotoxy(3,6);
	write('    Compiling Path');
	gotoxy(3,7);
	write('    Back to Options.');
	gotoxy(3,x);
	textcolor(LightRed);
	case x of
	5:write('==> Extension Name');
	6:write('==> Compiling Path');
	7:write('==> Back to Options.');
end;
ch:=readkey;
while ch<>#13 do
begin
	case ch of
	#87,#119:
	begin
		if x=5
		then begin
			x:=6;
			ch:=#83;
			continue;
		end;
		textcolor(White);
		gotoxy(3,5);
		write('    Extension Name');
		gotoxy(3,6);
		write('    Compiling Path');
		gotoxy(3,7);
		write('    Back to Options.');
		dec(x);
		gotoxy(3,x);
		textcolor(LightRed);
		case x of
		5:write('==> Extension Name');
		6:write('==> Compiling Path');
		7:write('==> Back to Options.');
	end;
end;
#83,#115:
begin
	if x=7
	then begin
		x:=6;
		ch:=#87;
		continue;
	end;
	textcolor(White);
	gotoxy(3,5);
	write('    Extension Name');
	gotoxy(3,6);
	write('    Compiling Path');
	gotoxy(3,7);
	write('    Back to Options.');
	inc(x);
	gotoxy(3,x);
	textcolor(LightRed);
	case x of
	5:write('==> Extension Name');
	6:write('==> Compiling Path');
	7:write('==> Back to Options.');
end;
			end;
		end;
		ch:=readkey;
	end;
	textcolor(LightGreen);
	case x of
	5:
	begin
		gotoxy(1,6);
		insline;
		gotoxy(3,6);
		readln(exn);
		gotoxy(1,6);
		delline;
	end;
	6:
	begin
		gotoxy(1,7);
		insline;
		gotoxy(3,7);
		readln(pathc);
		gotoxy(1,7);
		delline;
	end;
	7:
	begin
		Update;
		Options(7);
	end;
end;
CompileMode(x);
end;

procedure Options(x:longint);
var    ch:char;
begin
	Window;
	gotoxy(11,2);
	write('Options');
	textcolor(White);
	gotoxy(3,4);
	write('    Amount of Programs.');
	gotoxy(3,5);
	write('    Test Mode.');
	gotoxy(3,6);
	write('    File Paths&Names.');
	gotoxy(3,7);
	write('    Compile Mode.');
	gotoxy(3,8);
	write('    Back to Main Menu.');
	gotoxy(3,x);
	textcolor(LightRed);
	case x of
	4:write('==> Amount of Programs.');
	5:write('==> Test Mode.');
	6:write('==> File Paths&Names.');
	7:write('==> Compile Mode.');
	8:write('==> Back to Main Menu.');
end;
ch:=readkey;
while ch<>#13 do
begin
	case ch of
	#87,#119:
	begin
		if x=4
		then begin
			x:=7;
			ch:=#83;
			continue;
		end;
		textcolor(White);
		gotoxy(3,4);
		write('    Amount of Programs.');
		gotoxy(3,5);
		write('    Test Mode.');
		gotoxy(3,6);
		write('    File Paths&Names.');
		gotoxy(3,7);
		write('    Compile Mode.');
		gotoxy(3,8);
		write('    Back to Main Menu.');
		dec(x);
		gotoxy(3,x);
		textcolor(LightRed);
		case x of
		4:write('==> Amount of Programs.');
		5:write('==> Test Mode.');
		6:write('==> File Paths&Names.');
		7:write('==> Compile Mode.');
		8:write('==> Back to Main Menu.');
	end;
end;
#83,#115:
begin
	if x=8
	then begin
		x:=5;
		ch:=#87;
		continue;
	end;
	textcolor(White);
	gotoxy(3,4);
	write('    Amount of Programs.');
	gotoxy(3,5);
	write('    Test Mode.');
	gotoxy(3,6);
	write('    File Paths&Names.');
	gotoxy(3,7);
	write('    Compile Mode.');
	gotoxy(3,8);
	write('    Back to Main Menu.');
	inc(x);
	gotoxy(3,x);
	textcolor(LightRed);
	case x of
	4:write('==> Amount of Programs.');
	5:write('==> Test Mode.');
	6:write('==> File Paths&Names.');
	7:write('==> Compile Mode.');
	8:write('==> Back to Main Menu.');
end;
			end;
		end;
		ch:=readkey;
	end;
	case x of
	4:Amount;
	5:TestMode(5);
	6:FilePN(5);
	7:CompileMode(5);
	8:Main(6);
end;
end;

procedure Quit;
var    i:longint;
begin
	Window;
	gotoxy(9,2);
	write('Exiting....');
	gotoxy(8,6);
	textcolor(LightRed);
	write('Good Bye');
	for i:=1 to 6 do
	begin
		write('.');
		delay(300);
	end;
	halt;
end;

procedure Main(x:longint);
var    ch:char;
begin
	Window;
	gotoxy(10,2);
	write('Main Menu');
	textcolor(White);
	gotoxy(3,5);
	write('    Test Your Programs.');
	gotoxy(3,6);
	write('    Change Options.');
	gotoxy(3,7);
	write('    Exit Bob-Tester.');
	gotoxy(3,x);
	textcolor(LightRed);
	case x of
	5:write('==> Test Your Programs.');
	6:write('==> Change Options.');
	7:write('==> Exit Bob-Tester.');
end;
ch:=readkey;
while ch<>#13 do
begin
	case ch of
	#87,#119:
	begin
		if x=5
		then begin
			x:=6;
			ch:=#83;
			continue;
		end;
		textcolor(White);
		gotoxy(3,5);
		write('    Test Your Programs.');
		gotoxy(3,6);
		write('    Change Options.');
		gotoxy(3,7);
		write('    Exit Bob-Tester.');
		dec(x);
		gotoxy(3,x);
		textcolor(LightRed);
		case x of
		5:write('==> Test Your Programs.');
		6:write('==> Change Options.');
		7:write('==> Exit Bob-Tester.');
	end;
end;
#83,#115:
begin
	if x=7
	then begin
		x:=6;
		ch:=#87;
		continue;
	end;
	textcolor(White);
	gotoxy(3,5);
	write('    Test Your Programs.');
	gotoxy(3,6);
	write('    Change Options.');
	gotoxy(3,7);
	write('    Exit Bob-Tester.');
	inc(x);
	gotoxy(3,x);
	textcolor(LightRed);
	case x of
	5:write('==> Test Your Programs.');
	6:write('==> Change Options.');
	7:write('==> Exit Bob-Tester.');
end;
			end;
		end;
		ch:=readkey;
	end;
	case x of
	5:Test;
	6:Options(4);
	7:Quit;
end;
end;

begin
	Title;
	Main(5);
end.
