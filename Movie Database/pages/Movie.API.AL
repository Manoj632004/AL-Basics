page 50334 "SOL Movie API"
{
    APIPublisher = 'solutize';
    APIGroup = 'movies';
    APIVersion = 'v2.0', 'v1.0';
    ChangeTrackingAllowed = true;
    Caption = 'Movies API';
    PageType = API;
    EntityName = 'movie';
    EntitySetName = 'movies';
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTable = "SOL Movie";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ID; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                }
                field(Genre; Rec.Genre)
                {
                    ApplicationArea = All;
                }
                field(Actors; Rec.Actors)
                {
                    ApplicationArea = All;
                }
                field(Production; Rec.Production)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                }
            }
        }
    }


}