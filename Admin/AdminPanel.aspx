<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="SLIITWeb.Admin.AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <h1>Step 1</h1>
    <i class="fa fa-cloud" style="font-size: 60px; color: lightblue; text-shadow: 2px 2px 4px #000000;"></i>
    <asp:Label runat="server" ID="step1" Visible="false" ForeColor="Red">

    </asp:Label>
    <br />

    <i class="fa fa-chevron-circle-down" style="font-size: 36px"></i>
    <br />
    <h1>Step 2</h1>
    <i class="fa fa-cloud" style="font-size: 60px; color: lightblue; text-shadow: 2px 2px 4px #000000;"></i>
    <asp:Label runat="server" ID="Label2" Visible="false" ForeColor="Red">

    </asp:Label>
    <br />
    <i class="fa fa-chevron-circle-down" style="font-size: 36px"></i>
    <br />
    <h1>Step 3</h1>
    <i class="fa fa-cloud" style="font-size: 60px; color: lightblue; text-shadow: 2px 2px 4px #000000;"></i>
    <asp:Label runat="server" ID="Label3" Visible="false" ForeColor="Red">

    </asp:Label>
    <br />
    <i class="fa fa-chevron-circle-down" style="font-size: 36px"></i>
    <br />
    <h1>Step 4</h1>
    <i class="fa fa-cloud" style="font-size: 60px; color: lightblue; text-shadow: 2px 2px 4px #000000;"></i>
    <asp:Label runat="server" ID="Label4" Visible="false" ForeColor="Red">

    </asp:Label>
    <script>
        window.onload = function () {

            var dps = []; // dataPoints
            var chart = new CanvasJS.Chart("chartContainer", {
                title: {
                    text: "System Health"
                },
                axisY: {
                    includeZero: false
                },
                data: [{
                    type: "line",
                    dataPoints: dps
                }]
            });

            var xVal = 0;
            var yVal = 100;
            var updateInterval = 1000;
            var dataLength = 20; // number of dataPoints visible at any point

            var updateChart = function (count) {

                count = count || 1;

                for (var j = 0; j < count; j++) {
                    yVal = yVal + Math.round(5 + Math.random() * (-5 - 5));
                    dps.push({
                        x: xVal,
                        y: yVal
                    });
                    xVal++;
                }

                if (dps.length > dataLength) {
                    dps.shift();
                }

                chart.render();
            };

            updateChart(dataLength);
            setInterval(function () { updateChart() }, updateInterval);

        }
    </script>
    </head>
    <body>
        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </body>




</asp:Content>
