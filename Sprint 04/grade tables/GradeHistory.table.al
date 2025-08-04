table 50219 "SOL Grade History"
{
    DataClassification = ToBeClassified;
    LookupPageId = "SOL Grade History";
    DrillDownPageId = "SOL Grade History";

    fields
    {
        field(1; "Entry no."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.';
        }
        field(2; "Document Type"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document Type';
        }
        field(3; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
        }
        field(4; "Document Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Document Date';
        }
        field(5; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(6; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            CalcFormula = lookup(Customer."Name" where("No." = field("Customer No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(7; "DateTime"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'DateTime';
        }
        field(8; "User ID"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'User ID';
        }
        field(9; "Grade"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Grade';
        }
        field(10; "Grade Description"; Text[100])
        {
            Caption = 'Grade Description';
            FieldClass = FlowField;
            CalcFormula = lookup("SOL Grade".Description where("No." = field("Grade")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Entry no.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    procedure Insertintogradehistory(Custno: Code[20]; Date: Date; docType: Text[100]; DocNo: Code[20]; grade: Code[20])

    begin
        //Clear(Entryno);
        if Rec.FindLast() = true then
            Rec."Entry no." += 1
        else
            Rec."Entry no." := 1;

        Rec."Document Type" := docType;
        Rec."Document No." := docNo;
        Rec."Document Date" := Date;
        Rec."Customer No." := custNo;
        Rec."DateTime" := CurrentDateTime;
        Rec."User ID" := UserId();
        Rec."Grade" := grade;
        Rec.Insert();
    end;

}