page 50336 "Movie Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;
    SourceTable = "Movie Setup";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Backup Type"; Rec."Backup Type")
                {
                    ToolTip = 'Specifies the value of the Backup Type field.', Comment = '%';
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