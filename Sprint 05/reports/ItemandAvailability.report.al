report 50232 "Inventory and Availability"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Inventory and Availability, by Item Category';
    //RDLCLayout = './src/ItemandAvailability.rdlc';
    //ExcelLayout = './src/ItemandAvailability.xlsx';
    DefaultRenderingLayout = ItemandAvailabilityRDL;
    dataset
    {
        dataitem(Item; Item)
        {
            CalcFields = Inventory, "Qty. on Purch. Order", "Qty. on Sales Order";
            column(ItemCategoryCode; "Item Category Code")
            {
                IncludeCaption = true;
            }
            column(Itemno; "No.")
            {

            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Inventory; Inventory)
            {
                IncludeCaption = true;
            }
            column(Availability; Inventory - "Qty. on Purch. Order" + "Qty. on Sales Order")
            {
                //IncludeCaption = true;
            }
            dataitem("Item Category"; "Item Category")
            {
                DataItemLink = Code = field("Item Category Code");
                column(ItemCategoryDescription; Description)
                {
                    IncludeCaption = true;
                }

            }
        }

    }
    rendering{
        layout(ItemandAvailabilityRDL){
            Type  = RDLC;
            LayoutFile = './src/ItemandAvailability.rdlc';
        }
        layout(ItemandAvailabilityXLS){
            Type  = Excel;
            LayoutFile = './src/ItemandAvailability.xlsx';
        }
    }
    labels
    {
        ItemInventoryAvailabilityLbl = 'Inventory and Availability, by Item Category';
        Availabilitylbl = 'Availability';
    }
   
}
