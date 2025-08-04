codeunit 50193 "SOL Quote Status Mgmt"
{
    procedure CloseQuote(var SalesHeader: Record "Sales Header")
    begin
        ArchivesSalesQuote(SalesHeader)
    end;

    local procedure ArchivesSalesQuote(var SalesHeader: Record "Sales Header")
    var
        salessetup: Record "Sales & Receivables Setup";
        Archivemanagement: Codeunit "ArchiveManagement";
    begin
        salessetup.Get();
        case salessetup."Archive Quotes" of
            salessetup."Archive Quotes"::"Always":
                Archivemanagement.ArchsalesDocumentNoConfirm(SalesHeader);
            salessetup."Archive Quotes"::"Question":
                Archivemanagement.ArchiveSalesDocument(SalesHeader);
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Quote", 'OnBeforeActionEvent', 'Archive Document', true, true)]
    local procedure OnBeforeActionArchiveDocumentQuote(var Rec: Record "Sales Header")
    var
        ArchiveCanNotBeCompletedErr: Label 'Archive can not be completed';
    begin
        RunCloseQuotePage(Rec, ArchiveCanNotBeCompletedErr);

    end;
    //Create an event subscriber for the Make Order action on the Sales Quote page in the Quote Status Mgmt codeunit.
    [EventSubscriber(ObjectType::Page, Page::"Sales Quote", 'OnBeforeActionEvent', 'MakeOrder', true, true)]
    local procedure OnBeforeActionMakeOrderQuote(var Rec: Record "Sales Header")
    var
        OrderCreationCanNotBeCompletedErr: Label 'Order creation can not be completed';
    begin
        RunCloseQuotePage(Rec, OrderCreationCanNotBeCompletedErr);

    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Quotes", 'OnBeforeActionEvent', 'MakeOrder', true, true)]
    local procedure OnBeforeActionMakeOrderQuotes(var Rec: Record "Sales Header")
    var
        OrderCreationCanNotBeCompletedErr: Label 'Order creation can not be completed';
    begin
        RunCloseQuotePage(Rec, OrderCreationCanNotBeCompletedErr);
    end;

    local procedure RunCLoseQuotePage(var SalesHeader: Record "Sales Header"; NotCompletedErr: Text)
    begin
        if SalesHeader."Won/Lost Quote Status" <> SalesHeader."Won/Lost Quote Status"::"In Progress" then
            exit;
        if Page.RunModal(page::"Close Quote", SalesHeader) <> Action::LookupOK then
            Error(NotCompletedErr);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ArchiveManagement, 'OnBeforeSalesHeaderArchiveinsert', '', true, true)]
    local procedure OnBeforeSalesHeaderArchiveinsert(var SalesHeaderArchive: Record "Sales Header Archive"; SalesHeader: Record "Sales Header")
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Quote then
            exit;
        SalesHeaderArchive."Quote status" := SalesHeader."Won/Lost Quote Status";
        SalesHeaderArchive."Won/Lost Date" := SalesHeader."Won/Lost Date";
        SalesHeaderArchive."Won/Lost Reason Code" := SalesHeader."Won/Lost Reason Code";
        SalesHeaderArchive."Won/Lost Reason Desc." := SalesHeader."Won/Lost Reason Desc.";
        SalesHeaderArchive."Won/Lost Remarks" := SalesHeader."Won/Lost Remarks";

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Conf./Personalization Mgt.", 'OnRoleCenterOpen', '', true, true)]
    local procedure OnRoleCenterOpen()
    var
        lostquote: Notification;
        salespersoncode: code[10];
    begin
        salespersoncode := GetSalesPersonForLoggedinUser();
        if salespersoncode = '' then
            exit;

        GetQuoteRecords("Won/Lost status"::Lost, salespersoncode);
        GetQuoteRecords("Won/Lost status"::won, salespersoncode);
        //lostquote.Message := 'You have lost quotes to follow up on.';
    end;

    procedure AddDaystoDateTime(DateTime: DateTime; NoofDays: Integer): DateTime
    begin
        exit(DateTime + (NoofDays * 86400000));
    end;

    procedure GetSalesPersonForLoggedinUser(): Code[20]
    var
        salesperson: record "Salesperson/purchaser";
        user: record User;
    begin
        user.Reset();

        if user.Get(UserSecurityId()) then
            exit('');
        if user."Contact Email".Trim() = '' then
            exit('');
        salesperson.Reset();
        salesperson.SetRange("E-mail", user."Contact Email");
        if salesperson.FindFirst() then
            exit(salesperson.Code);
    end;

    procedure SendNoOfLostNotifications(NoOfquotes: Integer; WonLostStatus: Enum "Won/Lost status"; Salespersoncode: code[20])
    var
        QuoteNotification: Notification;
        YouWonQuotes: Label 'You %1 %2 quotes to during the last 5 days', Comment = '1: Won/Lost , 2:  No of Quotes';
        ShowquotesLbl: Label 'Show %1 Quotes', Comment = ' %1 = Won/Lost';
    begin
        QuoteNotification.Message := StrSubstNo(YouWonQuotes, WonLostStatus, Salespersoncode);
        QuoteNotification.setData('Salespersoncode', Salespersoncode);
        QuoteNotification.setData('WonLostStatus', format(WonLostStatus));
        QuoteNotification.AddAction(StrSubstNo(ShowquotesLbl, WonLostStatus), Codeunit::"SOL Quote Status Mgmt", 'OpenQuotes');
    end;

    procedure GetQuoteRecords(wonloststatus: Enum "Won/Lost status"; SalesPersonCode: Code[20])
    var
        salesheader: Record "Sales Header";
        NoofRecords: Integer;
    begin
        FilterQuotes(salesheader, wonloststatus, SalesPersonCode);
        NoofRecords := salesheader.Count;

        if NoofRecords <> 0 then
            SendNoOfLostNotifications(NoofRecords, wonloststatus, SalesPersonCode);
        ;
    end;

    procedure OpenQuotes(Quotenotification: Notification)
    var
        salesheader: Record "Sales Header";
        wonloststatus: Enum "Won/Lost status";
        salespersoncode: Code[20];
        WonloststatusInteger: Integer;
    begin
        salespersoncode := Copystr(Quotenotification.getData('Salespersoncode'), 1, MaxstrLen(salespersoncode));
        Evaluate(WonloststatusInteger, Quotenotification.getData('WonLostStatus'));
        wonloststatus := "Won/Lost Status".FromInteger(WonloststatusInteger);

        FilterQuotes(salesheader, wonloststatus, salespersoncode);
        if salesheader.FindSet() then
            page.run(page::"Sales Quotes", salesheader);
    end;

    procedure FilterQuotes(var salesheader: Record "Sales Header"; WonLostStatus: Enum "Won/Lost status"; SalesPersonCode: Code[20])
    begin
        salesheader.Reset();
        salesheader.SetRange("Document Type", SalesHeader."Document Type"::Quote);
        salesheader.SetRange("Salesperson Code", salespersoncode);
        salesheader.SetRange("Won/Lost Quote Status", wonloststatus);
        salesheader.SetRange("Won/Lost Date", AddDaystoDateTime(CurrentDateTime(), -5), CurrentDateTime());
    end;


}