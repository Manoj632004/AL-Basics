page 50112 "Egg Types"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Egg Type";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Code';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Chicken Type Description';

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(InsertDefaultEggTypes)
            {
                ApplicationArea = all;
                ToolTip = 'Insert Default Egg Types';
                Image = Insert;

                trigger OnAction()
                var
                    Eggtype: Record "Egg Type";
                    EggTypeNotEmptyErr: Label 'There are already Egg Types in the table';

                begin
                    if Eggtype.IsEmpty() then begin
                        Eggtype.InsertEggType('ET006', 'Big yellow');
                        Eggtype.InsertEggType('ET007', 'Big red');
                        Eggtype.InsertEggType('ET008', 'Big blue');
                    end
                    else
                        Error(EggTypeNotEmptyErr);
                end;
            }
        }
    }

    var
        myInt: Integer;
}