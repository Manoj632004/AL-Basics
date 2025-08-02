table 50154 Example
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; FieldOne; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                irec.InsertLogEntry('Example Table', 'Onvalidate');
            end;


        }
        field(2; FieldTwo; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                irec.InsertLogEntry('Example Table', 'Onvalidate');
            end;
        }
    }

    keys
    {
        key(PK; FieldOne)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
        irec: record TriggerLog;

    trigger OnInsert()
    begin
        irec.InsertLogEntry('Example Table', 'Oninsert');
    end;

    trigger OnModify()
    begin
        irec.InsertLogEntry('Example Table', 'OnModify');
    end;

    trigger OnDelete()
    begin
        irec.InsertLogEntry('Example Table', 'OnDelete');
    end;

    trigger OnRename()
    begin
        irec.InsertLogEntry('Example Table', 'OnRename');
    end;

}