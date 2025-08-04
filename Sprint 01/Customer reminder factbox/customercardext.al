pageextension 50165 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addfirst(factboxes)
        {
            part(CutomerRemindersFactbox; "Customer Reminder Factbox")
            {
                SubPageLink = "Customer No." = field("No.");
                ApplicationArea = All;
            }
        }
    }



    var
        myInt: Integer;
}