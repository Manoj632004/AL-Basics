codeunit 50282 "Doc. Attachment Events"
{
    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", OnBeforeImportFromStream, '', false, false)]
   local procedure OnBeforeExportToStream(var DocumentAttachment: Record "Document Attachment"; var IsHandled: Boolean)
    begin
    end;

}