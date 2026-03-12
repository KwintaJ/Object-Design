program UnitTesting;
uses SysUtils, Process, Classes;

function GetFPCPath: string;
var
    P: TProcess;
    O: TStringList;
begin
    P := TProcess.Create(nil);
    O := TStringList.Create;
    P.Executable := '/usr/bin/which';
    P.Parameters.Add('fpc');
    P.Options := [poWaitOnExit, poUsePipes];
    
    P.Execute;
    O.LoadFromStream(P.Output);
    
    GetFPCPath := Trim(O.Text);
end;

//--- TEST 1: SimpleGenerator ---
function Test1: integer;
var
    P: TProcess;
    O: TStringList;
    i: integer;
begin
    writeln('');
    writeln('[Test1]: testowanie simpleGenerator');
    P := TProcess.Create(nil);
    O := TStringList.Create;
    P.Executable := '../3_0/simpleGenerator.x';
    P.Options := [poWaitOnExit, poUsePipes];
    
    P.Execute;
    O.LoadFromStream(P.Output);

    O.Delimiter := ' ';
    O.DelimitedText := O.Text;

    if O.Count <> 50 then
    begin
        writeln('[Test1]: FAIL - niepoprawna liczba wygenerowanych liczb');
        Test1 := 0;
        Exit(0);
    end;

    for i := 0 to O.Count - 1 do
    begin
        if (StrToInt(O[i]) < 0) or (StrToInt(O[i]) > 100) then
        begin
            writeln('[Test1]: FAIL - liczby spoza zakresu'); 
            Test1 := 0;
            Exit(0);
        end;
    end;

    writeln('[Test1]: OK');
    Test1 := 1;
end;

//--- TEST 2: BetterGenerator ---
function Test2: integer;
var
    P: TProcess;
    O: TStringList;
    i: integer;
begin
    writeln('');
    writeln('[Test2]: testowanie betterGenerator');
    P := TProcess.Create(nil);
    O := TStringList.Create;
    P.Executable := '../4_0/betterGenerator.x';
    P.Parameters.Add('-1000');
    P.Parameters.Add('1000');
    P.Parameters.Add('400');
    P.Options := [poWaitOnExit, poUsePipes];
    
    P.Execute;
    O.LoadFromStream(P.Output);

    O.Delimiter := ' ';
    O.DelimitedText := O.Text;

    if O.Count <> 400 then
    begin
        writeln('[Test2]: FAIL - niepoprawna liczba wygenerowanych liczb');
        Test2 := 0;
        Exit(0);
    end;

    for i := 0 to O.Count - 1 do
    begin
        if (StrToInt(O[i]) < -1000) or (StrToInt(O[i]) > 1000) then
        begin
            writeln('[Test2]: FAIL - liczby spoza zakresu'); 
            Test2 := 0;
            Exit(0);
        end;
    end;

    writeln('[Test2]: OK');
    Test2 := 1;
end;

//--- TEST 3: BetterGenerator ---
function Test3: integer;
var
    P: TProcess;
    O: TStringList;
    i: integer;
begin
    writeln('');
    writeln('[Test3]: testowanie betterGenerator');
    P := TProcess.Create(nil);
    O := TStringList.Create;
    P.Executable := '../4_0/betterGenerator.x';
    P.Parameters.Add('5000');
    P.Parameters.Add('-5000');
    P.Parameters.Add('1500');
    P.Options := [poWaitOnExit, poUsePipes];
    
    P.Execute;
    O.LoadFromStream(P.Output);

    O.Delimiter := ' ';
    O.DelimitedText := O.Text;

    if O.Count <> 1500 then
    begin
        writeln('[Test3]: FAIL - niepoprawna liczba wygenerowanych liczb');
        Test3 := 0;
        Exit(0);
    end;

    for i := 0 to O.Count - 1 do
    begin
        if (StrToInt(O[i]) < -5000) or (StrToInt(O[i]) > 5000) then
        begin
            writeln('[Test3]: FAIL - liczby spoza zakresu'); 
            Test3 := 0;
            Exit(0);
        end;
    end;

    writeln('[Test3]: OK');
    Test3 := 1;
end;

