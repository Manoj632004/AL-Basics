page 50148 MyDevCustomer
{
    PageType = ListPlus;
    ApplicationArea = All;
    Usagecategory = lists;
    SourceTable = MyDevCustomer;

    layout
    {
        area(Content)
        {
            group(search)
            {
                field(input; input)
                {
                    Caption = 'Input';
                    ApplicationArea = All;
                }
            }
            repeater("Customer Records")
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Copy From Customer")
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = Copy;
                trigger OnAction()
                begin
                    if StrPos(input, '*') = 0 then
                        Message('Error, your search should contain *')
                    else begin
                        Customer.SetFilter(city, '%1', input);
                        //filtered_customer.DeleteAll();
                        //filtered_customer.Init();
                        //clears all rows
                        repeat
                            filtered_customer."No." := Customer."No.";
                            filtered_customer.Name := Customer.Name;
                            filtered_customer.City := Customer.City;
                            if filtered_customer.Get(Customer."No.") = false then  //check if the row already exists(not needed)
                                filtered_customer.Insert(true)
                            else
                                filtered_customer.Modify(true);
                            Clear(filtered_customer);
                        until Customer.Next() = 0;
                        CurrPage.Update();
                    end;
                    //update the page code here
                end;
            }
            action("Clear")
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = ClearLog;
                trigger OnAction()
                begin
                    filtered_customer.DeleteAll();
                    Clear(filtered_customer);
                    clear(input);
                    Customer.Reset();
                end;
            }
        }
    }

    var

        filtered_customer: Record MyDevCustomer;
        Customer: Record Customer;
        input: text;
}