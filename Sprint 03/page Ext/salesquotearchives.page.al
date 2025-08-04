pageextension 50196 "Sales Quote Archives Ext." extends "Sales Quote Archives"
{
    layout


    {
        addafter("Due Date")
        {
            field("Quote Status"; Rec."Quote Status")
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
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}