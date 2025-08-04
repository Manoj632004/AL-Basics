page 50198 "Sales Quote Status List"
{
    PageType = listpart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Header";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(rep)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    begin
                        page.run(page::"Sales Quote", Rec);
                    end;
                }
                field("sell to customer no."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                }
                field("won/lost date"; Rec."Won/Lost Date")
                {
                    ApplicationArea = All;
                }
                field("won/lost Reason Desc."; Rec."Won/Lost Reason Desc.")
                {
                    ApplicationArea = All;
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

            }
        }
    }
    trigger OnOpenPage()
    begin
        GetQuotesForCurrentUser();
        Rec.SetFilter("Won/Lost Quote Status", format(Rec."Won/Lost Quote Status"::Won));
        Update();
    end;

    procedure GetQuotesForCurrentUser()
    var
        quotestatusmgmt: Codeunit "SOL Quote Status Mgmt";
        salespersoncode: code[20];
    begin
        salespersoncode := quotestatusmgmt.GetSalesPersonForLoggedinUser();
        //FilterGroup(2);
        //SetRange("Salespersoncode", salespersoncode);
        //FilterGroup(0);
    end;
}