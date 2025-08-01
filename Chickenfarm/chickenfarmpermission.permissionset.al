namespace Enter;

using DefaultPublisher.Chickenfarm;

permissionset 50100 chickenpermission
{
    
    Assignable = true;
    Permissions = tabledata Chicken = RIMD,
        tabledata "Chicken Type" = RIMD,
        tabledata "Egg Production Header" = RIMD,
        tabledata "Egg Production Line" = RIMD,
        tabledata "Egg Type" = RIMD,
        table Chicken = X,
        table "Chicken Type" = X,
        table "Egg Production Header" = X,
        table "Egg Production Line" = X,
        table "Egg Type" = X,
        codeunit MyCodeunit = X,
        page "Chicken Card" = X,
        page "Chicken List" = X,
        page "Chicken Management Rolecenter" = X,
        page "Chicken Type" = X,
        page "Egg Production Document" = X,
        page "Egg Production Line List" = X,
        page "Egg Production List" = X,
        page "Egg Production Subpage" = X,
        page "Egg Types" = X;
}