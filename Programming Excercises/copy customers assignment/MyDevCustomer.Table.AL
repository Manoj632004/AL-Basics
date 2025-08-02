table 50147 MyDevCustomer
{
    Caption = 'My DevCustomer Table';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Name"; text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "City"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Search Name"; Code[100])
        {
            DataClassification = ToBeClassified;
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