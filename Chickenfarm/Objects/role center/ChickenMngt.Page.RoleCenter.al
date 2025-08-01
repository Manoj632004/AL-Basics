page 50118 "Chicken Management Rolecenter"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;
    Caption = 'Chicken Management';

    layout
    {
        area(RoleCenter)
        {
            part(HeadLineOrderProcessor; "Headline RC Order Processor")
            {
                ApplicationArea = All;
            }
            part(OverdueCustomers; "Overdue Customers")
            {
                ApplicationArea = All;
            }
            part(O365Activities; "O365 Activities")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(MasterData)

            {
                Image = RegisteredDocs;
                Caption = 'Master Data';
                action(ChickenList)
                {
                    Caption = 'ChickenList';
                    RunObject = Page "Chicken List";
                    ApplicationArea = All;
                }
                action(ChickenTypes)
                {
                    Caption = 'ChickenTypes';
                    ApplicationArea = All;
                    RunObject = Page "Chicken Type";
                }
                action(EggTypes)
                {
                    Caption = 'Eggtypes';
                    ApplicationArea = All;
                    RunObject = page "Egg Types";
                }   
            }

            group(Documents)
            {
                action(EggProduction)
                {
                    Caption = 'EggProduction';
                    RunObject = Page "Egg Production List";
                    ApplicationArea = All;
                }

            }
        }
        area(Embedding)
        {
            action(eChickenList)
            {
                Caption = 'ChickenList';
                ApplicationArea = All;
                RunObject = page "Chicken List";
            }
            action(eChickenTypes)
            {
                Caption = 'ChickenTypes';
                ApplicationArea = All;
                RunObject = page "Chicken Type";

            }
            action(eEggProduction)
            {
                Caption = 'EggProduction';
                ApplicationArea = All;
                RunObject = page "Egg Production List";

            }
            action(eEggTypes)
            {
                Caption = 'Eggtypes';
                ApplicationArea = All;
                RunObject = page "Egg Types";
            }

        }
    }

    var
        myInt: Integer;
}