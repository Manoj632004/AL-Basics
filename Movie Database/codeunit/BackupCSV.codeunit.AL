codeunit 50332 "Backup CSV" implements "Backup"
{
    procedure Backup(var movie: record "SOL Movie"): Boolean
    var
        lines: TextBuilder;
        OutStream: OutStream;
        Instream: InStream;
        TempBlob: Codeunit "Temp Blob";
        Tofile: Text;
    begin
        lines.Append('No.;Title;Year;Genre;Score;Image');
        repeat
            lines.Append(Format(movie."No.") + ';' + movie.Title + ';' + format(movie.Year) + ';' + movie.Genre + ';' + Format(movie.Score) + ';' + Format(movie.Image));
        until movie.Next() = 0;

        Tofile := 'Backup.csv';

        TempBlob.CreateOutStream(OutStream);
        OutStream.WriteText(lines.ToText());
        TempBlob.CreateInStream(Instream);

        if File.DownloadFromStream(Instream, 'Downloadfile', 'D:\indid\Data\AL\Companial\Movie Database\backup\', '', Tofile) then
            Message('Backup completed')
        else
            Error('Backup failed');

    end;
}
