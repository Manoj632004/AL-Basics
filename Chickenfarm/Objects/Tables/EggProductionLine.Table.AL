table 50108 "Egg Production Line"
{
    DataClassification = CustomerContent;
    Caption = 'Egg Production Line';
    DrillDownPageId = "Egg Production Line List";

    fields
    {
        field(1; "Document no."; Code[20])
        {
            Caption = 'Document no.';
            DataClassification = CustomerContent;
        }
        field(2; "Line no."; Integer)
        {
            Caption = 'Line no.';
            DataClassification = CustomerContent;
        }
        field(3; "Chicken No."; Code[20])
        {
            Caption = 'Chicken No.';
            DataClassification = CustomerContent;
            TableRelation = Chicken ;
            
            //trigger OnValidate()
            //begin
            //    CalcFields("Chicken Description");//the value that is fetched from chicken type.code record's desciption goes here
            //end;
        }
        field(4; "Egg Production Date"; Date)
        {
            Caption = 'Egg Production Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Egg Type Code"; Code[20])
        {
            Caption = 'Egg Type Code';
            DataClassification = CustomerContent;
            TableRelation = "Egg Type";
            trigger OnValidate()
            begin
                CalcFields("Egg Type Description");
            end;
        }

        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }

        field(7; "Chicken Description"; Text[100])
        {
            Caption = 'Chicken Description';
            //CalcFormula = lookup("Chicken"."Chicken Type Description" Where("No." = field("Chicken No.")));
            //Above statement not possible, why?
            //FieldClass = FlowField;
            Editable = false;
        }

        field(8; "Egg Type Description"; Text[100])
        {
            CalcFormula = lookup("Egg Type".Description Where("Code" = field("Egg Type Code")));
            FieldClass = FlowField;
            Caption = 'Egg Type Description';
            Editable = false;
        }

    }

    keys
    {
        key(PK; "Line no.", "Document no.")
        {
            Clustered = true;
        }
    }

}