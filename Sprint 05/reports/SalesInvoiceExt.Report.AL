reportextension 50231 "SOL Sales - Invoice" extends "Standard Sales - Invoice"
{
    dataset
    {
        // Add changes to dataitems and columns here
        add(Line)
        {
            column(Order_No_Lbl; Line.FieldCaption("Order No."))
            {

            }
            column(Order_no; Line."Order No.")
            {
                IncludeCaption = true;
            }
            column(showinfo; showinfo)
            {

            }
        }

    }

    requestpage
    {
        layout{
            addlast(Options){
                field(showinfo;showinfo){
                    ApplicationArea = Basic, Suite; 
                    Caption = 'Display Order information';
                }
            }
        }

    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './src/StandardSalesInvoiceExt.rdlc';
        }
    }
    var
        showinfo: boolean;

}