table 50331 "SOL Movie"
{
    Caption = 'Movie';
    DataClassification = CustomerContent;
    LookupPageId = "SOL Movie";
    DrillDownPageId = "SOL Movie";
    DataCaptionFields = "No.", "Title";
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; Title; Text[50])
        {
            Caption = 'Title';
            DataClassification = CustomerContent;
        }
        field(3; Year; Integer)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
        }
        field(4; Genre; Text[50])
        {
            Caption = 'Genre';
            DataClassification = CustomerContent;
        }
        field(5; Actors; Text[250])
        {
            Caption = 'Actors';
            DataClassification = CustomerContent;
        }
        field(6; Production; Text[50])
        {
            Caption = 'Production';
            DataClassification = CustomerContent;
        }
        field(7; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(8; Score; Decimal)
        {
            Caption = 'Score';
            DataClassification = CustomerContent;
        }
        field(9; Image; Media)
        {
            Caption = 'Image';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup("Brick"; "No.", Title, Genre, Score, Image)
        {
        }
        fieldgroup("Dropdown"; "No.", Title, Year)
        {
        }
    }


}