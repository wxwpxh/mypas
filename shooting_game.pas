Program shooting_game;

uses crt;

const cz:array[1..4,1..2] of -1..1=((0,1),(1,0),(0,-1),(-1,0));

var i,j,xz1,yz1,y1,xz2,yz2,y2,t1,t2,t3,k,v1,v2,jj:integer;

ch:char;

a:array[1..20] of integer;



procedure priter;

begin

gotoxy(1,1);

textbackground(red);

for i:=1 to 10 do

begin

for j:=1 to 10 do

write('    ');

writeln;

end;

end;

procedure priv;

begin

gotoxy(1,1);

write('v1:',v1:3,'              v2:',v2:2);

end;



procedure GameOver(p:integer);

begin

if p=1 then begin gotoxy(1,y1);write(']*');end;

if p=2 then begin gotoxy(39,y2);write('*[');end;

//textcolor(green);

//textbackground(black);

gotoxy(10,10);

p:=3-p;

write('Player  ',p:1,'  is Win!!!');

repeat ch:=readkey;until ord(ch)=13;

textbackground(black);

ClrScr;

halt;

end;

procedure over(p:integer);

begin

if p=1 then begin dec(v1);gotoxy(1,y1);write(']*');end;

if p=2 then begin dec(v2);gotoxy(39,y2);write('*[');end;

priv;

if v1=0 then gameover(1);

if v2=0 then gameover(2);

end;

procedure go;

begin

textbackground(black);

ClrScr;

for i:=1 to 20 do a[i]:=38;

textbackground(green);

textcolor(black);

priter;

gotoxy(1,2);

y1:=1;

write('jj ');

gotoxy(39,2);

write('xld');

gotoxy(1,1);

y1:=2;t1:=0;t2:=0;t3:=0;y2:=2;v1:=1;v2:=1;

priv;

while true do

begin

delay(1);

inc(t1,1);

if t1=1000 then

begin

inc(t2);

if t2=60 then begin t2:=0;inc(t3);end;

end;

if keypressed then

begin

ch:=readkey;

if (ch='i') and (y1>2) then

begin

gotoxy(1,y1);

write('jj  ');

dec(y1);

gotoxy(1,y1);

write('jj  ');

end;

if (ch='k') and (y1<20) then

begin

gotoxy(1,y1);

write('JJ  ');

inc(y1);

gotoxy(1,y1);

write('JJ  ');

end;

if (ch='q') then break;

if (ch='f')and(xz1=0) then

begin

xz1:=3;

yz1:=y1;

end;

{play2}

if (ch='8') and (y2>2) then

begin

gotoxy(9,y2);

write('  ');

dec(y2);

gotoxy(9,y2);

write('<[');

end;

if (ch='5') and (y2<20) then

begin

gotoxy(39,y2);

write('  ');

inc(y2);

gotoxy(39,y2);

write('<[');

end;

if (ch='0')and(xz2=0) then

begin

xz2:=37;

yz2:=y2;

end;

end;{end of keyprssed}

if (t1 mod 1=0)and(xz1<>0) then

begin

if xz1>38 then

begin

gotoxy(xz1,yz1);

write('  ');

if yz1=y2 then Over(2);

xz1:=0;

yz1:=0;

end

else

begin

for jj:=1 to 30 do

begin

gotoxy(xz1,yz1);

end;

writeln('                ');

inc(xz1);

end;

end;

{play2}

if (t1 mod 2=0)and(xz2<>0) then

begin

if xz2<2 then

begin

gotoxy(xz2,yz2);

write(' ');

if yz2=y1 then Over(1);

xz2:=0;

yz2:=0;

end

else

begin

gotoxy(xz2-1,yz2);

write('. ');

dec(xz2);

end;

end;

end;{end of while}

end; {end of go}

begin

//start;

go;

end.
