page 50220 "SOL Grade History"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "SOL Grade History";
    Caption = 'Grade History';
    Editable = false;
    DataCaptionFields = "Customer Name", "Customer No.";

    layout
    {
        area(Content)
        {
            repeater(History)
            {
                field("Entry no."; Rec."Entry no.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("DateTime"; Rec."DateTime")
                {
                    ToolTip = 'Specifies the value of the DateTime field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field(Grade; Rec.Grade)
                {
                    ToolTip = 'Specifies the value of the Grade field.', Comment = '%';
                }
                field("Grade Description"; Rec."Grade Description")
                {
                    ToolTip = 'Specifies the value of the Grade Description field.', Comment = '%';
                }
            }
        }
    }



    var
        myInt: Integer;
}