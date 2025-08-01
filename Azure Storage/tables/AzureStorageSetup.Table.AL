table 50281 "Azure Storage Setup"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Primary key"; code[10])
        {
            DataClassification = ToBeClassified;
            
        }
        field(2;"Storage Account Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            
        }
        field(3;"Shared Access Key ID"; Guid){
            DataClassification = ToBeClassified;
        }
        field(4;"Container Name"; Text[50]){
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(PK; "Primary key")
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
    
}
