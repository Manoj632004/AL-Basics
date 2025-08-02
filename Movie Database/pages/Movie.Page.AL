page 50331 "SOL Movie"
{
    PageType = List;
    ApplicationArea = All;
    Caption = 'Movie';
    UsageCategory = Lists;
    SourceTable = "SOL Movie";
    Editable = false;
    CardPageId = "SOL Movie Card";
    layout
    {
        area(Content)
        {
            repeater(Movies)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field(Genre; Rec.Genre)
                {
                    ToolTip = 'Specifies the value of the Genre field.', Comment = '%';
                }
                field(Score; Rec.Score)
                {
                    ToolTip = 'Specifies the value of the Score field.', Comment = '%';
                }
                field(Image; Rec.Image)
                {
                    ToolTip = 'Specifies the value of the Image field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Search on OMDb")
            {
                Caption = 'Search on OMDb';
                ApplicationArea = All;
                Image = Find;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction()
                begin

                end;
            }
            action("Backup Movies")
            {
                Caption = 'Backup Movies';
                ApplicationArea = All;
                Image = Export;
                trigger OnAction()
                var
                    moviesetup: Record "Movie Setup";
                    BackupExcelCodeunit: Codeunit "Backup Excel";
                    BackupJsonCodeunit: Codeunit "Backup JSON";
                    BackupXMLCodeunit: Codeunit "Backup XML";
                    BackupCSVCodeunit: Codeunit "Backup CSV";
                begin
                    moviesetup.FindFirst();
                    Rec.FindSet();
                    if moviesetup."Backup Type" = "Backup Type"::XLSX then begin
                        BackupExcelCodeunit.Backup(Rec);
                    end
                    else if moviesetup."Backup Type" = "Backup Type"::JSON then begin
                        BackupJsonCodeunit.Backup(Rec);
                    end
                    else if moviesetup."Backup Type" = "Backup Type"::XML then begin
                        BackupXMLCodeunit.Backup(Rec);
                    end
                    else if moviesetup."Backup Type" = "Backup Type"::CSV then begin
                        BackupCSVCodeunit.Backup(Rec);
                    end

                end;
            }
        }

    }



    var
        myInt: Integer;
}
