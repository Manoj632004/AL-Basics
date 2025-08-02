codeunit 50333 "Backup Excel" implements "Backup"
{//incomplete
    procedure Backup(var movie: record "SOL Movie"): Boolean
    var
        lines: Record "Excel Buffer" temporary;
        xlsOutStream: OutStream;
        xlsInstream: InStream;
        TempBlob: Codeunit "Temp Blob";
        Tofile: Text;
    begin
        //creating headers
        lines.NewRow();
        lines.AddColumn(movie.fieldcaption("No."), false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.fieldcaption(Title), false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.fieldcaption(Year), false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.fieldcaption(Genre), false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.fieldcaption(Actors), false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.fieldcaption(Production), false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.fieldcaption(Description), false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.fieldcaption(Score), false, '', true, false, false, '', lines."Cell Type"::text);

        movie.FindSet();
        repeat
            insertline(movie, lines);
        until movie.Next() = 0;
        lines.CreateNewBook(movie.TableCaption());
        lines.WriteSheet(movie.TableCaption(), CompanyName, UserId);
        lines.CloseBook();

        TempBlob.CreateOutStream(xlsOutStream, TextEncoding::UTF8);
        lines.SaveToStream(xlsOutStream, true);
        TempBlob.CreateInStream(xlsInstream);

        tofile := 'MovieDatabase.xlsx';
        if File.DownloadFromStream(xlsInstream, 'Downloadfile', 'D:\indid\Data\AL\Companial\Movie Database\backup\', '', Tofile) then
            Message('Backup completed')
        else
            Error('Backup failed');
    end;

    local procedure insertline(movie: record "SOL Movie"; tempExcelBuffer: Record "Excel Buffer")
    var
        lines: Record "Excel Buffer" temporary;
    begin
        lines.NewRow();
        lines.AddColumn(movie."No.", false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.Title, false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.Year, false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.Genre, false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.Actors, false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.Production, false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.Description, false, '', true, false, false, '', lines."Cell Type"::text);
        lines.AddColumn(movie.Score, false, '', true, false, false, '', lines."Cell Type"::text);
    end;
}