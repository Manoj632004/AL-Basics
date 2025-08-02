codeunit 50334 "Backup JSON" implements "Backup"
{
    procedure Backup(var movie: record "SOL Movie"): Boolean
    var
        tempBlob: Codeunit "Temp Blob";
        moviesjsonarray: JsonArray;
        jsonoutstream: OutStream;
        jsoninstream: InStream;
        filename: Text;
        tofile: Text;
    begin
        movie.Findset();
        repeat
            moviesjsonarray.Add(getmoviejsonobject(movie));
        until movie.Next() = 0;

        tempBlob.CreateOutStream(jsonoutstream, TextEncoding::UTF8);
        moviesjsonarray.WriteTo(jsonoutstream);
        tempBlob.CreateInStream(jsoninstream);
        tofile := 'MovieDatabase.json';
        if File.DownloadFromStream(jsoninstream, 'Downloadfile', 'D:\indid\Data\AL\Companial\Movie Database\backup\', '', Tofile) then
            Message('Backup completed')
        else
            Error('Backup failed');
    end;

    local procedure getmoviejsonobject(movie: record "SOL Movie"): JsonObject
    var
        moviejsonobj: JsonObject;
    begin
        moviejsonobj.Add('No.', movie."No.");
        moviejsonobj.Add('Title', movie.Title);
        moviejsonobj.Add('Year', movie.Year);
        moviejsonobj.Add('Genre', movie.Genre);
        moviejsonobj.Add('Actors', movie.Actors);
        moviejsonobj.Add('Production', movie.Production);
        moviejsonobj.Add('Description', movie.Description);
        moviejsonobj.Add('Score', movie.Score);
        moviejsonobj.Add('image', Format(movie.Image));
        exit(moviejsonobj);

    end;
}
