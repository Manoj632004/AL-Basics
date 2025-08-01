table 50107 "Egg Type"
{
    DataClassification = CustomerContent;
    LookupPageId = "Egg Types";// user can access  lookup page to help them choose valid entries.
    DrillDownPageId = "Egg Types"; //ID of a page that provides more detailed information related to the selected record
    Caption = 'Egg Type';
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Code")
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

    procedure InsertEggType(EggTypeCode: Code[20]; EggTypeDescription: Text[50]);
    var
        EggType: Record "Egg Type";
    begin
        clear(EggType);
        EggType.Code := EggTypeCode;
        EggType.Description := EggTypeDescription;
        Eggtype.Insert(true);
    end;
}