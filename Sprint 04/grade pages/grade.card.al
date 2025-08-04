page 50202 "SOL Grade Card"
{
    PageType = Card;
    Caption = 'Grade Card';
    SourceTable = "SOL Grade";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'No.';
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit() then//update page if function returns true
                            CurrPage.Update();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description';
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'No. Series';
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