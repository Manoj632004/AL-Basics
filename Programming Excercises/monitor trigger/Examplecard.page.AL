page 50156 "Example Card Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Example;
    Caption = 'Example';
    layout
    {
        area(Content)
        {
            group(Fields)
            {
                Caption = 'Example Card';
                field(FieldOne; Rec.FieldOne)
                {
                    ToolTip = 'Specifies the value of the FieldOne field.', Comment = '%';
                    trigger OnValidate();
                    begin
                        irec.InsertLogEntry('Example Card', 'Onvalidate');
                    end;
                }
                field(FieldTwo; Rec.FieldTwo)
                {
                    ToolTip = 'Specifies the value of the FieldTwo field.', Comment = '%';
                    trigger OnValidate();
                    begin
                        irec.InsertLogEntry('Example Card', 'Onvalidate');
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Example Card Action")
            {
                trigger OnAction()
                begin
                    irec.InsertLogEntry('Example Card', 'OnAction');
                end;
            }
        }
    }

    var
        irec: Record triggerlog;

}