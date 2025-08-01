codeunit 50152 upgrade
{
    Subtype = Upgrade;
    trigger OnRun()
    var
        Module: ModuleInfo;
    begin

        navapp.GetCurrentModuleInfo(Module);
        //if Module.DataVersion().Major() = 1 then
        updatechickentypes();
    end;

    local procedure updatechickentypes();
    begin
        updatechickentype('CT 001', 'Type 01', 'Chicken Type 01');
        updatechickentype('CT 002', 'Type 02', 'Chicken Type 02');
        updatechickentype('CT 003', 'Type 03', 'Chicken Type 03');
        updatechickentype('CT 004', 'Type 04', 'Chicken Type 04');
    end;

    local procedure updatechickentype(oldcode: code[20]; newcode: code[20]; newdesc: text[100]);
    var
        rec: Record "Chicken Type";
    begin
        if rec.get(oldcode) then begin
            rec.rename(newcode);
            rec.Description := newdesc;
            rec.Modify(true);

        end;


    end;

    var
        myInt: Integer;
}