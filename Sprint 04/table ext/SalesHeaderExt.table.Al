tableextension 50208 "SOL Sales Header" extends "Sales Header"
{
    fields
    {
        field(50211; "SOL Grade"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Grade';
            tablerelation = "SOL Grade"."No.";
            NotBlank = true;
            trigger Onvalidate()
            begin
                CalcFields("SOL GradeDescription");
            end;
        }
        field(50212; "SOL GradeDescription"; Text[100])
        {
            Caption = 'Grade Description';
            fieldclass = FlowField;
            CalcFormula = lookup("SOL Grade".Description where("No." = field("SOL Grade")));
            editable = false;
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