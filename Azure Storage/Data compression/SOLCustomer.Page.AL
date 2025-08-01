pageextension 50281 "SOL Customer List" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("&Customer")
        {
            action("Export All as JSON")
            {
                trigger OnAction()
                var Exportmgmt: Codeunit "Export Mgmt.";

                begin
                    Exportmgmt.ExportCustomersAsJson(Rec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}