page 50117 "Egg Production Line List"
{   //card
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Egg Production Line";
    Editable = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Document no."; Rec."Document no.")
                {
                    ToolTip = 'Document no.';
                }
                field("Chicken No."; Rec."Chicken No.")
                {
                    ToolTip = 'Chicken No.';
                }

                field("Egg Type Code"; Rec."Egg Type Code")
                {
                    ToolTip = 'Egg Type Code';
                }
                field("Egg Type Description"; Rec."Egg Type Description")
                {
                    ToolTip = 'Chicken Description';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Quantity';
                }
                field("Egg Production Date"; Rec."Egg Production Date")
                {
                    ToolTip = 'Egg Production Date';
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