codeunit 50283 "Export Mgmt."
{
    procedure ExportCustomersAsJson(customer: Record Customer)
    var
        jsonarr: JsonArray;
        jsonobj: JsonObject;
    begin
        if customer.FindFirst() then begin
            repeat
                jsonobj.Add('CustomerNo', customer."No.");
                jsonobj.Add('Name', customer.Name);
                jsonobj.Add('Address', customer.Address);
                jsonobj.Add('PostCode', customer."Post Code");
                jsonobj.Add('City', customer.City);
                jsonobj.Add('CountryRegionCode', customer."Country/Region Code");
                jsonobj.Add('PhoneNo', customer."Phone No.");
                jsonobj.Add('Email', customer."E-Mail");
                jsonobj.Add('HomePage', customer."Home Page");
                jsonobj.Add('VATRegistrationNo', customer."VAT Registration No.");
                jsonobj.Add('CurrencyCode', customer."Currency Code");
                jsonobj.Add('PaymentTermsCode', customer."Payment Terms Code");
                jsonobj.Add('PaymentMethodCode', customer."Payment Method Code");
                jsonobj.Add('Blocked', customer.Blocked);
                jsonarr.Add(jsonobj);
                Clear(jsonobj);
            until customer.next = 0;
        end;
    end;
}