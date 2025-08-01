page 50114 "Egg Production Subpage"
{
    PageType = ListPart;
    SourceTable = "Egg Production Line";
    ApplicationArea = All;
    UsageCategory = Administration;
    DelayedInsert = true;
    //AutoSplitKey = true; // not able to do this 

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Chicken No."; Rec."Chicken No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Chicken No.';
                }
                /*
                field("Chicken Description"; Rec."Chicken Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Chicken Description';
                }
                */
                field("Egg Production Date"; Rec."Egg Production Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Egg Production Date';
                }
                field("Egg Type Code"; Rec."Egg Type Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Egg Type Code';

                }
                field("Egg Type Description"; Rec."Egg Type Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Egg Type Descipiption';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Quantity';
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