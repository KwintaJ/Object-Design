program SimpleGenerator;
var
    i: integer;
begin
    //--- generate and output 50 random integers in range [0, 100] ---
    randomize();
    for i := 0 to 49 do
    begin
        write(random(101));
        write(' ');
    end;
    writeln('');
end.
