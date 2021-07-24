program generalEnvUnix(input,output);

{$ifdef UNIX}uses BaseUnix,SysUtils;{$endif}
{$ifdef WINDOWS}uses Windows,SysUtils;{$endif}

function GetUserName: String;
  begin
    GetUserName:=GetEnvironmentVariable('USER');
  end;
function GetComputerName: String;
var
  aUtsName: UtsName;
begin
  GetComputerName:='';
  aUtsName.Nodename[0]:=#0; 
  FillChar(aUtsName,SizeOf(aUtsName),0);
  if FpUname(aUtsName)<>-1 then
    begin
      GetComputerName:=aUtsName.Nodename;
    end;
end;

begin
    writeln('user name=',GetUserName);
    writeln('Computer name=',GetComputerName);
end.
