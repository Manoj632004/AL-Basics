table 50201 "SOL Grade"
{
    DataClassification = CustomerContent;
    LookupPageId = "SOL Grade";
    DrillDownPageId = "SOL Grade";
    Caption = 'Grade';


    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';
            trigger OnValidate()
            var
                gradeSetupRec: record "SOL Grade SetUp";
                NoseriesMgt: Codeunit "NoSeriesManagement";
            begin
                if "No." = xRec."No." then//Check if user changed the  number value 
                    exit;

                gradeSetupRec.Get();
                NoseriesMgt.TestManual(gradeSetupRec."Grade Nos.");//validate if entered number is valid as per the no. series
                "No. Series" := '';
            end;

        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
        field(3; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Caption = 'No. Series';
            Editable = false;


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
        fieldgroup(DropDown; "No.") { }
        fieldgroup(Brick; "No.", Description) { }

    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        gradeSetupRec: Record "SOL Grade SetUp";
        NoseriesMgt: Codeunit "NoSeriesManagement";

    begin
        if rec."No." = '' then begin //if no number in primary key, assign number according to no. series
            gradeSetupRec.Get();
            gradeSetupRec.TestField("Grade Nos.");
            NoseriesMgt.InitSeries(gradeSetupRec."Grade Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
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

    procedure AssistEdit(): Boolean
    var
        graderec: Record "SOL Grade";
        gradesetuprec: record "SOL Grade SetUp";
        NoseriesMgt: Codeunit "NoSeriesManagement";
    begin
        graderec := Rec;
        gradesetuprec.Get();
        //make sure there is a value in the Grade Nos. field in the Grade Setup table
        gradesetuprec.TestField("Grade Nos.");

        //SelectSeries function in the NoSeriesManagement codeunit to check the series number.
        if NoseriesMgt.SelectSeries(gradesetuprec."Grade Nos.", xRec."No. Series", graderec."No. Series") then begin
            NoseriesMgt.SetSeries(graderec."No.");
            gradesetuprec."Grade Nos." := '001';
            Rec := graderec;
            exit(true);//returns true if the No. and grade no. is set right
        end;

    end;





}