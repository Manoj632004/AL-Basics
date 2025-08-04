pageextension 50194 "Sales Quotes Ext." extends "Sales Quotes"
{
    layout
    {
        addafter("Due Date")
        {
            field("Quote Status"; Rec."Won/Lost Quote Status")
            {
                ApplicationArea = All;
                ToolTip = 'Shows the status of the quote as Won or Lost.';
            }
            field("Won/Lost Date"; Rec."Won/Lost Date")
            {
                ApplicationArea = All;
                ToolTip = 'Shows the date when the quote was won or lost.';
            }
            field("Won/Lost Reason Code"; Rec."Won/Lost Reason Code")
            {
                ApplicationArea = All;
                ToolTip = 'Shows the reason code for the quote being won or lost.';
            }
            field("Won/Lost Reason Desc."; Rec."Won/Lost Reason Desc.")
            {
                ApplicationArea = All;
                ToolTip = 'Shows the description of the reason code for the quote being won or lost.';
            }
            field("Won/Lost Remarks"; Rec."Won/Lost Remarks")
            {
                ApplicationArea = All;
                ToolTip = 'Shows the remarks for the quote being won or lost.';
            }
        }
    }

    actions
    {
        addfirst(Create)
        {
            action("Close Quote")
            {
                ApplicationArea = All;
                Caption = '&Close Quote';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    quotestatusmgmt: Codeunit "SOL Quote Status Mgmt";
                begin
                    if page.RunModal(page::"close Quote", Rec) = Action::LookupOK then
                        QuoteStatusMgmt.CloseQuote(Rec);
                end;

            }
        }
    }

    var
        myInt: Integer;
}