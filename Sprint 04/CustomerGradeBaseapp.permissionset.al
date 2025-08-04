namespace Origin;

permissionset 50201 CustomerGradeBaseapp
{
    Assignable = true;
    Permissions = tabledata "SOL Grade" = RIMD,
        tabledata "SOL Grade History" = RIMD,
        tabledata "SOL Grade SetUp" = RIMD,
        table "SOL Grade" = X,
        table "SOL Grade History" = X,
        table "SOL Grade SetUp" = X,
        codeunit "SOL Grade Mngt." = X,
        page "SOL Grade" = X,
        page "SOL Grade Card" = X,
        page "SOL Grade History" = X,
        page "SOL Grade History FactBox" = X,
        page "SOL Grade Setup" = X;
}