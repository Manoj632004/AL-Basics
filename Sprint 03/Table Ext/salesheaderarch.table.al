tableextension 50187 "SOL Sales Header Archive Ext." extends "Sales Header Archive"
{
    fields
    {
        // Add changes to table fields here
        field(50188; "Quote Status"; Enum "Won/Lost Status")
        {
            DataClassification = ToBeClassified;
        }
        field(50189; "Won/Lost Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50190; "Won/Lost Reason Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Quote Status" = const(won)) "Close Opportunity Code" where(type = const(won))
            else
            if ("quote status" = const(Lost)) "Close Opportunity Code" where(type = const(Lost));
            ValidateTableRelation = false;

        }
        field(50191; "Won/Lost Reason Desc."; Text[100])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Close Opportunity Code".Description where(Code = field("Won/Lost Reason Code")));
        }
        field(50192; "Won/Lost Remarks"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }
}