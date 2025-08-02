page 50335 "Search On OMDb"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Search)
            {
                field(Title; Title)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Get Details from OMDb")
            {
                Image = GetEntries;
                ApplicationArea = All;
                Caption = 'Get Details';

                trigger OnAction()
                begin
                    AllOptions := SearchMovieinfo(Title);
                    OptionMembers := ProcessJson(AllOptions);
                    OptionNumber := Dialog.StrMenu(OptionMembers, 1, 'Choose movie');
                    GetMovieData(OptionNumber, IMDbIds);
                    Message('Movie details are added to the table successfully');
                end;
            }
        }
    }

    var
        Title: Text;
        OptionNumber: Integer;
        AllOptions, OptionMembers, JsonResult, IMDbIds : Text;
        movie: Record "SOL Movie";

    procedure SearchMovieinfo(moviename: Text): Text
    var
        client: HttpClient;
        Response: HttpResponseMessage;
    begin
        if not client.Get(StrSubstNo('http://www.omdbapi.com/?apikey=610d27a&s=%1', moviename), Response) then
            Error('The call to OMDb site failed');
        if not Response.IsSuccessStatusCode() then
            Error('Webservice returned error');
        Response.Content().ReadAs(JsonResult);
        exit(JsonResult);
    end;

    procedure ProcessJson(content: Text): Text
    var
        userJsonObject: JsonObject;
        userJsonToken: JsonToken;
        userJsonArray: JsonArray;
        titles: Text;
        index: Integer;
    begin
        if not userJsonObject.ReadFrom(content) then
            Error('No results found');
        userJsonObject.Get('Search', userJsonToken);
        userJsonArray := userJsonToken.AsArray();
        for index := 0 to userJsonArray.Count() - 1 do begin
            userJsonArray.Get(index, userJsonToken);
            userJsonObject := userJsonToken.AsObject();

            userJsonObject.Get('Title', userJsonToken);
            titles += userJsonToken.AsValue().AsText() + ',';

            userJsonObject.Get('imdbID', userJsonToken);
            IMDbIds += userJsonToken.AsValue().AsText() + ',';
        end;
        exit(titles);
    end;

    procedure GetMovieData(index: Integer; list: Text)
    var
        IDs: List of [Text];
        requiredMovie: Text;
        client: HttpClient;
        Response: HttpResponseMessage;
        MovieResult: Text;
        MovieResultJson: JsonObject;
        temp: JsonToken;
    begin
        IDs := list.Split(',');
        requiredMovie := IDs.Get(index);

        if not client.Get(StrSubstNo('http://www.omdbapi.com/?apikey=610d27a&i=%1', requiredMovie), Response) then
            Error('The call to OMDb site failed');
        Response.Content().ReadAs(MovieResult);
        MovieResultJson.ReadFrom(MovieResult);

        movie.Init();
        movie."No." := 'MV 003';
        MovieResultJson.Get('Title', temp);
        movie.Title := temp.AsValue().AsText();
        MovieResultJson.Get('Year', temp);
        movie.Year := temp.AsValue().AsInteger();
        MovieResultJson.Get('Genre', temp);
        movie.Genre := temp.AsValue().AsText();
        MovieResultJson.Get('Actors', temp);
        movie.Actors := temp.AsValue().AsText();
        MovieResultJson.Get('Production', temp);
        movie.Production := temp.AsValue().AsText();
        MovieResultJson.Get('Plot', temp);
        movie.Description := temp.AsValue().AsText();
        MovieResultJson.Get('imdbRating', temp);
        movie.Score := temp.AsValue().AsDecimal();
        MovieResultJson.Get('Poster', temp);
        DownloadPoster(temp.AsValue().AsText());
        movie.Insert(true);
    end;

    procedure DownloadPoster(url: Text)
    var
        PosterInStream: InStream;
        OmdbHttlpClient: HttpClient;
        OmdbResponse: HttpResponseMessage;
        Omdbhttpcontent: HttpContent;
        Calltowebservicefailuire: Label 'Failed to call OMDb site';
        Webserivereturnederror: Label 'Webservice returned error';
    begin
        // Implementation for downloading poster
        if url = '' then exit;
        if not OmdbHttlpClient.Get(url, OmdbResponse) then
            Error(Calltowebservicefailuire);
        if not OmdbResponse.IsSuccessStatusCode() then
            Error(Webserivereturnederror);
        OmdbHttpContent.ReadAs(PosterInStream);
        if PosterInStream.Length = 0 then
            Error('No poster found');
        movie.Image.ImportStream(PosterInStream, movie.Title);
    end;
}
