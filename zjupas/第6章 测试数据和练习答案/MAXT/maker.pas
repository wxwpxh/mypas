var
    s,x,y:array[1..100]of longint;
	ans,ii,k,num,i,j,n,m:longint;
begin
	randomize;
	for i:=0 to 9 do
		begin
			assign(output,'MAXT'+chr(48+i)+'.IN');rewrite(output);
            n:=random(50)+1;
            writeln(n);
            for j:=1 to n do
                begin
                    x[j]:=random(1000)+1;y[j]:=random(1000)+1;
                    writeln(x[j],' ',y[j]);
                    s[j]:=x[j]*y[j];
                end;
			close(output);
			assign(output,'MAXT'+chr(48+i)+'.OUT');rewrite(output);
            ans:=0;
    for ii:=1 to n do
        for j:=1 to n do 
            for k:=1 to n do 
                if (x[ii]>x[j])and(x[j]>x[k])and(y[ii]>y[j])and(y[j]>y[k]) then
                    begin
                        m:=s[ii]+s[j]+s[k];
                        if m>ans then ans:=m;
                    end;
            writeln(ans);
			close(output);
		end;
end.
