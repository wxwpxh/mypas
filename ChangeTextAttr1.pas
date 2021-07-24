{$M $4000,0,0}

program ChangeTextAttr;
uses 
	Dos,Crt;
begin
	TextAttr:=White+(Blue shl 4);
	writeln('   测试5.');
	TextAttr:=White+(Green shl 4);
	writeln('    测试6.');
	TextAttr:=White+(Red shl 4);
	writeln('    测试7.');

end.
