codeunit 50184 "Threshold Setup Management"
{
    procedure RunThresholdSetup(var TresholdSetupNotification: Notification)
    var
        thresholdSetup: Page "Threshold Setup";
    begin
        thresholdSetup.Run()

        //or page.Run(50183);
    end;

    var
        myInt: Integer;
}