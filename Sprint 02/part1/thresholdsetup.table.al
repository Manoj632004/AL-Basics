table 50181 "Threshold Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;

        }
        field(2; "Threshold 1 Value"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Threshold 2 Value"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(4; "Threshold 1 Style"; Enum "Style Type")
        {
            DataClassification = CustomerContent;
        }
        field(5; "Threshold 2 Style"; Enum "Style Type")
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Primary Key")
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
}