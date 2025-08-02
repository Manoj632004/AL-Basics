codeunit 50352 "Excel Download Stream" implements "ExcelHelper"
{

    procedure Export(Filename: Text; tempexcelbuffer: Record "Excel Buffer" temporary)
    var
        tempblob: codeunit "temp blob";
        ExcelOutputStream: OutStream;
        ExcelInputStream: InStream;
        ExcelFilterlbl: Label 'Excel files (*.xlsx)|*.xlsx';

    begin
        tempblob.createOutStream(ExcelOutputStream);
        tempexcelbuffer.SaveToStream(ExcelOutputStream, true);
        tempblob.createInStream(ExcelInputStream);

        DownloadFromStream(ExcelInputStream, 'Download Excel File', '', ExcelFilterlbl, Filename);
    end;


    var
        myInt: Integer;
}