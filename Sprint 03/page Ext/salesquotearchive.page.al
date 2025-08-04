pageextension 50195 "SOl Sales Quote Archive Ext." extends "Sales Quote Archive"
{
    layout
    {
        addlast(general)
        {
            field(quoteStatus; Rec."Quote Status")
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
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}