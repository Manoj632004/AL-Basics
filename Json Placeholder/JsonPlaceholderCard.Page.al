page 50351 JsonPlaceholderCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Uder Id"; "User Id")
                {
                    ApplicationArea = all;
                }
                field(JsonResult; JsonResult)
                {
                    MultiLine = true;
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Get Details")
            {
                Image = GetEntries;
                ApplicationArea = All;
                Caption = 'Get Details';

                trigger OnAction()
                begin
                    retrieveData();
                end;
            }
        }
    }

    var
        "User Id": Integer;
        JsonResult: Text;

    procedure retrieveData()
    var
        client: HttpClient;
        Response: HttpResponseMessage;
        ErrorBuilder: TextBuilder;
    begin
        if not client.get(StrSubstNo('https://jsonplaceholder.typicode.com/users/%1', "User Id"), Response) then
            Error('The call to webservice failed');
        if not Response.IsSuccessStatusCode() then
            ErrorBuilder.AppendLine('Webservice returned error');

        Response.Content().ReadAs(JsonResult);
    end;
}