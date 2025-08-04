page 50197 "Close Quote"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Header";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Won/Lost Quote Status"; Rec."Won/Lost Quote Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the status of the quote as Won or Lost.';
                    Editable = false;
                }
                field("Won/Lost Date"; Rec."Won/Lost Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the date when the quote was won or lost.';
                    Editable = false;
                }
                field("Won/Lost Reason Code"; Rec."Won/Lost Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the reason code for the quote being won or lost.';
                    Editable = false;
                }
                field("Won/Lost Reason Desc."; Rec."Won/Lost Reason Desc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the description of the reason code for the quote being won or lost.';
                    Editable = false;
                }
                field("Won/Lost Remarks"; Rec."Won/Lost Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the remarks for the quote being won or lost.';
                    Editable = AllowChangeStatus;
                    MultiLine = true;
                }

            }
        }
    }


    var
        AllowChangeStatus: Boolean;

    trigger OnOpenPage()
    begin
        AllowChangeStatus := Rec."Won/Lost Quote Status" <> "Won/Lost Status"::"won";
    end;



    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction = Action::LookupOK then
            finishwizard();
    end;

    local procedure finishwizard()
    var
        MustSelectWonorLostErr: Label 'You must select Won or Lost status for the quote.';
        FieldustBeFilledErr: Label 'The field must be filled.';
    begin
        if not (Rec."Won/Lost Quote Status" in ["Won/Lost status"::won, "Won/Lost Status"::Lost]) then
            Error(MustSelectWonorLostErr);
        if Rec."Won/Lost Reason Code" = '' then
            Error(FieldustBeFilledErr);
        Rec.Modify();
    end;

}