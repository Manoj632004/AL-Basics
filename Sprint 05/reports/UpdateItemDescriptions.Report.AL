report 50233 UpdateItemDescriptions
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    //DefaultLayout = RDLC;
    RDLCLayout = './src/UpdateItemDescriptions.rdlc';
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterHeading = 'Item Selection';
            RequestFilterFields = "No.", Description, "Description 2";

            trigger OnAfterGetRecord()
            var
                ItemRec: Record Item;
            begin
                repeat
                    ItemRec.Get(Item."No.");
                    counter += 1;
                    ItemRec."Description 2" := CopyStr(ItemRec.Description + '(' + ItemRec."No." + ')', 1, MaxStrLen(ItemRec."Description 2"));
                    ItemRec.Modify();
                until ItemRec.Next = 0;
            end;

            trigger OnPostDataItem()
            begin
                Message('Updated %1 records', counter);
                Clear(counter);
            end;

        }

    }
    var
        counter: Integer;
}

