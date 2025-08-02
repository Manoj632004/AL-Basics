tableextension 50150 "Item table extension" extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50151; Availability; Decimal)
        {
            Caption = 'Availability';
            //FieldClass = FlowField;
            //CalcFormula = sum("Item".Inventory);

        }
    }


    var
        myInt: Integer;
}