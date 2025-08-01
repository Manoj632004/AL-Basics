codeunit 50100 MyCodeunit
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        ChickenType: Record "Chicken Type";
    begin
        if ChickenType.IsEmpty() then
            InsertDefaultChickenType();
    end;

    var
        myInt: Integer;

    local procedure InsertChickenType(ChickenTypeCode: Code[20]; ChickenTypeDescription: Text[50]);
    var
        ChickenType: Record "Chicken Type";
    begin
        clear(ChickenType);
        ChickenType.Code := ChickenTypeCode;
        ChickenType.Description := ChickenTypeDescription;
        ChickenType.Insert(true);
        ChickenType.get
    end;

    local procedure InsertDefaultChickenType();
    begin
        InsertChickenType('CT 007', 'Dark Yellow');
        InsertChickenType('CT 008', 'Dark Red');
        InsertChickenType('CT 009', 'Dark Blue');
    end;

}