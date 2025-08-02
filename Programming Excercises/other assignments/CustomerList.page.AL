pageextension 50141 "Customer List Ext" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }
    /*
    actions
    {   
        addfirst("&Customer")
        {       
            action(RunVariablesAndDatatypes)
            {
                ApplicationArea = All;
                ToolTip = 'Run Variables and Datatypes';
                Caption = 'Run Variables and Datatypes';
                Image = Action;
                
                trigger OnAction()
                

            }
        }
        // Add changes to page actions here
    }*/
    trigger OnOpenPage()
    var
    //VariablesAndDatatypes: Codeunit VariablesAndDatatypes;
    begin
        //VariablesAndDatatypes.Run();
        //Message('The value of %1 is %2', 'LoopNo', 0);
    end;

    var
        myInt: Integer;
}