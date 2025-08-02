codeunit 50140 VariablesAndDatatypes
{
    Access = Public;
    

    trigger OnRun()
    begin
        String1 := 'HelloWorldOfManyManyCharactersInTheString';
        String2 := CopyStr(String1, 0, MaxStrLen(String2));
        Message('The value of %1 is %2', 'LoopNo', LoopNo);
        //Message(String2);
    end;

    var
        color: Option Green,blue,red;
        LoopNo: integer;
        MyDate: Date;
        MyText: Text;
        LoopNoDec: Decimal;
        String1: Text[60];
        String2: Text[30];

}