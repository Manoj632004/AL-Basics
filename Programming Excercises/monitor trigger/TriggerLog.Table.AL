table 50152 TriggerLog
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry no."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Object Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Trigger Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Time Stamp"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        //key(Key1; MyField)
        //{
        //   Clustered = true;
        //}
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        Entryno: Integer;

    procedure InsertLogEntry(ObjectName: Text[100]; triggerName: text[100]);
    begin
        //Message('function running');
        clear(Rec);
        if Rec.FindLast() = true then
            Entryno := (Rec."Entry no." + 1)
        else
            Entryno := 1;

        Rec.Init();
        Rec."Entry no." := Entryno;
        Rec."Time Stamp" := CurrentDateTime;
        Rec."Object Name" := ObjectName;
        Rec."Trigger Name" := triggerName;
        Rec.Insert(true);
    end;

    procedure ClearLogFields();
    begin
        if Rec.FindFirst() = false then Rec.DeleteAll();
    end;
}