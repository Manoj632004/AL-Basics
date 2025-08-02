enum 50351 "Excel Exort Location" implements ExcelHelper
{
    Extensible = true;
    
    value(0; "Direct Download")
    {
            Caption = 'Direct Download';
            Implementation = ExcelHelper = "Excel Direct Download";
    }
    value(1; "Email")
    {
            Caption = 'Email';
            Implementation = ExcelHelper = "Excel Download Stream";
    }
    value(2; "Download via Email")
    {
            Caption = 'Download via Email';
             Implementation = ExcelHelper = "Excel Export Email";
    }
    value(3; "Endpoint")
    {
            Caption = 'Endpoint';
             Implementation = ExcelHelper = "Excel Export Http";
    }
}
