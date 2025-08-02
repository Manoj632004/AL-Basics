page 50153 "TriggerLog page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TriggerLog;

    layout
    {
        area(Content)
        {
            repeater("Trigger Logs")
            {

                field("Entry no."; Rec."Entry no.")
                {
                    ToolTip = 'Specifies the value of the Entry no. field.', Comment = '%';
                }
                field("Object Name"; Rec."Object Name")
                {
                    ToolTip = 'Specifies the value of the Object Name field.', Comment = '%';
                }
                field("Time Stamp"; Rec."Time Stamp")
                {
                    ToolTip = 'Specifies the value of the Time Stamp field.', Comment = '%';
                }
                field("Trigger Name"; Rec."Trigger Name")
                {
                    ToolTip = 'Specifies the value of the Trigger Name field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}