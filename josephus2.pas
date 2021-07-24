program josephus2(input, output);
var
   i, k, m, start: integer;
   find: boolean;
function check(remain: integer): boolean;
var
    result: integer;
begin
    result:=(start+m-1) mod remain;
    if result>=k then
    begin
        start := result; check := true;
    end
    else
        check := false;
end;
begin
    find := false;
    read(k);
    m := k;
    while not(find) do
    begin
         find := true; start := 0;
         for i := 0 to k-1 do
              if( not check(2*k-i )) then
              begin
                  find := false; break;
              end;
              inc(m);
    end;
    writeln( m-1);
end.
