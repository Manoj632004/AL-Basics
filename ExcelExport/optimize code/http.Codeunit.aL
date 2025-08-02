codeunit 50355 "Excel Export Http" implements "ExcelHelper"
{
    Access = Internal;
    SingleInstance = true;
    procedure Export(Filename: Text; tempexcelbuffer: Record "Excel Buffer" temporary)
    var
        Excelhttpclient: HttpClient;
        Excelhttpcontent: HttpContent;
        Excelhttpresponse: HttpResponseMessage;
        TempBlob: Codeunit "Temp Blob";
        ExcelOutputStream: OutStream;
        ServiceUrl: Text;
        Servicefailedmsg: Label 'Call to webservice failed';
        WebServiceReturnedErr: Label 'Webservice returned an error';
    begin
        TempBlob.CreateOutStream(ExcelOutputStream);
        tempexcelbuffer.SaveToStream(ExcelOutputStream, true);
        ServiceUrl := 'https://www.test.com/uploadexcel';
        SetHttpContentAndHeaders(Filename, TempBlob, Excelhttpcontent);

        if not (Excelhttpclient.Post(ServiceUrl, Excelhttpcontent, Excelhttpresponse)) then
            Error(WebServiceReturnedErr);

        if not (Excelhttpresponse.IsSuccessStatusCode()) then
            Error(WebServiceReturnedErr);

    end;

    procedure SetHttpContentAndHeaders(Filename: Text; var tempblob: Codeunit "Temp Blob"; var ExcelhttpContent: HttpContent)
    var
        Filemanagement: Codeunit "File Management";
        ContentHeaders: HttpHeaders;
        ExcelInstream: InStream;
        Contenttype: Text;

    begin
        tempblob.CreateInStream(ExcelInstream);
        Contenttype := Filemanagement.GetFileNameMimeType(Filename);

        ExcelhttpContent.WriteFrom(ExcelInstream);
        ExcelhttpContent.GetHeaders(ContentHeaders);
        if ContentHeaders.Contains('Contain-Type') then
            ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', Contenttype);
    end;

}