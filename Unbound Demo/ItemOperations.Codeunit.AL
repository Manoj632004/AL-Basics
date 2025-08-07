codeunit 50301 ItemOperations
{
    [ServiceEnabled]
    procedure UpdatePrices(percentage: integer): Integer
    var
        item: Record Item;
        countmodified: Integer;
    begin
        if not Item.FindSet() then
            exit(0);
        repeat
            item."Unit price" := item."Unit price" + (item."Unit price" * percentage / 100);
            item.MODIFY;
            countmodified += 1;
        until item.next() = 0;
        exit(countmodified);
    end;
}