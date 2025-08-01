page 50110 "Chicken Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = Chicken;
    UsageCategory = Administration; //type of page,navigate, organize, who gets to access more 
    Caption = 'Chicken Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")// source field, caption
                {
                    ApplicationArea = All; //control visibility
                    ToolTip = 'No.';
                }
                field("Chicken Type Code"; Rec."Chicken Type Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Chicken Type Code';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Last Date Modified';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                    ToolTip = 'Picture';
                }
                field("Chicken Type Description"; Rec."Chicken Type Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Chicken Type Description';

                }
                field("number of eggs produced"; Rec."number of eggs produced")
                {
                    //DataClassification = ToBeClassified;
                    Editable = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                trigger OnAction()
                begin
                end;
            }
        }
    }

    var
        myInt: Integer;
}