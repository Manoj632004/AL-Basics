page 50143 "Price Calculator"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field(Price; Price)
                {
                    ApplicationArea = All;
                }
            }
            group(Output)
            {
                Editable = false;
                field(Result; Result)
                {
                    ApplicationArea = All;
                }
                field("Total Sales"; "Total Sales")
                {
                    ApplicationArea = All;
                }
                field("Total Credits"; "Total Credits")
                {
                    ApplicationArea = All;
                }
                field("Grand Total"; "Grand Total")
                {
                    ApplicationArea = All;
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                Image = ExecuteBatch;
                ToolTip = 'Execute';
                trigger OnAction()
                begin
                    if Quantity = 0 then
                        exit
                    else begin
                        Result := Quantity * Price;
                        if Result < 0 then
                            "Total Credits" := "Total Credits" + Result;
                        if Result >= 0 then
                            "Total Sales" := "Total Sales" + Result;

                        "Grand Total" += Result;
                    end;
                end;
            }
            action(Clear)
            {
                Image = Bin;
                ToolTip = 'Clear Values';
                trigger OnAction()
                begin
                    ClearAll();
                end;
            }
        }
    }

    var
        Price, Quantity, Result, "Total Sales", "Total Credits", "Grand Total" : Decimal;
}