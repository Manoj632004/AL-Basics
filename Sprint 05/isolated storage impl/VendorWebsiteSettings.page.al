page 50231 "Vendor Website Settings"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Vendor;
    Caption = 'Vendor Website Settings';
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                FreezeColumn = "No.";
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field(HasWebshopPassord; VWSPhelper.VendorWebShopPasswordValue(Rec))
                {
                    ApplicationArea = All;
                    caption = 'Webshop Password';
                    Editable = false;
                    DrillDown = true;
                    trigger OnDrillDown()
                    begin
                        VWSPhelper.SetVendorWebShopPassword(Rec);
                        CurrPage.Update();
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Forget Password")
            {
                Image = RemoveContacts;
                Caption = 'Forget Password';
                ToolTip = 'Forget Password';

                trigger OnAction()
                begin
                    VWSPhelper.DeleteVendorWebshopPassword(Rec);
                end;
            }
            action("Show Password")
            {
                Image = ViewDescription;
                Caption = 'Forget Password';
                ToolTip = 'Forget Password';
                trigger OnAction()
                begin
                    Message(VWSPhelper.GetVendorWebShopPassword(Rec));
                end;
            }

        }
    }

    var
        password: text;
        VWSPhelper: Codeunit "VWSP Helper";
}