page 50142 "Expression Calculator"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;
    Caption = 'Expression Calculator';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                field("Number 1"; num1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter Number 1';
                }
                field("Number 2"; num2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter Number 2';
                }
            }
            group(Result)
            {
                Editable = false;
                field(output; output)
                {
                    ApplicationArea = All;
                }
                group("Number2 compared to Number1")
                {
                    field(IsBigger; isBigger)
                    {
                        ApplicationArea = All;
                    }
                    field(IsSmaller; isSmaller)
                    {
                        ApplicationArea = All;
                    }
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(plus)
            {
                Caption = '+';
                ToolTip = 'Addition';
                Image = Calculate;
                ApplicationArea = All;
                //Promoted = true;
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    output := num1 + num2;
                end;
            }
            action(minus)
            {
                Caption = '-';
                Image = Calculate;
                ToolTip = 'Subtraction';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    output := num1 - num2;
                end;
            }
            action(mult)
            {
                Caption = '*';
                Image = Calculate;
                ToolTip = 'Multiplication';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    output := num1 * num2;
                end;
            }
            action(div)
            {
                Caption = '/';
                Image = Calculate;
                ToolTip = 'Division';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if (isBigger = true) and (num1 <> 0) then
                        output := Round(num2 / num1);
                    if (isSmaller = true) and (num2 <> 0) then
                        output := Round(num1 / num2);
                end;
            }
        }
    }

    var
        num1, num2, output : Decimal;
        isBigger, isSmaller : Boolean;

}