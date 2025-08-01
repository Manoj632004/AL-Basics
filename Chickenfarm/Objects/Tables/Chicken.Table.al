// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.Chickenfarm;

//using Microsoft.Sales.Customer;

table 50105 Chicken
{
    DataClassification = ToBeClassified;
    Caption = 'Chicken';
    //Access = Public;
    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';

        }
        field(2; "Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }
        field(3; "Chicken Type Code"; code[20])
        {
            Caption = 'Chicken Type Code';
            TableRelation = "Chicken Type";
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                CalcFields("Chicken Type Description");
            end;
        }
        field(4; "Chicken Type Description"; Text[100])
        {
            Caption = 'Chicken Type Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Chicken Type".Description where("Code" = field("Chicken Type Code")));
            Editable = false;
        }
        field(5; Picture; MediaSet)
        {
            Caption = 'Picture';
            DataClassification = ToBeClassified;
        }
        field(6; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
        }

        field(7; "number of eggs produced"; Decimal)
        {
            Caption = 'Number of eggs produced';
            FieldClass = FlowField;
            CalcFormula = sum("Egg Production Line".Quantity where("Chicken No." = field("No.")
            ));
            Editable = false;
        }
        field(8; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Date FIlter';
        }
        field(9; "Egg Type Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Egg Type";
            Caption = 'Egg Type Filter';

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
        fieldgroup(DropDown; "Chicken Type Description", "Chicken Type Code") { }//type of field group, field name to appear when selected, second field
        fieldgroup(Brick; "Chicken Type Description", Picture) { }
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
    var
        EggProductionLine: Record "Egg Production Line";
        ChickenHasEggsErr: Label 'The Chicken %1 %2 has eggs, you can''t detele it.';
    begin
        Clear(EggProductionLine);
        EggProductionLine.get(rec."No.");//setrange(chicken no, rec.no);
        if EggProductionLine.IsEmpty() = false then
            Error(ChickenHasEggsErr, rec."No.", rec."Chicken Type Description")
        else
            EggProductionLine.delete();

    end;


}
