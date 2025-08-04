codeunit 50219 "SOL Grade Mngt."
{
    Permissions = tabledata "Sales Invoice Header" = RM,
                  tabledata "Sales Cr.Memo Header" = RM,
                  tabledata "Cust. Ledger Entry" = RM;

    [EventSubscriber(ObjectType::Table, Database::"Customer", 'OnAfterValidateEvent', 'SOL Grade', true, true)]
    //Permissions = tabledata(PermissionSet);
    local procedure AssignGradeToCustomer(CurrFieldno: Integer; var Rec: Record Customer; var xRec: Record Customer)
    var
        gradehst: record "SOL Grade History";
    begin
        gradehst.Insertintogradehistory(Rec."No.",
                                        Today(),
                                        'Customer',
                                        Rec."No.",
                                        Rec."SOL Grade");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure AssignGradeToSalesHeader(var Rec: Record "Sales Header")
    var
        Gradehst: Record "SOL Grade History";
        CustRec: Record "Customer";
    begin
        if Rec."Bill-to Customer No." = '' then
            exit;
        Clear(CustRec);

        if not CustRec.Get(Rec."Bill-to Customer No.") then
            exit;
        if CustRec."SOL Grade" = '' then
            exit;

        Rec."SOL Grade" := CustRec."SOL Grade";

        Gradehst.Insertintogradehistory(Rec."No.",
                                        Rec."Posting Date",
                                        'Sales' + Format(Rec."Document Type"),
                                        Rec."No.",
                                        Rec."SOL Grade");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterInsertEvent', '', false, false)]
    local procedure AssignGradeToCustomerLedger(var Rec: Record "Cust. Ledger Entry")
    var
        Gradehst: Record "SOL Grade History";
        CustRec: Record Customer;
    begin
        if Rec."Document No." = '' then
            exit;
        Clear(CustRec);

        if not CustRec.Get(Rec."Customer No.") then
            exit;
        if CustRec."SOL Grade" = '' then
            exit;

        Rec."SOL Grade" := CustRec."SOL Grade";

        if Rec.Modify() then
            Gradehst.Insertintogradehistory(Rec."Customer No.",
                                            Rec."Posting Date",
                                            'Cutomer Ledger Entry',
                                            Format(Rec."Entry No."),
                                            Rec."SOL Grade");
    end;

    [EventSubscriber(ObjectType::codeunit, codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]

    local procedure AssignGradeDuringSalesPost(var SalesHeader: Record "Sales Header";
                                                var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
                                                SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20];
                                                SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20];
                                                CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean;
                                                var CustLedgerEntry: Record "Cust. Ledger Entry";
                                                WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    var
        Gradehst: Record "SOL Grade History";
        CustRec: Record Customer;
        SalesInvRec: Record "Sales Invoice Header";
        SalesMemRec: Record "Sales Cr.Memo Header";
    begin
        if CustRec."Bill-to Customer No." = '' then
            exit;

        Clear(CustRec);
        if not CustRec.Get(SalesHeader."Bill-to Customer No.") then
            exit;

        if CustRec."SOL Grade" = '' then
            exit;

        if SalesInvHdrNo = '' then begin
            clear(SalesInvRec);
            SalesInvRec.get(SalesInvHdrNo);
            SalesInvRec."SOL Grade" := CustRec."SOL Grade";
            SalesInvRec.Modify();

            Gradehst.Insertintogradehistory(SalesInvRec."Bill-to Customer No.",
                                            SalesInvRec."Posting Date",
                                            'Posted Sales Invoice',
                                            SalesInvRec."No.",
                                            SalesInvRec."SOL Grade");
        end;
        if SalesCrMemoHdrNo <> '' then begin
            Clear(SalesMemRec);
            SalesMemRec.get(SalesCrMemoHdrNo);
            SalesMemRec."SOL Grade" := CustRec."SOL Grade";
            SalesMemRec.Modify();

            Gradehst.Insertintogradehistory(SalesMemRec."Bill-to Customer No.",
                                            SalesMemRec."Posting Date",
                                            'Posted Sales Credit Memo',
                                            SalesMemRec."No.",
                                            SalesMemRec."SOL Grade");
        end;
    end;
}
