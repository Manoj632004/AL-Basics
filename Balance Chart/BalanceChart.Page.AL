page 50301 "Balance Chart"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Balance Chart';


    layout
    {
        area(Content)
        {
            group("Balance Chart")
            {
                usercontrol("Chart Control"; "Chart Control")
                {
                    ApplicationArea = all;
                    trigger ControlReady()
                    begin
                        DrawChart();
                    end;
                }
            }
        }
    }


    procedure DrawChart()
    var
        customer: Record "Customer";
        LabelsArray, DataArray : JsonArray;
        baljsonval, namesjsonval : jsonvalue;
    begin
        if customer.FindSet() then
            repeat
            begin
                Customer.CalcFields("Balance (LCY)");
                namesjsonval.SetValue(customer.Name);
                LabelsArray.Add(namesjsonval.Clone());

                baljsonval.SetValue(customer."Balance (LCY)");
                DataArray.Add(baljsonval.Clone());
            end;
            until customer.Next() = 0;
        Currpage."Chart Control".drawChart(LabelsArray, DataArray);
    end;
}