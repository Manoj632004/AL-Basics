page 50183 "Threshold Setup"

{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Threshold Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
    Caption = 'Threshold Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Threshold 1 Style"; Rec."Threshold 1 Style")
                {
                    ToolTip = 'Specifies the value of the Threshold 1 Style field.', Comment = '%';
                }
                field("Threshold 1 Value"; Rec."Threshold 1 Value")
                {
                    ToolTip = 'Specifies the value of the Threshold 1 Value field.', Comment = '%';
                }
                field("Threshold 2 Style"; Rec."Threshold 2 Style")
                {
                    ToolTip = 'Specifies the value of the Threshold 2 Style field.', Comment = '%';
                }
                field("Threshold 2 Value"; Rec."Threshold 2 Value")
                {
                    ToolTip = 'Specifies the value of the Threshold 2 Value field.', Comment = '%';
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

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin// makes sure the table has one record 
            Rec.Init();
            Rec.Insert();
        End
    end;
}