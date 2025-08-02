interface ExcelHelper
{
    procedure Export(Filename: Text; tempexcelbuffer: Record "Excel Buffer" temporary);
}