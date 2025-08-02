pageextension 50149 "Item List Extension" extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field(Availability; Rec.Availability)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Availability field.', Comment = '%';
                Editable = false;
                StyleExpr = "deci";

            }
        }
    }
    actions
    {
        // Add changes to page actions here
        addafter(Functions)
        {
            action("Calculate Availability Selected")
            {
                ShortcutKey = "Shift+Ctrl+A";
                Promoted = true;
                ApplicationArea = All;
                Image = Calculate;
                trigger OnAction()
                begin
                    CalculateAvailabilitySelected();
                end;

            }
        }
    }
    var
        deci: Text;

    trigger OnAfterGetRecord()
    begin
        rec.CalcFields(Inventory, "Qty. on Purch. Order", "Qty. on Sales Order");
        rec.Availability := rec.Inventory + rec."Qty. on Purch. Order" - rec."Qty. on Sales Order";

        if rec.Availability = rec.Inventory then
            deci := 'Standard';
        if rec.Availability < rec.Inventory then
            deci := 'Attention';
        if rec.Availability > rec.Inventory then
            deci := 'Favorable';

    end;

    local procedure CalculateAvailabilitySelected();
    var
        sum: Decimal;
        item: Record Item;

    begin
        Clear(item);
        Clear(sum);
        CurrPage.SetSelectionFilter(item);

        if item.Count() <> 0 then begin
            repeat
                item.CalcFields(Inventory, "Qty. on Purch. Order", "Qty. on Sales Order");
                sum := sum + (item.Inventory + item."Qty. on Purch. Order" - item."Qty. on Sales Order");
            until item.Next() = 0;
            Message('Sum of Availability of Selected records = %1', sum);
        end
        else
            Message('Nothing selected');


    end;
}
