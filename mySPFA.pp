{
  图论-单源最短路SPFA-邻接表
}
program mySPFA;
var list,dis:array[0..10000] of longint;
    next,toit,cost,q:array[0..100000] of longint;
    flag:array[0..100000] of boolean;
    n,m,i,a,b,c,s,e,tot:longint;

procedure add(a,b,c:longint);
begin
    inc(tot);
    toit[tot]:=b; //当前边的出点
    cost[tot]:=c; //边权
    next[tot]:=list[a]; //当前边指向的前一条边
    list[a]:=tot; //当前边的入点a引出的边的标号
end;

procedure SPFA;
var i,head,tail,v,k:longint;
begin
    fillchar(flag,sizeof(flag),true);
    for i:=1 to n do dis[i]:=maxlongint;
    head:=1;
    tail:=1;
    q[1]:=s;
    dis[s]:=0;
    flag[s]:=false;
    repeat
        v:=q[head];
        k:=list[v];
        while k<>0 do begin
            if dis[v]+cost[k]<dis[toit[k]] then begin
                dis[toit[k]]:=dis[v]+cost[k];
                if flag[toit[k]] then begin
                    inc(tail);
                    q[tail]:=toit[k];
                    flag[toit[k]]:=false;
                end;
            end;
            k:=next[k];
        end;
        flag[v]:=true;
        inc(head);
    until head>tail;
end;

begin
    fillchar(list,sizeof(list),0);
    fillchar(next,sizeof(next),0);
    fillchar(toit,sizeof(toit),0);
    fillchar(cost,sizeof(cost),0);
    tot:=0;
    readln(n,m);
    for i:=1 to m do begin
        readln(a,b,c);
        add(a,b,c);
    end;
    readln(s,e);
    SPFA;
    if dis[e]<maxlongint then writeln(dis[e]) else writeln('No Solution');
end.
