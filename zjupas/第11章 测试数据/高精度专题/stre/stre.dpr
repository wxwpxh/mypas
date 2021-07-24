program Stre;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
	MaxVolume = 501;
type
	TArr = array [1..MaxVolume] of Longint;
var
	X, Y, R: TArr;
	P, i, Bits, Power, XLength, YLength, RLength, u: Longint;
  Num : String;

procedure Multiply(A, B: TArr; LA,LB: Longint);
var
	l, q, e: Longint;
begin
	for l:= 1 to LA do
		for q:= 1 to LB do
			if l+q <= 301 then
				inc(R[l+q-1], A[l]*B[q]);
	if LA+LB > 301 then e:= 300
				   else e:= l+q-1;
	for l:=1 to e do
	begin
		inc(R[l+1], R[l] div 10);
		R[l]:= R[l] mod 10;
	end;
	l:=e+1;
	while R[l] = 0 do
		dec(l);
	RLength:= l;
end;

procedure Main;
var
	t: Longint;
begin
	readln(P);
	fillchar(X, sizeof(X), 0);
	fillchar(R, sizeof(R), 0);
	X[1]:= 2;
	XLength:= 1;
	RLength:= 0;
	Power:= 1;
	while (Power shl 1) <= P do
	begin
		Multiply(X, X, XLength, Xlength);
		X:= R;
		XLength:= RLength;
		fillchar(R, sizeof(R), 0);
		Power:= Power shl 1;
	end;
	while Power < P do
	begin
		fillchar(Y, sizeof(Y), 0);
		Y[1]:= 2;
		YLength:= 1;
		t:= 1;
		while (t shl 1) <= P-Power do
		begin
			Multiply(Y, Y, YLength, YLength);
			Y:= R;
			YLength:= RLength;
			fillchar(R, sizeof(R), 0);
			t:= t shl 1;
		end;
		Multiply(X, Y, XLength, YLength);
		X:= R;
		XLength:= RLength;
		fillchar(R, sizeof(R), 0);
		inc(Power, t);
	end;
	for i:= 300 downto 1 do
		write(X[i]);
end;

begin
  for u := 1 to 10 do
  begin
    Num := IntToStr(u);
  	assign(input, 'stre' + Num + '.in');
  	assign(output, 'stre' + Num + '.out');
	  reset(input);
  	rewrite(output);
	  Main;
  	close(input);
	  close(output);
  end;
end.
