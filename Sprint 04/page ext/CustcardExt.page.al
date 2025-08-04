pageextension 50213 "SOL Customer Card" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(General)
        {
            field(Grade; Rec."SOL Grade")
            {
                ApplicationArea = All;
                ToolTip = 'Grade';
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
                SubPageLink = "Customer No." = field("No.");
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