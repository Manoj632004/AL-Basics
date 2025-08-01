page 50111 "Chicken List"
{
    //Title of Page
    Caption = 'Chicken List';
    Editable = false;
    UsageCategory = Lists; //type of page,navigate, organize
                           //it also decides if it is searchable or not

    //card that displays and edited 
    PageType = List;
    ApplicationArea = All;// visible to all users, other values: basic, suite, 

    // Specifies the page to display records from the Customer table.
    SourceTable = Chicken;
    CardPageID = "Chicken Card";

    layout
    {
        area(Content)
        {
            // Sets the No., Name, Contact, and Phone No. fields in the Customer table to be displayed as columns in the list.
            repeater(Group)// used to display a list of records in a tabular format.
            {
                Caption = 'Chicken Records';
                field("No."; Rec."No.")// source field, caption
                {
                    ToolTip = 'No.';
                    ApplicationArea = All;
                }
                field("Chicken Type Description"; Rec."Chicken Type Description")
                {
                    ToolTip = 'Description';
                    ApplicationArea = All;

                }
                field("Chicken Type Code"; Rec."Chicken Type Code")
                {
                    ToolTip = 'Chicken Type Code';
                    ApplicationArea = All;
                }
                field("number of eggs produced"; Rec."number of eggs produced")
                {
                    ToolTip = 'number of eggs produced';
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