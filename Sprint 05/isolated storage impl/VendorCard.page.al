pageextension 50231 "SOL Vedor Card" extends "Vendor Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(Invoicing)
        {
            field("HasWebshopPassword"; VWSPhelper.VendorWebShopPasswordValue(Rec))
            {
                ApplicationArea = All;
                Caption = 'Has Webshop Password';
                Editable = false;
                DrillDown = true;
                trigger OnDrillDown()
                begin
                    VWSPhelper.SetVendorWebShopPassword(Rec);
                end;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        VWSPhelper: Codeunit "VWSP Helper";

}