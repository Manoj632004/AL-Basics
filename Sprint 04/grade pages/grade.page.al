page 50203 "SOL Grade"
{
    PageType = List;
    ApplicationArea = All;
    Caption = 'Grade';
    UsageCategory = Lists;
    SourceTable = "SOL Grade";
    CardPageId = "SOL Grade Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'No.';
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description';
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }


    var
        myInt: Integer;
}