page 50115 "Egg Production Document"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Egg Production Header";//card
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'No.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Document Date';
                }
            }
            part(Lines; "Egg Production Subpage")//(name of the part,subpage src)
            {
                ApplicationArea = All;
                SubPageLink = "Document no." = FIELD("No.");//links main page(header) to sub, link = foreign pageid = main page id
                UpdatePropagation = Both; //updates records in both header and line table 
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
}