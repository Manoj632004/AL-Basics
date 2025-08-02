page 50144 "Get the Number"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;
    //give tool tip     

    layout
    {
        area(Content)
        {
            group("Group I")
            {
                Caption = 'Input';
                field(Input; myInt)
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
                Caption = 'Get Number';
                //give tooltip

                Promoted = true;
                PromotedIsBig = true;
                Image = Action;
                trigger OnAction()
                begin

                    Clear(Result);

                    for i := 1 to StrLen(myInt) do begin
                        temp := copystr(myInt, i, 1);
                        if temp in ['0' .. '9'] then
                            Result += temp;

                    end;

                    Message('%1', Result);

                end;
            }
        }
    }

    var
        myInt, Result, temp : text;
        i: Integer;
}