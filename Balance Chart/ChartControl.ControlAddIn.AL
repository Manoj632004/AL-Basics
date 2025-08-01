controladdin "Chart Control"
{
    RequestedHeight = 600;
    MinimumHeight = 400;
    MaximumHeight = 600;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 
        'https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js',
        'Js/chartbc.js';
    StartupScript = 'Js/start.js';
    
    event ControlReady();

    procedure drawChart(Chartlabels: JsonArray; ChartData: JsonArray);
    
}