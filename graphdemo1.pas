program graphdemo1(input,output);
uses graph,crt;
var
 gm,gd,x,y,sx,sy,r,i:integer;
begin
  cursoroff;
  randomize;
  initgraph(gm,gd, ' '); {初始化图形界面}
  r:=50;           {设置圆的半径}
  x:=50;          {设置圆的初始坐标}
  y:=50;
  sx:=10;        {设置圆每次移动的距离，相当于速度}
  sy:=10;
  for i:=1 to 50 do begin
    circle(x,y,r); {}在图形界面上画圆
    writeln('x:':5,x:5,'y:':5,y:5,'r:':5,r:5); {在文本界面上输出圆圈的坐标及半径}
    delay(50);
    cleardevice;   {cleardevice:相当于图形界面的clrscr}
    x:=x+sx;
    y:=y+sy;       {屏幕分辨率：1024*768}
    if (x>=1024-r) or (x<=r) then sx:=-sx;
    if (y>=768-r) or (y<=r) then sy:=-sy;
  end;
  closegraph;     {关闭图形界面}
end.
