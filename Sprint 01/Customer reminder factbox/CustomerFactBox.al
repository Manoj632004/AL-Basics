page 50166 "Customer Reminder Factbox"
{   //display all the customer details whose payment has went past due date
    PageType = ListPart;
    Editable = false;
    SourceTable = "Reminder/Fin. Charge Entry";
    Caption = 'Customer Reminders Factbox';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the posting date of the reminder or finance charge memo.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document type of the customer entry on the reminder line or finance charge memo line.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the remaining amount of the customer ledger entry this reminder or finance charge memo entry is for.';
                }
            }
        }
    }


    var
        myInt: Integer;
}