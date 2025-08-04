page 50221 "SOL Grade History FactBox"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    Editable = false;
    SourceTable = "SOL Grade History";
    DataCaptionFields = "Customer Name", "Customer No.";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("DateTime"; Rec."DateTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DateTime field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Entry no."; Rec."Entry no.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade field.', Comment = '%';
                }
                field("Grade Description"; Rec."Grade Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade Description field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
            }
        }
    }



    var
        myInt: Integer;
}