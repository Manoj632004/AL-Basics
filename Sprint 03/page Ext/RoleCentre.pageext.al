pageextension 50200 MyExtension extends "Business Manager Role Center"
{
    layout
    {
        addbefore("Favorite Accounts")
        {
            part(salesquotewon; "Sales Quote Status List")
            {
                ApplicationArea = All;
                Caption = 'Won Quotes';
                subpageview = where("Won/lost quote status" = const("won")); // Add changes to page layout here 
            }
            part(salesquotelost; "Sales Quote Status List")
            {
                ApplicationArea = All;
                Caption = 'Lost Quotes';
                subpageview = where("Won/lost quote status" = const("lost")); // Add changes to page layout here 
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        lostquotenotification: Notification;
}