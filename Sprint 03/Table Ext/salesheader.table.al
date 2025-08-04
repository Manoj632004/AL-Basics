tableextension 50181 "SOL Sales Header Ext" extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50182; "Won/Lost Quote Status"; Enum "Won/Lost Status")
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if ("Won/Lost Date" = 0DT) then
                    "Won/Lost Date" := CurrentDateTime();
            end;

        }

        field(50183; "Won/Lost Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50184; "Won/Lost Reason Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = if ("Won/Lost Quote Status" = const(won)) "Close Opportunity Code" where(type = const(won))
            else if ("won/lost quote status" = const(Lost)) "Close Opportunity Code" where(type = const(Lost)) ;
            trigger OnValidate()
            begin
                CalcFields("Won/Lost Reason Desc.");
            end;
        }
        field(50185; "Won/Lost Reason Desc."; Text[100])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Close Opportunity Code".Description where (Code = field("Won/Lost Reason Code")));       
        }
        field(50186; "Won/Lost Remarks"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
    }


    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}