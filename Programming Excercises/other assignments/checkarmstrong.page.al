page 50145 "Find Armstrong Numbers"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group("Enter Start and End number")
            {
                field("Start Number:"; start)
                {
                    ApplicationArea = All;
                }
                field("Stop Number:"; stop)
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
            action(Run)
            {
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Calculate';
                trigger OnAction()
                begin
                    //if check_armstrong(start) = start then
                    //   Message('%1 is armstrong', check_armstrong(start))
                    //else
                    //    Message('not armstrong');

                    if (start = 0) or (stop = 0) then
                        exit;
                    for i := start to stop do begin
                        //Message('computing for %1', i);
                        temp := system.Format(i);// convert integer tom text
                        sum := 0;
                        //try foreach
                        for j := Text.StrLen(temp) downto 1 do begin
                            sub := Text.CopyStr(temp, j, 1);
                            Evaluate(rem, sub);//text to integer
                            Evaluate(lastdigit, temp[Text.StrLen(temp)]);
                            sum := sum + System.Power(rem, lastdigit);
                        end;
                        if sum = i then
                            arr += Format(i) + ' ';
                        clear(sum);

                    end;

                    Message('armstrong numbers are %1 ', arr);

                end;
            }
        }
    }

    var
        start, stop, i, j : Integer;
        arr: Text;
        temp, sub : text;
        sum, rem, lastdigit : Integer;
}