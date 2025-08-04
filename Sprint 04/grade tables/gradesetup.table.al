table 50204 "SOL Grade SetUp"
{
    DataClassification = SystemMetadata;
    
    fields
    {
        field(1;"Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Primary Key';
        }
        field(2;"Grade Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Grade Nos.';
            TableRelation = "No. Series";
                
            
        }
    }
    
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
    
       
} 