report 50231 "Item Inventory"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Item Inventory ';
    RDLCLayout = './src/ItemInventory.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {
            column(ItemNo; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Inventory; Inventory)
            {
                IncludeCaption = true;
            }
        }
    }
    /*
    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }
    */

    var
        myInt: Integer;
}