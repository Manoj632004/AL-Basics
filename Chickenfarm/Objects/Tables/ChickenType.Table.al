table 50106 "Chicken Type"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "Chicken Type";
    LookupPageId = "Chicken Type";
    Caption = 'Chicken Type';

    fields
    {
        field(1; "Code"; Code[20])//field ID, name of field(identifier), datatype
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; "Code")// key property, field name 
        {
            Clustered = true;//determines the physical order of the data rows in the table based on that key. This improves the speed of retrieving data sorted by this key.
        }
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