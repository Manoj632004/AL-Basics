report 50234 "Myreport"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Retrieve Child Items';
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(ItemCategoryCode; "Item Category Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Item Category Code';
                        ToolTip = 'Enter the Item Category Code';
                        TableRelation = "Item Category";
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
                action(GetChildItems)
                {
                    ApplicationArea = All;
                    Caption = 'Get Child Items';
                    Image = Return;

                    trigger OnAction()
                    begin

                    end;
                }
            }
        }
    }

    var
        "Item Category Code": code[20];

    trigger OnPostReport()
    var
        ItemsArray: Text;
    begin
        Message(GetChildItems("Item Category Code", ItemsArray).TrimEnd('|'));
    end;

    procedure GetChildItems(var CategoryCode: Code[20]; var ItemsArray: Text): Text
    var
        ItemCategory: Record "Item Category";
    begin
        ItemsArray += format(CategoryCode + '|');
        ItemCategory.SetRange("Parent Category", CategoryCode);
        if ItemCategory.FindSet() then
            repeat
                //if ItemCategory.HasChildren() then
                ItemsArray := GetChildItems(ItemCategory.Code, ItemsArray)
                //else
                    //ItemsArray += format(ItemCategory.Code + '|');
            until ItemCategory.Next() = 0;
        exit(ItemsArray);
    end;
}