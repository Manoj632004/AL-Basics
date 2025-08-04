page 50205 "SOL Grade Setup"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'Grade Setup';
    UsageCategory = Administration;
    SourceTable = "SOL Grade Setup";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Grade Nos."; Rec."Grade Nos.")
                {
                    ToolTip = 'Grade Nos.';
                    ApplicationArea = All;
                }
            }
        }
    }



    var
        myInt: Integer;

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}