//--- TEST 4: BubbleSort < SimpleGenerator ---
function Test4: integer;
var
    P1, P2: TProcess;
    O1, O2: TStringList;
    EOLN_STR, numbers: string;
    i: integer;
begin
    EOLN_STR := LineEnding;
    writeln('');
    writeln('[Test4]: testowanie bubbleSort < simpleGenerator');

    //--- generate numbers from simpleGenerator ---
    P1 := TProcess.Create(nil);
    O1 := TStringList.Create;
    P1.Executable := '../3_0/simpleGenerator.x';
    P1.Options := [poWaitOnExit, poUsePipes];
    
    P1.Execute;
    O1.LoadFromStream(P1.Output);
    numbers := O1.Text;

    //--- input those numbers to bubbleSort ---
    P2 := TProcess.Create(nil);
    O2 := TStringList.Create;
    P2.Executable := '../3_5/bubbleSort.x';
    P2.Options := [poUsePipes];

    P2.Execute;
    P2.Input.Write(numbers[1], Length(numbers));
    P2.Input.Write(EOLN_STR[1], Length(EOLN_STR));
    P2.CloseInput;

    O2.LoadFromStream(P2.Output);

    O2.Delimiter := ' ';
    O2.DelimitedText := O2.Text;

    if O2.Count <> 50 then
    begin
        writeln('[Test4]: FAIL - niepoprawna liczba posortowanych liczb');
        Test4 := 0;
        Exit(0);
    end;

    for i := 0 to O2.Count - 2 do
    begin
        if StrToInt(O2[i]) > StrToInt(O2[i + 1]) then
        begin
            writeln('[Test4]: FAIL - niepoprawnie posortowane liczby'); 
            Test4 := 0;
            Exit(0);
        end;
    end;

    writeln('[Test4]: OK');
    Test4 := 1;
end;

//--- TEST 5: BubbleSort < BetterGenerator ---
function Test5: integer;
var
    P1, P2: TProcess;
    O1, O2: TStringList;
    EOLN_STR: string;
    numbers: AnsiString;
    i: integer;
begin
    EOLN_STR := LineEnding;
    writeln('');
    writeln('[Test5]: testowanie bubbleSort < betterGenerator');

    //--- generate numbers from simpleGenerator ---
    P1 := TProcess.Create(nil);
    O1 := TStringList.Create;
    P1.Executable := '../4_0/betterGenerator.x';
    P1.Parameters.Add('-5000');
    P1.Parameters.Add('5000');
    P1.Parameters.Add('95');
    P1.Options := [poWaitOnExit, poUsePipes];
    
    P1.Execute;
    O1.LoadFromStream(P1.Output);
    numbers := O1.GetText;

    //--- input those numbers to bubbleSort ---
    P2 := TProcess.Create(nil);
    O2 := TStringList.Create;
    P2.Executable := '../3_5/bubbleSort.x';
    P2.Options := [poUsePipes];

    P2.Execute;
    P2.Input.Write(numbers[1], Length(numbers));
    P2.Input.Write(EOLN_STR[1], Length(EOLN_STR));
    P2.CloseInput;

    O2.LoadFromStream(P2.Output);

    O2.Delimiter := ' ';
    O2.DelimitedText := O2.Text;

    O1.Delimiter := ' ';
    O1.DelimitedText := O1.Text;

    if O2.Count <> O1.Count then
    begin
        writeln('[Test5]: FAIL - niepoprawna liczba posortowanych liczb');
        Test5 := 0;
        Exit(0);
    end;

    for i := 0 to O2.Count - 2 do
    begin
        if StrToInt(O2[i]) > StrToInt(O2[i + 1]) then
        begin
            writeln('[Test5]: FAIL - niepoprawnie posortowane liczby'); 
            Test5 := 0;
            Exit(0);
        end;
    end;

    writeln('[Test5]: OK');
    Test5 := 1;
end;

//===== MAIN =====
var
    testsPassed: integer;
begin
    //--- testing ---
    testsPassed := 0;
    testsPassed := testsPassed + Test1;
    testsPassed := testsPassed + Test2;
    testsPassed := testsPassed + Test3;
    testsPassed := testsPassed + Test4;
    testsPassed := testsPassed + Test5;

    //--- output ---
    writeln('');
    writeln('[OK ', testsPassed, ' z 5 testow]');
end.
