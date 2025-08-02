page 50146 "Data Manipuation Examples"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                //field(Name; NameSource){}
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(FindRecords)
            {
                Image = Find;
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'Find Records';
                trigger OnAction()
                var
                    customer: Record Customer;
                begin
                    customer.FindLast();
                    Message('%1', customer);
                end;
            }
            action(Lookoverallvendors)
            {
                Image = Find;
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'Look over all Vendors';

                trigger OnAction()
                var
                    vendor: Record Vendor;
                begin
                    vendor.FindSet();
                    repeat
                    begin
                        Message('%1', vendor);
                    end;
                    until vendor.Next() = 0;

                end;
            }
            action(GetItem)
            {
                Image = Find;
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'Get item';
                trigger OnAction()
                var
                    item: Record Item;
                begin
                    if item.Get('1900-S') = true then
                        Message(item.Description)

                    else
                        Message('item not found');
                end;
            }
            action(GetCustomersFromAtlanta)
            {
                Image = Find;
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'GetCustomersFromAtlanta';
                trigger OnAction()
                var
                    cust: record Customer;
                begin
                    cust.SetFilter(City, '%1', 'Atlanta');
                    cust.FindSet();
                    repeat
                        Message(cust.Name);
                    until cust.Next() = 0;
                end;
            }
            action(GetCustomersNotFromAtlanta)
            {
                Image = Find;
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'GetCustomersNotFromAtlanta';
                trigger OnAction()
                var
                    cust: record Customer;
                begin
                    cust.SetFilter(City, '<>%1', 'Atlanta');
                    cust.FindSet();
                    repeat
                        Message(cust.Name);
                    until cust.Next() = 0;
                end;
            }
        }
    }

    var
        myInt: Integer;

}