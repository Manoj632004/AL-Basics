page 50155 "Example List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Example;
    CardPageId = "Example Card Page";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                //Editable = true;
                field(FieldOne; Rec.FieldOne)
                {

                    ToolTip = 'Specifies the value of the FieldOne field.', Comment = '%';
                    trigger OnValidate();
                    begin
                        irec.InsertLogEntry('Example List', 'Onvalidate');
                    end;
                }
                field(FieldTwo; Rec.FieldTwo)
                {
                    ToolTip = 'Specifies the value of the FieldTwo field.', Comment = '%';
                    trigger OnValidate();
                    begin
                        irec.InsertLogEntry('Example List', 'Onvalidate');
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Example List Action")
            {
                trigger OnAction()
                begin
                    irec.InsertLogEntry('Example List', 'OnAction');
                end;
            }
        }
    }

    var
        irec: Record triggerlog;
}