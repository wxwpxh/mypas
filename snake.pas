program snake;
{$M 9999,0,0}
uses dos,crt,sysutils,mouse;
const
  lie=14;
  sn1_a=green; sn1_b=14; sn1_s='○'; sn1_t='◎';
  sn2_a=3; sn2_b=20; sn2_s='⊙'; sn2_t='●';
  banben='V1.9';
  LONGIN=1564154;
  kk:array[6..20,1..40]of integer=    ((0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
                                       (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
                                       (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
                                       (0,0,1,1,1,1,1,1,0,0,0,1,0,0,0,0,0,1,0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,0,0,0,0,0),
                                       (0,0,1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0),
                                       (0,0,1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0),
                                       (0,0,1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,0,0,0,0,0),
                                       (0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0),
                                       (0,0,1,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0),
                                       (0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0),
                                       (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
                                       (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
                                       (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
                                       (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
                                       (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));
type shijian=array[1..4] of word;
     zuobiao=record  x,y:longint;  end;
     TNOWTIME=record ye,mo,da,h,min,s,ms:word; end;
var ch,ch2,ch3:char;
    z,jpoint,point,x,y,i,j,jhead2,head2,jtail2,jhead,jtail,jpoint2,tail2,jscore,jscore2,score2,head,tail,col,line,point2,speed,score:longint;
    jbo,jbo2,bo,bo2,jilu_ever:boolean;
    f:text;
    s,js:string;
    b,a,ja,jb:array[1..100,1..100] of boolean;
    she,she2,jshe,jshe2:array[1..1000000,1..2] of longint;
    t1,t2:shijian;
    apple,p_mark:zuobiao;
    canshu:boolean;
    GameMoshi:integer;
    Bangdan:array[1..3,1..10,1..2]of longint;
    Numbers:array[1..3]of integer;
    NOWTIME:TNOWTIME;
    K_ADD:string;
    K_backcolor:integer;
  function FNOWTIME(a:integer):longint;
    begin
      with NOWTIME do
        begin
          getdate(ye,mo,da,s);
          //gettime(h,min,s,ms);
          exit(da+mo*100+ye*10000);
        end;
    end;
  function JMMM(k:longint):longint;
    var
      m,n:longint;
    begin
      n:=LONGIN;
      m:=k xor n;
      JMMM:=m;
    end;
  procedure save;
    var
      f:text;
      i,j,k:longint;
    begin
      assign(f,K_ADD);rewrite(f);
      for i:=1 to 3 do
        begin
          k:=JMMM(Numbers[i]);
          writeln(f,k);
          for j:=1 to Numbers[i] do
            begin
              k:=JMMM(Bangdan[i,j,1]);writeln(f,k);
              k:=JMMM(Bangdan[i,j,2]);writeln(f,k);
            end;
        end;
      close(f);
    end;
  procedure readd;
    var
      f:text;
      i,j,k:longint;
    begin
      fillchar(Bangdan,sizeof(Bangdan),0);
      K_ADD:=FSearch('Sneak_History','');
      if K_ADD=''
        then begin
               assign(f,'Sneak_History');
               rewrite(f);
               for i:=1 to 3 do writeln(f,LONGIN xor 0);
               close(f);
	       K_ADD:=FSearch('Sneak_History','');
             end
        else begin
               assign(f,K_ADD);
               reset(f);
               for i:=1 to 3 do
                 begin
                   readln(f,k);Numbers[i]:=JMMM(k);
                   for j:=1 to Numbers[i] do
                     begin
                       readln(f,k);Bangdan[i,j,1]:=JMMM(k);
                       readln(f,k);Bangdan[i,j,2]:=JMMM(k);
                     end;
                 end;
               close(f);
             end;
    end;
  procedure zhongwen;
    var
      f:text;
    begin
      assign(f,'aaa.bat');
      rewrite(f);
      writeln(f,'@echo off');
      writeln(f,'@chcp 936');
      writeln(f,'@title贪吃蛇 '+banben+'              ');
      writeln(f,'@mode con: cols=80 lines=25');
      writeln(f,'@del aaa.bat');
      close(f);
      exec('aaa.bat','');
      clrscr;
      readd;
    end;
  procedure SHUAXIN(a,b,z:longint);
    var
      i,j,k:longint;
    begin
      for i:=1 to 10 do
        begin
          if Bangdan[a,i,1]<b
            then begin
                   for j:=10 downto i+1 do
                     begin
                       Bangdan[a,j,1]:=Bangdan[a,j-1,1];
                       Bangdan[a,j,2]:=Bangdan[a,j-1,2];
                     end;
                   if NUMBERS[a]<10 then inc(NUMBERS[a]);
                   Bangdan[a,i,1]:=b;
                   Bangdan[a,i,2]:=z;
                   save;
                   exit;
                 end;
        end;
    end;
  procedure backcolor(a:longint);
    begin
      textbackground(a);
    end;
  procedure zzzzcolor(a:longint);
    begin
      textcolor(a);
    end;
  procedure print(s:string; x,y,a,b:longint); //字符串
    begin
      gotoxy(2*x-1,y);
      textbackground(a);
      textcolor(b);
      write(s);
    end;
  procedure print(s,x,y,a,b:longint);         //数字
    begin
      gotoxy(2*x-1,y);
      textbackground(a);
      textcolor(b);
      write(s);
    end;
  procedure picture;
    var i:longint;
    begin
      backcolor(sn1_a);
      zzzzcolor(sn1_b);
      gotoxy(18*2-1,5);
      for i:=18 to 30 do write(sn1_s);write(sn1_t);
      gotoxy(18*2-1,6);write(sn1_s);
      gotoxy(18*2-1,7);write(sn1_s);
      gotoxy(18*2-1,8);write(sn1_s);
      gotoxy(19*2-1,8);write(sn1_s);
      gotoxy(20*2-1,8);write(sn1_s);
      //<<<<<<
      backcolor(sn2_a);
      zzzzcolor(sn2_b);
      gotoxy(10*2-1,11);write(sn1_t);
      for i:=11 to 23 do write(sn1_s);
      gotoxy(23*2-1,10);write(sn1_s);
      gotoxy(23*2-1,9);write(sn1_s);
      gotoxy(23*2-1,8);write(sn1_s);
      gotoxy(22*2-1,8);write(sn1_s);
      gotoxy(21*2-1,8);write(sn1_s);
      //<<<<<<
      zzzzcolor(0);
      backcolor(252);
      gotoxy(8*2-1,11);write('☆');
      gotoxy(33*2-1,5);write('☆');
    end;
  function mousechange(mo:TMouseEvent):boolean;
    var
      mo2:TMouseEvent;
    begin
      getMouseEvent(mo2);
      if (mo2.x=mo.x)and(mo2.y=mo.y)and(mo2.buttons=mo.buttons)and(mo2.action=mo.action)
        then exit(false) else exit(true);
    end;
procedure print(s:string; x,y:longint);
  begin
    gotoxy(2*x-1,y);
    write(s);
    inc(x);
  end;

procedure colorsnake;
  begin
    textbackground(green);
    textcolor(14);
  end;

procedure colorsnake2;
  begin
    textbackground(3);
    textcolor(20);
  end;
procedure colorapple;
  begin
    textbackground(12);
    textcolor(17);
  end;
procedure colorsurround;
  begin
    //textcolor(red);
    //textbackground(blue);
    backcolor(K_backcolor);
    zzzzcolor(0);
  end;


procedure waitpress;
  begin
    repeat until keypressed;
    ch:=readkey;
    if keypressed then ch:=readkey;
  end;
procedure delpress;
  begin
    while keypressed do ch:=readkey;
    if keypressed then ch:=readkey;
  end;

function turnstr(x:longint):string;
  begin
    str(x,turnstr);
    while length(turnstr)<8 do
      turnstr:='0'+turnstr;
  end;
procedure makescr;
  begin
    textbackground(black);
    clrscr;
    col:=40; line:=24;
    colorsurround;
    for i:=1 to line do
      begin
        print('│',1,i);
        print('│',col,i);
      end;
    gotoxy(1,1);
    for i:=1 to col do print('─',i,1);
    print('┌',1,1);
    print('┐',col,1);
    gotoxy(1,line);
    for i:=1 to col do print('─',i,line);
    gotoxy(1,line); write('└');
    print('┘',col,line);
    p_mark.x:=58;
    p_mark.y:=1;
    score:=0;
    score2:=0;
    if GameMoshi<>3 then print('00000000',col-4,1);
    print('00000000',2,1);

    textbackground(black);
    textcolor(white);
    print('暂停 : P',1,line+1);
    print('C : 继续',40-3,line+1);
    for i:=1 to col do begin b[i,1]:=false ;b[i,line]:=false; end;
    for i:=1 to line do begin b[1,i]:=false; b[col,i]:=false; end;
  end;

procedure getapple;
  var apple:zuobiao;
  begin
    randomize;
    colorapple;
    repeat
      apple.x:=random(col-2)+1;
      apple.y:=random(line-2)+1;
    until b[apple.x,apple.y] and not a[apple.x,apple.y];
    print('☆',apple.x,apple.y);
    a[apple.x,apple.y]:=true;
    colorsnake;
  end;

procedure jilu;
  begin
    jilu_ever:=true;
    jshe:=she; jshe2:=she2;
    ja:=a; jb:=b;
    jpoint:=point; jpoint2:=point2;
    jhead:=head; jtail:=tail;
    jhead2:=head2; jtail2:=tail2;
    jbo:=bo; jbo2:=bo2;
  end;

procedure duqu;
  var i:longint;
  begin
    textbackground(black);
    if bo then 
      for i:=tail to head do 
        print('  ',she[i,1],she[i,2]);
    if bo2 then 
      for i:=tail2 to head2 do 
        print('  ',she2[i,1],she2[i,2]);
    for i:=1 to 100 do 
      for j:=1 to 100 do 
        if a[i,j] then print('  ',i,j);

    if not jilu_ever then exit;
    she:=jshe; she2:=jshe2;
    a:=ja;   b:=jb;
    point:=jpoint; point2:=jpoint2;
    head:=jhead; tail:=jtail;
    head2:=jhead2; tail2:=jtail2;
    bo:=jbo; bo2:=jbo2;

    //clrscr;
    //makescr;
    if bo then
      begin
        colorsnake;
        for i:=tail to head do print('○',she[i,1],she[i,2]);
      end;
    if bo2 then
      begin
        colorsnake2;
        for i:=tail2 to head2 do print('○',she2[i,1],she2[i,2]);
      end;
    colorapple;
    for i:=1 to 100 do
      for j:=1 to 100 do
        if a[i,j] then print('☆',i,j);
  end;



procedure zhuanwan;
  var
    point3,point4:longint;
    ch,ch1,ch2,ch3,ch4:char;
    f:boolean;
  begin
    ch3:='e'; ch4:='e';
    f:=false;
    while keypressed do
      begin
        ch:=readkey;
        case ch of
          #72: point4:=8;
          #80: point4:=2;
          #75: point4:=4;
          #77: point4:=6;
          'w': point3:=8;
          's': point3:=2;
          'a': point3:=4;
          'd': point3:=6;
          'j': begin jilu; f:=true; break; end;
          'k': begin duqu; f:=true; break; end;
        end;
        if ch in [#72,#80,#75,#77] then ch3:=ch else
        if ch in ['w','s','a','d'] then ch4:=ch;
      end;
      if f then exit;


      if ch='p'
        then begin
               repeat
                 delay(1);
                 if keypressed then ch:=readkey;
               until ch='c';
             end
        else begin
               if GameMoshi <3
                 then begin
                        case ch3 of
                          #72:if point2<>2 then point2:=point4;
                          #80:if point2<>8 then point2:=point4;
                          #75:if point2<>6 then point2:=point4;
                          #77:if point2<>4 then point2:=point4;
                        end;
                        case ch4 of
                          'w':if point<>2 then point:=point3;
                          's':if point<>8 then point:=point3;
                          'a':if point<>6 then point:=point3;
                          'd':if point<>4 then point:=point3;
                        end;
                      end
                 else begin
                        case ch3 of
                          #72:if point<>2 then point:=point4;
                          #80:if point<>8 then point:=point4;
                          #75:if point<>6 then point:=point4;
                          #77:if point<>4 then point:=point4;
                        end;
                        case ch4 of
                          'w':if point<>2 then point:=point3;
                          's':if point<>8 then point:=point3;
                          'a':if point<>6 then point:=point3;
                          'd':if point<>4 then point:=point3;
                        end;
                      end;
             end;
  end;

procedure kuang;
  var i:longint;
  begin
    backcolor(255);
    for i:=2 to 24 do
      begin
        gotoxy(1,i); write('  ');
        gotoxy(79,i); write('  ');
      end;
    gotoxy(1,1);for i:=1 to 80 do write(' ');
    gotoxy(1,25);for i:=1 to 80 do write(' ');
    backcolor(0);
  end;
procedure enterspeed;
  var
    aa:string;
    shudu:integer;
  begin
    donemouse;
    shudu:=0;
    while (shudu>499) or (shudu<1) do
      begin
        textcolor(31);
        clrscr;
        kuang;
        gotoxy(17+2,12);
        writeln('请输入游戏速度 (1~499):           (推荐400)');
        gotoxy(26+17+2,12);  textcolor(26);
        readln(aa);
        val(aa,shudu);
        if (shudu>0) and(shudu<500) then shudu:=500-shudu else shudu:=0;
      end;
    speed:=shudu;
  end;

procedure work1;

  procedure over;
    var
      i,j:integer;
      ccc:integer;
    begin
      for i:=1 to 40 do
        for j:=6 to 20 do
          case kk[j,i] of
            0:print('  ',i,j,31,0);
            1:print('  ',i,j,28,0);
          end;
      //print('P1分数:',14,17,31,26);write(score,'  P2分数:',score2);
      //print('B:重新   E:退出',15,19,31,26);
      print('P1分数:',14,17,31,yellow);write(score,'  P2分数:',score2);
      //print('B:重新   E:退出',15,19,31,yellow);
      print('B:重新  E:退出  X:返回主菜单',12,19,31,yellow);
      textcolor(27);
      if score=score2
        then print('哟哟,百年一遇的平局出现了诶~',13,18,31,0);
      if score>score2
        then print('不错不错,和我预测的一样嘛,P1胜!',12,18,31,0);
      if score<score2
        then print('不错不错,和我预测的一样嘛,P2胜!',12,18,31,0);
      textbackground(0);
    end;
  procedure main;
    forward;
  procedure gover;
    begin
      delay(100);
      textbackground(black);
      //clrscr;
      over;
      ch:='q';
      while not(ch in ['e','E','b','B']) do
        begin
          ch:=readkey;
          case ch of
            'e','E':halt;
            'b','B':break;
            'x','X':begin GameMoshi:=0;exit; end;
          end;
        end;
      main;
    end;
  procedure main;
    var k:longint;
      begin

        K_backcolor:=random(7)+1;
        cursoroff;
        bo:=true; bo2:=true;
        fillchar(b,sizeof(b),1);
        fillchar(a,sizeof(a),0);
        enterspeed;
        makescr;

        x:=2; y:=2;
        colorsnake;
        for i:=1 to 4 do
          begin
            she[i,1]:=x; she[i,2]:=2;
            b[x,y]:=false;
            print('○',x,y); inc(x);
          end;  //==========snake
        head:=4; tail:=1;
        point:=6;

        colorsnake2;
        x:=col-1; y:=line-1;
        for i:=1 to 4 do
          begin
            b[x,y]:=false;
            she2[i,1]:=x; she2[i,2]:=y; print('○',x,y); dec(x);
          end;
        head2:=4; tail2:=1; point2:=4;
        getapple; getapple;

        repeat
          delay(speed);
          zhuanwan;
          if bo
            then begin
                   inc(head);
                   if point=6 then begin she[head,1]:=she[head-1,1]+1; she[head,2]:=she[head-1,2]; end;
                   if point=2 then begin she[head,1]:=she[head-1,1]; she[head,2]:=she[head-1,2]+1; end;
                   if point=8 then begin she[head,1]:=she[head-1,1]; she[head,2]:=she[head-1,2]-1; end;
                   if point=4 then begin she[head,1]:=she[head-1,1]-1; she[head,2]:=she[head-1,2]; end;
                   if not b[she[head,1],she[head,2]]
                     then begin
                            bo:=false;
                            textbackground(black);
                            for i:=tail to head-1 do
                              begin
                                print('  ',she[i,1],she[i,2]);
                                b[she[i,1],she[i,2]]:=true;
                              end;
                            if not bo and not bo2 then begin gover; if GameMoshi=0 then exit; end;
                          end;
                   if bo
                     then begin
                            b[she[head,1],she[head,2]]:=false;
                            colorsnake;
                            print('○',she[head-1,1],she[head-1,2]);
                            print('◎',she[head,1],she[head,2]);
                            if not a[she[head,1],she[head,2]]
                              then begin
                                     textbackground(black);
                                     print('  ',she[tail,1],she[tail,2]);
                                     b[she[tail,1],she[tail,2]]:=true;
                                     inc(tail);
                                     colorsnake;
                                   end
                              else begin
                                     inc(score,500-speed);
                                     colorsurround;
                                     print(turnstr(score),2,1);
                                     a[she[head,1],she[head,2]]:=false;
                                     getapple;
                                   end;
                          end;
                 end;
          if bo2
            then begin
                   inc(head2);
                   if point2=6 then begin she2[head2,1]:=she2[head2-1,1]+1; she2[head2,2]:=she2[head2-1,2]; end;
                   if point2=2 then begin she2[head2,1]:=she2[head2-1,1]; she2[head2,2]:=she2[head2-1,2]+1; end;
                   if point2=8 then begin she2[head2,1]:=she2[head2-1,1]; she2[head2,2]:=she2[head2-1,2]-1; end;
                   if point2=4 then begin she2[head2,1]:=she2[head2-1,1]-1; she2[head2,2]:=she2[head2-1,2]; end;
                   if not b[she2[head2,1],she2[head2,2]]
                     then begin
                            bo2:=false;
                            textbackground(black);
                            for i:=tail2 to head2-1 do
                              begin
                                print('  ',she2[i,1],she2[i,2]);
                                b[she2[i,1],she2[i,2]]:=true;
                              end;
                            if not bo and not bo2 then begin gover; if GameMoshi=0 then exit; end;
                          end;
                   if bo2
                     then begin
                            b[she2[head2,1],she2[head2,2]]:=false;
                            colorsnake2;
                            print('○',she2[head2-1,1],she2[head2-1,2]);
                            print('⊙',she2[head2,1],she2[head2,2]);
                            if not a[she2[head2,1],she2[head2,2]]
                              then begin
                                     textbackground(black);
                                     print('  ',she2[tail2,1],she2[tail2,2]);
                                     b[she2[tail2,1],she2[tail2,2]]:=true;
                                     inc(tail2);
                                     colorsnake2;
                                   end
                              else begin
                                     inc(score2,500-speed);
                                     colorsurround;
                                     print(turnstr(score2),col-4,1); colorsnake2;
                                     a[she2[head2,1],she2[head2,2]]:=false;
                                     getapple;
                                   end;
                          end;
                 end;
        until false;
      end;
  begin
    main;
  end;

procedure work2;
  procedure over;
    var
      i,j:integer;
      ccc:integer;
    begin
      for i:=1 to 40 do
        for j:=6 to 20 do
          case kk[j,i] of
            0:print('  ',i,j,31,0);
            1:print('  ',i,j,28,0);
          end;
      //print('P1分数:',12,17,31,26);write(score,'  P2分数:',score2,'  总分:',score+score2);
      //print('B:重新   E:退出',15,19,31,26);
      print('P1分数:',12,17,31,yellow);write(score,'  P2分数:',score2,'  总分:',score+score2);
      SHUAXIN(2,score+score2,FNOWTIME(1));
      print('B:重新  E:退出  X:返回主菜单',12,19,31,yellow);
      textcolor(27);
      ccc:=(score+score2) div 1000;
      case ccc of
        0,1: ccc:=random(2);  //0,1
        2: ccc:=random(2)+2;//2,3
        3,4: ccc:=random(2)+4;//4,5
        5,6: ccc:=random(2)+6;//6,7
        7..10: ccc:=random(2)+8;//8,9
        11..15: ccc:=random(2)+10;//10,11
        16..20:ccc:=random(2)+12;//12,13
        else ccc:=14;
      end;
      case ccc of
        0:print('小样儿幼儿园刚毕业吧?',14,18,31,0);
        1:print('新手上路,任然没有关照.',14,18,31,0);
        2:print('小样儿你小学几年级?',15,18,31,0);
        3:print('楼房不要盖太高,会倒的.',14,18,31,0);
        4:print('入门级别,施主不必惊喜!',14,18,31,0);
        5:print('哟哟哟,小学毕业了啊?',14,18,31,0);
        6:print('不错不错,小子你有前途!',14,18,31,0);
        7:print('~~~~~孺子可教也~~~~~',14,18,31,0);
        8:print('诶,你听说了吗,最近到处有高手诶.',12,18,31,0);
        9:print('初中毕业生啊,我好久没遇到了......',12,18,31,0);
        10:print('我看出你有前途,不过不要太骄傲!',12,18,31,0);
        11:print('有武林高手出没,小心啊',14,18,31,0);
        12:print('真不错,好久没遇到这样的人了.',12,18,31,0);
        13:print('哎呀妈呀,你还真有耐心.',14,18,31,0);
        14:print('难道你就是传说中的武陵高手?',13,18,31,0);
      end;
      textbackground(0);
    end;
  procedure main; forward;
  procedure gover;
    begin
      delay(100);
      textbackground(black);
      delpress;

      delay(400);
      //clrscr;
      over;
      {textcolor(yellow);
      writeln('失败了！！！');
      write('玩家1   : '); writeln(score2);
      write('玩家2   : '); writeln(score);
      write('最终成绩: ');  writeln(score+score2);
      textcolor(white);
      writeln;
      delpress;
      writeln; writeln; writeln('再来一次？  n:退出;  其它: 再来一次');}
      ch:='q';
      while not(ch in ['e','E','b','B','x','X']) do
        begin
          ch:=readkey;
          case ch of
            'e','E':halt;
            'b','B':break;
            'x','X':begin GameMoshi:=0;exit end;
          end;
        end;
      main;
    end;
  procedure main;
var k:longint;
begin
  cursoroff;
  bo:=true; bo2:=true;
  fillchar(b,sizeof(b),1);
  fillchar(a,sizeof(a),0);
  enterspeed;

  K_backcolor:=random(7)+1;
  makescr;

  x:=2; y:=2;
  colorsnake;
  for i:=1 to 4 do begin
    she[i,1]:=x; she[i,2]:=2;
    b[x,y]:=false;
    print('○',x,y); inc(x);
  end;  //==========snake
  head:=4; tail:=1;
  point:=6;

  colorsnake2;
  x:=col-1; y:=line-1;
  for i:=1 to 4 do begin
    b[x,y]:=false;
    she2[i,1]:=x; she2[i,2]:=y; print('○',x,y); dec(x);
  end;
  head2:=4; tail2:=1; point2:=4;
  getapple; getapple;

  repeat
    delay(speed);
    zhuanwan;
    if bo then begin
     inc(head);
     if point=6 then begin she[head,1]:=she[head-1,1]+1; she[head,2]:=she[head-1,2]; end;
     if point=2 then begin she[head,1]:=she[head-1,1]; she[head,2]:=she[head-1,2]+1; end;
     if point=8 then begin she[head,1]:=she[head-1,1]; she[head,2]:=she[head-1,2]-1; end;
     if point=4 then begin she[head,1]:=she[head-1,1]-1; she[head,2]:=she[head-1,2]; end;
     if not b[she[head,1],she[head,2]] then begin
       bo:=false;
       textbackground(black);
       for i:=tail to head-1 do begin
         print('  ',she[i,1],she[i,2]);
         b[she[i,1],she[i,2]]:=true;
       end;
       if not bo or not bo2 then begin gover;if GameMoshi=0 then exit; end;
     end;
    if bo then begin
     b[she[head,1],she[head,2]]:=false;
     colorsnake;
     print('○',she[head-1,1],she[head-1,2]);
     print('◎',she[head,1],she[head,2]);
     if not a[she[head,1],she[head,2]] then begin
       textbackground(black);
       print('  ',she[tail,1],she[tail,2]);
       b[she[tail,1],she[tail,2]]:=true;
       inc(tail);
       colorsnake;
     end
     else begin
       inc(score,500-speed);
       colorsurround;
       print(turnstr(score),2,1);
       a[she[head,1],she[head,2]]:=false;
       getapple;
     end;
    end;
    end;
   if bo2 then begin
    inc(head2);
    if point2=6 then begin she2[head2,1]:=she2[head2-1,1]+1; she2[head2,2]:=she2[head2-1,2]; end;
    if point2=2 then begin she2[head2,1]:=she2[head2-1,1]; she2[head2,2]:=she2[head2-1,2]+1; end;
    if point2=8 then begin she2[head2,1]:=she2[head2-1,1]; she2[head2,2]:=she2[head2-1,2]-1; end;
    if point2=4 then begin she2[head2,1]:=she2[head2-1,1]-1; she2[head2,2]:=she2[head2-1,2]; end;
    if not b[she2[head2,1],she2[head2,2]] then begin
      bo2:=false;
      textbackground(black);
      for i:=tail2 to head2-1 do begin
        print('  ',she2[i,1],she2[i,2]);
        b[she2[i,1],she2[i,2]]:=true;
      end;
      if not bo or not bo2 then begin gover; if GameMoshi=0 then exit; end;
    end;
   if bo2 then begin
    b[she2[head2,1],she2[head2,2]]:=false;
    colorsnake2;
    print('○',she2[head2-1,1],she2[head2-1,2]);
    print('⊙',she2[head2,1],she2[head2,2]);
    if not a[she2[head2,1],she2[head2,2]]then begin
      textbackground(black);
      print('  ',she2[tail2,1],she2[tail2,2]);
      b[she2[tail2,1],she2[tail2,2]]:=true;
      inc(tail2);
      colorsnake2;
    end
    else
      begin
        inc(score2,500-speed);
        colorsurround;
        print(turnstr(score2),col-4,1); colorsnake2;
        a[she2[head2,1],she2[head2,2]]:=false;
        getapple;
      end;
   end;
  end;
  until false;
end;
begin
  main;
end;
procedure work3;
  procedure over;
    var
      i,j:integer;
      ccc:integer;
    begin
      for i:=1 to 40 do
        for j:=6 to 20 do
          case kk[j,i] of
            0:print('  ',i,j,31,0);
            1:print('  ',i,j,28,0);
          end;
      //print('分数:',16,17,31,26);
      //print(score,19,17,31,26);
      //print('B:重新   E:退出',15,19,31,26);
      print('分数:',16,17,31,yellow);
      print(score,19,17,31,yellow);
      print('B:重新  E:退出  X:返回主菜单',12,19,31,yellow);
      SHUAXIN(1,score,FNOWTIME(1));
      textcolor(27);
      ccc:=score div 1000;
      case ccc of
        0,1: ccc:=random(2);  //0,1
        2: ccc:=random(2)+2;//2,3
        3,4: ccc:=random(2)+4;//4,5
        5,6: ccc:=random(2)+6;//6,7
        7..10: ccc:=random(2)+8;//8,9
        11..15: ccc:=random(2)+10;//10,11
        16..20:ccc:=random(2)+12;//12,13
        else ccc:=14;
      end;
      case ccc of
        0:print('小样儿幼儿园刚毕业吧?',14,18,31,0);
        1:print('新手上路,任然没有关照.',14,18,31,0);
        2:print('小样儿你小学几年级?',15,18,31,0);
        3:print('楼房不要盖太高,会倒的.',14,18,31,0);
        4:print('入门级别,施主不必惊喜!',14,18,31,0);
        5:print('哟哟哟,小学毕业了啊?',14,18,31,0);
        6:print('不错不错,小子你有前途!',14,18,31,0);
        7:print('~~~~~孺子可教也~~~~~',14,18,31,0);
        8:print('诶,你听说了吗,最近到处有高手诶.',12,18,31,0);
        9:print('初中毕业生啊,我好久没遇到了......',12,18,31,0);
        10:print('我看出你有前途,不过不要太骄傲!',12,18,31,0);
        11:print('有武林高手出没,小心啊',14,18,31,0);
        12:print('真不错,好久没遇到这样的人了.',12,18,31,0);
        13:print('哎呀妈呀,你还真有耐心.',14,18,31,0);
        14:print('难道你就是传说中的武陵高手?',13,18,31,0);
      end;
      textbackground(0);
    end;
procedure main; forward;
procedure gover;
  begin
    delay(100);
    textbackground(black);
    //clrscr;
    over;
      ch:='q';
      while not(ch in ['e','E','b','B','x','X']) do
        begin
          ch:=readkey;
          case ch of
            'e','E':halt;
            'b','B':break;
            'x','X':begin GameMoshi:=0; exit; end;
          end;
        end;
      main;
  end;
procedure main;
begin
  bo:=true;
  bo2:=false;
  fillchar(b,sizeof(b),1);
  fillchar(a,sizeof(a),0);

  K_backcolor:=random(7)+1;
  clrscr;
  cursoroff;
  enterspeed;
  makescr;

  colorsnake;
  x:=2; y:=2;
  for i:=1 to 4 do begin print('○',x,y); inc(x);end;
  she[1,1]:=2; she[1,2]:=2;
  she[2,1]:=3; she[2,2]:=2;
  she[3,1]:=4; she[3,2]:=2;
  she[4,1]:=5; she[4,2]:=2;
  head:=4; tail:=1;
  for i:=tail to head do b[she[i,1],she[i,2]]:=false;
  point:=6;
  getapple;


  repeat
    delay(speed); 
    zhuanwan;
    colorsnake;
    inc(head);
    if point=6 then begin she[head,1]:=she[head-1,1]+1; she[head,2]:=she[head-1,2]; end;
    if point=2 then begin she[head,1]:=she[head-1,1]; she[head,2]:=she[head-1,2]+1; end;
    if point=8 then begin she[head,1]:=she[head-1,1]; she[head,2]:=she[head-1,2]-1; end;
    if point=4 then begin she[head,1]:=she[head-1,1]-1; she[head,2]:=she[head-1,2]; end;
    if not b[she[head,1],she[head,2]] then  begin  bo:=false; gover; if GameMoshi=0 then exit; end;
    b[she[head,1],she[head,2]]:=false;
    print('○',she[head-1,1],she[head-1,2]);
    print('◎',she[head,1],she[head,2]);
    if not a[she[head,1],she[head,2]] then
      begin
        textbackground(black);
        print('  ',she[tail,1],she[tail,2]);
        b[she[tail,1],she[tail,2]]:=true;
        inc(tail);
        colorsnake;
      end
    else
      begin
        inc(score,500-speed);
        colorsurround; print(turnstr(score),2,1); colorsnake;
        a[she[head,1],she[head,2]]:=false;
        getapple;
      end;
  until false;
end;
begin
  main;
end;



  procedure kai;
    const
      ss:array[18..21]of string=('单人模式','合作模式','竞技模式','闯关模式');
    var
      k:longint;
      mo:TMouseEvent;
    begin
      GameMoshi:=1;
      backcolor(0);
      zzzzcolor(31);
      gotoxy(19*2-1,19);write(ss[19]);
      gotoxy(19*2-1,20);write(ss[20]);
      gotoxy(19*2-1,21);write(ss[21]);
      zzzzcolor(2);
      gotoxy(19*2-1,18);write(ss[18]);
      gotoxy(17*2-1,18);write('→');
      gotoxy(24*2-1,18);write('←');
      k:=18;
      getMouseEvent(mo);
      while true do
        begin
              getMouseEvent(mo);
              if (mo.action=1)and(mo.buttons=2)
                then begin
                       while true do
                         begin
                           getMouseEvent(mo);
                           if mo.action=2 then break;
                         end;
                       backcolor(0);
                       zzzzcolor(31);
                       gotoxy(17*2-1,19);write('    操作说明    ');
                       gotoxy(17*2-1,20);write('    游戏说明    ');
                       gotoxy(17*2-1,21);write('    本地排行    ');
                       zzzzcolor(2);
                       gotoxy(17*2-1,18);write('    开始游戏    ');
                       gotoxy(17*2-1,18);write('→');
                       gotoxy(24*2-1,18);write('←');
                       exit;
                     end;
              if (mo.x+1>=17*2-1)and(mo.x+1<=25*2)and(mo.y+1>=18)and(mo.y+1<=21)
                then begin
                       if mo.y+1<>k
                         then begin
                                print('    '+ss[k]+'    ',17,k,0,31);
                                k:=mo.y+1;
                                print('→  '+ss[k]+'  ←',17,k,0,2);
                              end;
                       if mo.action=2
                         then begin
                                case k of
                                  18:begin GameMoshi:=3; work3; if GameMoshi=0 then exit;end;
                                  19:begin GameMoshi:=2; work2; if GameMoshi=0 then exit;end;
                                  20:begin GameMoshi:=1; work1; if GameMoshi=0 then exit;end;
                                  31:;
                                end;
                              end;
                     end;
        end;
    end;


  procedure Tiaotiao(k:byte);
    var
      i:longint;
    begin
      backcolor(k);
      gotoxy(2*2-1,4);for i:=2 to 39 do write('  ');
      gotoxy(2*2-1,5);for i:=2 to 39 do write('  ');
      gotoxy(2*2-1,6);for i:=2 to 39 do write('  ');
      gotoxy(2*2-1,7);for i:=2 to 39 do write('  ');
      gotoxy(2*2-1,8);for i:=2 to 39 do write('  ');
      gotoxy(2*2-1,9);for i:=2 to 39 do write('  ');
      gotoxy(2*2-1,10);for i:=2 to 39 do write('  ');
      gotoxy(2*2-1,11);for i:=2 to 39 do write('  ');
    end;
  procedure CaoZuoShuoMing;
    var
      i,j,k:longint;
      mo:TMouseEvent;
    begin
      tiaotiao(31);zzzzcolor(0);
      gotoxy(8*2-1,5);write('       P1                             P1        P2');
      gotoxy(8*2-1,6);write('单 闯 向上:W/↑               合 竞 向上:W    向上:↑');
      gotoxy(8*2-1,7);write('人 关 向下:S/↓               作 技 向下:S    向下:↓');
      gotoxy(8*2-1,8);write('模 模 向左:A/←               模 模 向左:A    向左:←');
      gotoxy(8*2-1,9);write('式 式 向右:D/→               式 式 向右:D    向右:→');
      zzzzcolor(red);backcolor(0);
      gotoxy(17*2-1,19);write('→  返    回  ←');
      while true do
        begin
          getMouseEvent(mo);
          if (mo.action=2)and(mo.y+1=19)and(mo.x+1>16*2-1)and(mo.x+1<25*2)
            then begin
                   tiaotiao(0);
                   picture;
                   gotoxy(17*2-1,19);
                   zzzzcolor(green);
                   backcolor(0);
                   write('→  操作说明  ←');
                   exit;
                 end;
        end;
    end;
  procedure GameShuoMing;
    var
      i,j,k:longint;
      mo:TMouseEvent;
    begin
      tiaotiao(31);zzzzcolor(0);
      gotoxy(2*2-1,5); write('                                贪吃蛇[游戏说明]');
      gotoxy(2*2-1,7); write('                    编写平台及版本为 Free Pascal 2.0.4 .');
      gotoxy(2*2-1,8); write('                                 当前版本为'+banben);
      //gotoxy(2*2-1,11);write('                                                                                                ');
      zzzzcolor(red);backcolor(0);
      gotoxy(17*2-1,20);write('→  返    回  ←');
      while true do
        begin
          getMouseEvent(mo);
          if (mo.action=2)and(mo.y+1=20)and(mo.x+1>16*2-1)and(mo.x+1<25*2)
            then begin
                   tiaotiao(0);
                   picture;
                   gotoxy(17*2-1,20);
                   zzzzcolor(green);
                   backcolor(0);
                   write('→  游戏说明  ←');
                   exit;
                 end;
        end;
    end;

 procedure BenDiPaiHang;

  procedure TiaoTiao2(k:byte);
    var
      i,j:longint;
    begin
      backcolor(k);
      for i:=2 to 24 do
        begin
          gotoxy(12*2-1,i);
          for j:=12 to 29 do write('  ');
        end;
    end;
  procedure FangKuai(z,colorss,colorsss:integer);
    const
      AnNiu:array[1..3,1..4]of string=(('    ╱  ',
                                        '  ╱    ',
                                        '  ╲    ',
                                        '    ╲  '),
                                       ('        ',
                                        '  ╭╮  ',
                                        '  ╰╯  ',
                                        '        '),
                                       ('  ╲    ',
                                        '    ╲  ',
                                        '    ╱  ',
                                        '  ╱    '));
     x1:array[1..3]of integer=(13,19,25);
    var
      i,j,k,x,y:longint;
    begin
      x:=x1[z];y:=19;
      backcolor(colorss);
      zzzzcolor(colorsss);
      for i:=1 to 4 do
        begin
          gotoxy(x*2-1,y+i-1);write(AnNiu[z,i]);
        end;
    end;
  function PaiMou(mo:TMouseEvent):integer;
    begin
      case mo.y+1 of
        5:begin
            case ((mo.x+1) div 2) of
              14,15,16,17:if mo.action=2 then exit(4) else exit(1);
              19,20,21,22:if mo.action=2 then exit(5) else exit(2);
              24,25,26,27:if mo.action=2 then exit(6) else exit(3);
            end;
          end;
        19,20,21,22:begin
                      case ((mo.x+1) div 2) of
                        13,14,15,16:if mo.action=2 then exit(10) else exit(7);
                        19,20,21,22:if mo.action=2 then exit(11) else exit(8);
                        25,26,27,28:if mo.action=2 then exit(12) else exit(9);
                      end;
                    end;
      end;
      exit(0);
    end;

procedure dealk(k:longint);
begin
case k of
                  1:begin gotoxy(13*2-1,5);backcolor(yellow);write('  '); end;
                  2:begin gotoxy(18*2-1,5);backcolor(yellow);write('  '); end;
                  3:begin gotoxy(23*2-1,5);backcolor(yellow);write('  '); end;
                  7:FangKuai(1,yellow+8,0);
                  //8:Fangkuai(2,yellow,1);
		  8:Fangkuai(2,yellow+8,0);
                  9:Fangkuai(3,yellow+8,0);
                end;
end;

  procedure ShowFen(a,b:integer);
    begin
      backcolor(31);
      zzzzcolor(0);
      gotoxy(21*2+4,11);write(b,' ');
      gotoxy(21*2,12);write('             ');gotoxy(21*2,12);write(Bangdan[a,b,1],'       ');
      gotoxy(21*2,13);write('        ');gotoxy(21*2,13);write(Bangdan[a,b,2]);
    end;
  procedure main;
    var
      i,j,k,m,n,aaa,bbb:longint;
      mo:TMouseEvent;
    begin
      //TiaoTiao(0);
      TiaoTiao2(31);
      backcolor(yellow);
      for i:=4 to 6 do
        begin
          gotoxy(13*2-1,i);
          for j:=13 to 28 do write('  ');
        end;
      zzzzcolor(0);
      gotoxy(14*2-1,5);write('单人模式');
      gotoxy(19*2-1,5);write('合作模式');
      gotoxy(24*2-1,5);write('闯关模式');
      backcolor(1);
      for i:=9 to 16 do
        begin
          gotoxy(13*2-1,i);write('  ');
          gotoxy(28*2-1,i);write('  ');
        end;
      gotoxy(13*2-1,8);for i:=13 to 28 do write('  ');
      gotoxy(13*2-1,17);for i:=13 to 28 do write('  ');
      FangKuai(1,yellow+8,0);
      Fangkuai(2,yellow,1);
      Fangkuai(3,yellow+8,0);
      k:=0;aaa:=1;bbb:=1;
      backcolor(31);
      zzzzcolor(0);
      gotoxy(16*2-1,11);write('本地排名:  NO. ');
      gotoxy(16*2-1,12);write('有效总分:  ');
      gotoxy(16*2-1,13);write('刷新时间:  ');
      gotoxy(20*2-1,16);write('1/10');
      gotoxy(15*2-1,7);backcolor(31);zzzzcolor(1);write('╲╱');
      ShowFen(1,1);
      while true do
        begin
          getMouseEvent(mo);
          n:=PaiMou(mo);
          if n<>k then
          case n of
            0:begin
                case k of
                  1:begin gotoxy(13*2-1,5);backcolor(yellow);write('  '); end;
                  2:begin gotoxy(18*2-1,5);backcolor(yellow);write('  '); end;
                  3:begin gotoxy(23*2-1,5);backcolor(yellow);write('  '); end;
                  7:FangKuai(1,yellow+8,0);
                  //8:Fangkuai(2,yellow,1);
		  8:Fangkuai(2,yellow+8,0);
                  9:Fangkuai(3,yellow+8,0);
                end;
                k:=0;
              end;

            1:begin dealk(k); k:=1;gotoxy(13*2-1,5);backcolor(yellow);zzzzcolor(red);write(' >'); end;
            2:begin dealk(k); k:=2;gotoxy(18*2-1,5);backcolor(yellow);zzzzcolor(red);write(' >'); end;
            3:begin dealk(k); k:=3;gotoxy(23*2-1,5);backcolor(yellow);zzzzcolor(red);write(' >'); end;
            4:begin dealk(k); k:=4; if aaa<>1 then begin showfen(1,1);aaa:=1;bbb:=1; end;
                    gotoxy(20*2-1,16);backcolor(31);zzzzcolor(0);write('1/10');
                    gotoxy(15*2-1,7);backcolor(31);zzzzcolor(1);write('╲╱');
                    gotoxy(20*2-1,7); write('    ');gotoxy(25*2-1,7);write('   ');
              end;
            5:begin dealk(k); k:=4; if aaa<>2 then begin showfen(2,1);aaa:=2;bbb:=1; end;
                    gotoxy(20*2-1,16);backcolor(31);zzzzcolor(0);write('1/10');
                    gotoxy(20*2-1,7);backcolor(31);zzzzcolor(1);write('╲╱');
                    gotoxy(15*2-1,7); write('    ');gotoxy(25*2-1,7);write('   ');
              end;
            6:begin dealk(k); k:=4; if aaa<>3 then begin showfen(3,1);aaa:=3;bbb:=1; end;
                    gotoxy(20*2-1,16);backcolor(31);zzzzcolor(0);write('1/10');
                    gotoxy(25*2-1,7);backcolor(31);zzzzcolor(1);write('╲╱');
                    gotoxy(20*2-1,7); write('    ');gotoxy(15*2-1,7);write('   ');
              end;

            7:begin dealk(k); k:=7; FangKuai(1,2,0); end;
            8:begin dealk(k); k:=8; FangKuai(2,2,0); end;
            9:begin dealk(k); k:=9; FangKuai(3,2,0); end;
            10:begin dealk(k); k:=11; bbb:=((bbb+8)mod 10)+1;ShowFen(aaa,bbb); gotoxy(20*2-1,16);write(bbb,'/10  '); end;
            11:begin
                 TiaoTiao2(0);
                 picture;
                 backcolor(0);
                 zzzzcolor(31);
                 gotoxy(17*2-1,15);write('贪吃蛇');
                 gotoxy(20*2-1,16);write(banben);
                 gotoxy(19*2-1,18);write('开始游戏');
                 gotoxy(19*2-1,19);write('操作说明');
                 gotoxy(19*2-1,20);write('游戏说明');
                 zzzzcolor(2);
                 gotoxy(17*2-1,21);write('→  本地排行  ←');
                 exit;
               end;
            12:begin k:=11; bbb:=(bbb mod 10)+1;ShowFen(aaa,bbb); gotoxy(20*2-1,16);write(bbb,'/10  '); end;
          end;
        end;
    end;
    begin
      main;
    end;


  procedure zhujiemian;
    const
      ss:array[18..21]of string=('开始游戏','操作说明','游戏说明','本地排行');
    var
      k:longint;
      mo:TMouseEvent;
    begin
      jilu_ever:=false;
      cursoroff;
      backcolor(0);
      clrscr;
      kuang;
      picture;
      backcolor(0);
      zzzzcolor(31);
      gotoxy(17*2-1,15);write('     贪吃蛇');
      gotoxy(20*2-1,16);write(banben);
      gotoxy(19*2-1,19);write('操作说明');
      gotoxy(19*2-1,20);write('游戏说明');
      gotoxy(19*2-1,21);write('本地排行');
      zzzzcolor(2);
      gotoxy(19*2-1,18);write('开始游戏');
      gotoxy(17*2-1,18);write('→');
      gotoxy(24*2-1,18);write('←');
      initmouse;
      k:=18;
      getMouseEvent(mo);
      while true do
        begin
         { while mousechange(mo) do
            begin }
              getMouseEvent(mo);
              if (mo.x+1>=17*2-1)and(mo.x+1<=25*2)and(mo.y+1>=18)and(mo.y+1<=21)
                then begin
                       if mo.y+1<>k
                         then begin
                                print('    '+ss[k]+'    ',17,k,0,31);
                                k:=mo.y+1;
                                print('→  '+ss[k]+'  ←',17,k,0,2);
                              end;
                       if mo.action=2
                         then begin
                                case k of
                                  18:begin kai; if GameMoshi=0 then exit; end;
                                  19:CaoZuoShuoMing;
                                  20:GameShuoming;
                                  21:BenDiPaiHang;
                                end;
                              end;
                     end;
        //    end;
        end;
      donemouse;
    end;
begin
  zhongwen;
  GameMoshi:=0;
  K_backcolor:=random(7)+1;
  while GameMoshi=0 do
  zhujiemian;
end.
