program SimpleGenerator;
var
    i: integer;
begin
    //--- generate and output 50 random integers ---
    randomize();
    for i := 0 to 49 do
    begin
        write(random(100));
        write(' ');
    end;
    writeln('');
end.
