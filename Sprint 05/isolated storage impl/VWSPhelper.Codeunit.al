codeunit 50231 "VWSP Helper"
{
    procedure SetVendorWebShopPassword(var vendor: record Vendor): Boolean
    var
        ConfirmMgmt: Codeunit "Confirm Management";
        passwordmgmt: codeunit "password dialog management";
        Replacetxt: Label 'Do you want to replace password?';
        [NonDebuggable]
        newpassword: Text;
    begin
        if HasVendorWebShopPassword(vendor) then
            if not ConfirmMgmt.GetResponse(StrSubstNo(Replacetxt), false) then exit;
        newpassword := passwordmgmt.OpenPasswordDialog(true, true);
        if newpassword = '' then exit;

        DeleteVendorWebshopPassword(vendor);
        if EncryptionEnabled() then
            exit(IsolatedStorage.SetEncrypted(VendorWebShopPasswordSecretKey(vendor), newpassword, DataScope::Company));
        exit(IsolatedStorage.Set(VendorWebShopPasswordSecretKey(vendor), newpassword, DataScope::Company));

    end;

    procedure VendorWebShopPasswordSecretKey(var vendor: record Vendor): Text
    var
        vendorwebshoppasswordKeylbl: Label 'VWSP%1', locked = true, comment = '%1=Vendor No.';
    begin
        exit(StrSubstNo(vendorwebshoppasswordKeylbl, vendor."No."));
    end;

    [NonDebuggable]
    procedure HasVendorWebShopPassword(var vendor: record Vendor): Boolean
    begin
        exit(IsolatedStorage.Contains(VendorWebShopPasswordSecretKey(vendor), DataScope::Company));

    end;

    procedure VendorWebShopPasswordValue(var vendor: record Vendor): Text
    var
        VWSPAssignTok: Label 'Assign';
        VWSPAvailableTok: Label 'Available';
    begin
        if HasVendorWebShopPassword(Vendor) then
            exit(VWSPAvailableTok);
        exit(VWSPAssignTok);
    end;

    [NonDebuggable]
    procedure GetVendorWebShopPassword(var vendor: record Vendor): Text
    var
        password: Text;
    begin
        if IsolatedStorage.get(VendorWebShopPasswordSecretKey(vendor), DataScope::Company, password) then
            exit(password)
    end;

    [NonDebuggable]
    procedure DeleteVendorWebshopPassword(var vendor: record Vendor): Boolean
    begin
        exit(IsolatedStorage.Delete(VendorWebShopPasswordSecretKey(vendor), DataScope::Company));
    end;



}