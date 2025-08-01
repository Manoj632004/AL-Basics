page 50113 "Chicken Type"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Chicken Type";
    Editable = true;
    Caption = 'Chicken Type';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Code';
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Chicker Type Description';
                    ApplicationArea = All;
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