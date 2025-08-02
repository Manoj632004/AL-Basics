table 50332 "Movie Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Backup Type"; Enum "Backup Type")
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        // key(PK; "Primary Key")
        // {
        //    Clustered = true;
        // }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}