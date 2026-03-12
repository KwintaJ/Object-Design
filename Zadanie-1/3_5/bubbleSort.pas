program BubbleSort;
var
    arr: array[1..100] of integer;
    n, i, j, temp: integer;
begin
    n := 0;
    
    //--- input ---
    while not SeekEoln do
    begin
        read(arr[n]);
        n := n + 1;
    end;

    //--- bubble sort ---
    for i := 0 to n - 1 do
    begin
        for j := i + 1 to n - 1 do
        begin
            if arr[i] > arr[j] then
            begin
                temp := arr[j];
                arr[j] := arr[i];
                arr[i] := temp;
            end;
        end;
    end;
    
    //--- output ---
    for i := 0 to n - 1 do
    begin
        write(arr[i]);
        write(' ');
    end;
    writeln('');
end.