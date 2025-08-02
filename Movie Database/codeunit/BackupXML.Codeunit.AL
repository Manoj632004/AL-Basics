codeunit 50335 "Backup XML" implements "Backup"
{
    procedure Backup(var movie: record "SOL Movie"): Boolean
    var
        tempblob: Codeunit "Temp Blob";
        xmloutstream: OutStream;
        xmlinstream: InStream;
        moviexmldocument: XmlDocument;
        moviesxmlelement: XmlElement;
        tofile: Text;
    begin
        moviexmldocument := XmlDocument.Create();
        moviesxmlelement := XmlElement.Create('Movies');

        movie.FindSet();
        repeat
            moviesxmlelement.Add(getmoviexmlelement(movie));
        until movie.Next() = 0;

        moviesxmlelement.Add(moviesxmlelement);

        tempblob.createoutstream(xmloutstream, TextEncoding::UTF8);
        moviexmldocument.WriteTo(xmloutstream);
        tempblob.createinstream(xmlinstream);
        tofile := 'MovieDatabase.xml';
        if File.DownloadFromStream(xmlinstream, 'Downloadfile', 'D:\indid\Data\AL\Companial\Movie Database\backup\', '', Tofile) then
            Message('Backup completed')

        else
            Error('Backup failed');
    end;

    procedure getmoviexmlelement(movie: record "SOL Movie"): XmlElement
    var
        moviexlmlelement: XmlElement;
    begin
        moviexlmlelement := XmlElement.Create('Movie');
        moviexlmlelement.Add(XmlElement.Create('No.', movie."No."));
        moviexlmlelement.Add(XmlElement.Create('Title', movie.Title));
        moviexlmlelement.Add(XmlElement.Create('Year', movie.Year));
        moviexlmlelement.Add(XmlElement.Create('Genre', movie.Genre));
        moviexlmlelement.Add(XmlElement.Create('Actors', movie.Actors));
        moviexlmlelement.Add(XmlElement.Create('Production', movie.Production));
        moviexlmlelement.Add(XmlElement.Create('Description', movie.Description));
        moviexlmlelement.Add(XmlElement.Create('Score', movie.Score));
        moviexlmlelement.Add(XmlElement.Create('Image', Format(movie.Image)));
        exit(moviexlmlelement);
    end;
}