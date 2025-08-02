page 50332 "SOL Movie Card"
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = "SOL Movie";
    Caption = 'Movie';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field(Genre; Rec.Genre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Genre field.', Comment = '%';
                }
                field(Actors; Rec.Actors)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actors field.', Comment = '%';
                }
                field(Production; Rec.Production)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Production field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    MultiLine = true;
                }

                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Score field.', Comment = '%';
                }

            }

        }
        area(FactBoxes)
        {
            part(MovieImage; "SOL Movie Card Part")
            {
                Caption = 'Movie Poster';
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }



    var
        myInt: Integer;
}