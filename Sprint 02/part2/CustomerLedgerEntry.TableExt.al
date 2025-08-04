tableextension 50185 "Cust. Ledger Entry Ext" extends "Cust. Ledger Entry"
{
    //this code different from soln
    procedure GetNumberOfDaysExpired() returnval: integer

    begin
        if DT2Date(CurrentDateTime) > Rec."Due Date" then
            returnval := DT2Date(CurrentDateTime) - Rec."Due Date"
        else
            returnval := 0;
    end;
}
