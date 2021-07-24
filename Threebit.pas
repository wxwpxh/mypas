program Threebit;    
var x,n,a,b,c:INTEGER;
BEGIN 
	write('Input 3 bit nature data:'); 
	readln(n);                                       
	IF (n>99) and (n<1000) then
		begin 
			a:=n DIV 100;		{求百位数}      
			b:=(n-a*100) DIV 10;{求十位数}
			c:=n mod 10;        {求个位数}
			x:=c*100+b*10+a;    {得新数X}
			writeln('Number=',x:3);
			end
	ELSE 
		writeln('Input error!');
END.     
