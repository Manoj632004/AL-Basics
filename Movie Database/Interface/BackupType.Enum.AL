enum 50331 "Backup Type" implements Backup
{
    Extensible = true;

    value(0; CSV)
    {
        Implementation = Backup = "Backup CSV";
    }
    value(1; XLSX)
    {
        Implementation = Backup = "Backup Excel";
    }
    value(2; JSON)
    {
        Implementation = Backup = "Backup Json";
    }
    value(3; XML)
    {
        Implementation = Backup = "Backup XML";
    }
}