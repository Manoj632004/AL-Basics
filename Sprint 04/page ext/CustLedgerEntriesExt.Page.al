pageextension 50214 "SOL Customer Ledger Entries" extends "Customer Ledger Entries"
{
    layout
    {
        addafter(Control1)
        {
            field(Grade; Rec."SOL Grade")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Grade field.', Comment = '%';
            }
            field(GradeDescription; Rec."SOL GradeDescription")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Grade Description field.', Comment = '%';
            }

        }
        addfirst(FactBoxes)
        {
            part(GradeFactBox; "SOL Grade History FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Customer No." = field("Customer no.");
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}