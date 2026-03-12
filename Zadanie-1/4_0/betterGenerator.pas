program BetterGenerator;
var
    i, L, R, n, err1, err2, err3, temp: integer;
begin
    //--- parameter read ---
    Val(ParamStr(1), L, err1);
    Val(ParamStr(2), R, err2);
    Val(ParamStr(3), n, err3);

    //--- error handling ---
    if err1 + err2 + err3 > 0 then
    begin
        writeln(StdErr, 'error! invalid parameters');
        Halt(1);
    end;

    if n < 0 then
    begin
        writeln(StdErr, 'error! ile must be positive');
        Halt(2);
    end;

    if L > R then
    begin
        temp := L;
        L := R;
        R := temp;
    end;

    //--- generate and output n random integers in range [L, R] ---
    randomize();
    for i := 0 to n - 1 do
    begin
        write(random(R - L + 1) + L);
        write(' ');
    end;
    writeln('');
end.
