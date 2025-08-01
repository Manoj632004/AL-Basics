page 50281 "Azure Storage Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Azure Storage Setup";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Primary key"; Rec."Primary key")
                {
                    ApplicationArea = All;
                }
                field("Storage Account Name"; Rec."Storage Account Name")
                {
                    ApplicationArea = All;
                }
                field("Shared Access Key ID"; Rec."Shared Access Key ID")
                {
                    ApplicationArea = All;
                }
                field("Shared Access Key"; SharedAccessKey)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin

                    end;
                }
                field("Container Name"; Rec."Container Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin

    end;

    var
        SharedAccessKey: Guid;
}
