codeunit 50353 "Excel Export Email" implements "ExcelHelper"
{
    Access = Internal;
    SingleInstance = true;

    procedure Export(Filename: Text; tempexcelbuffer: Record "Excel Buffer" temporary)
    var
        Filemanagement: Codeunit "File Management";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit "Email";
        TempBlob: Codeunit "Temp Blob";
        ExcelOutputStream: OutStream;
        ExcelInputStream: InStream;
        ContentType: Text;
    begin
        TempBlob.CreateOutStream(ExcelOutputStream);
        tempexcelbuffer.SaveToStream(ExcelOutputStream, true);
        TempBlob.CreateInStream(ExcelInputStream);

        ContentType := Filemanagement.GetFileNameMimeType(Filename);
        EmailMessage.AddAttachment(CopyStr(Filename, 1, 250), CopyStr(ContentType, 1, 250), ExcelInputStream);
        Email.Send(EmailMessage);
    end;

    var
        myInt: Integer;
}