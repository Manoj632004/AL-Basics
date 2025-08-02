page 50333 "SOL Movie Card Part"
{
    PageType = CardPart;
    SourceTable = "SOL Movie";
    Caption = 'Movie Poster';

    layout
    {
        area(Content)
        {

            field(Image; Rec.Image)
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        area(Processing)    
        {
            action(Upload)
            {
                Image = Picture;
                Caption = 'Upload Image';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Filename: Text;
                    NVInStream: InStream;
                begin
                    Filename := 'All Files (*.*)|*.*';
                    UploadIntoStream(Filename, NVInStream);
                    Clear(Rec.Image);
                    Rec.Image.ImportStream(NVInStream, Rec.Title);
                    Rec.Modify();
                end;
            }
        }
    }

    var
        myInt: Integer;
}