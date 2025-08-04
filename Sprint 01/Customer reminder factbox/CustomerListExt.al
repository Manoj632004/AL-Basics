pageextension 50164 "Customer List Ext" extends "Customer List"
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

    actions
    {

    }

    var
        myInt: Integer;
}