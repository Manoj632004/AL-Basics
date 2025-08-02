codeunit 50351 "Excel Direct Download" implements "ExcelHelper"
{
    Access = Internal;
    SingleInstance = true;
    procedure Export(Filename: Text; tempexcelbuffer: Record "Excel Buffer" temporary)
    var
        filemgmt: Codeunit "File Management";
    begin
        Filename := filemgmt.GetFileNameWithoutExtension(Filename);
        tempexcelbuffer.SetFriendlyFilename(Filename);
        tempexcelbuffer.OpenExcel();
    end;


}