<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee_Details.aspx.cs" Inherits="SLIITWeb.Employee_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/SidebarHoover.css" rel="stylesheet" />
    <title>Step 1</title>
    <style>
        div {
            border: 1px solid gray;
            padding: 8px;
        }

        h1 {
            text-align: center;
            text-transform: uppercase;
            color: #33343d;
        }

        p {
            text-indent: 50px;
            text-align: justify;
            letter-spacing: 3px;
        }

        a {
            text-decoration: none;
            color: #008CBA;
        }
    </style>
    <br />
    <br />
    <br />
    <br />
    <div class="w3-container">
        <asp:DropDownList runat="server" ID="Step">
            <asp:ListItem Value="1">
                    Step 1
            </asp:ListItem>
            <asp:ListItem Value="2">
                    Step 2
            </asp:ListItem>
            <asp:ListItem Value="3">
                    Step 3
            </asp:ListItem>
            <asp:ListItem Value="4">
                    Step 4
            </asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox runat="server" ID="searchtxt" placeholder="Search By Shift.." name="search"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="searchtxt" CssClass="text-danger" ErrorMessage="The search field is required." />

        <asp:Button runat="server" ID="searchbtn" OnClick="searchbtn_Click" Text="Submit" CssClass="btn btn-default" />



        <asp:GridView runat="server" ID="gridCount" AutoGenerateColumns="false" CssClass="w3-table-all w3-hoverable">
            <Columns>
                <asp:BoundField DataField="Employee_Id" HeaderText="Employee ID" />
                <asp:BoundField DataField="Shift" HeaderText="Shift" />
                <asp:BoundField DataField="Line_Manager" HeaderText="Line Manager" ItemStyle-ForeColor="Red" />
                <asp:BoundField DataField="StepID" HeaderText="Step" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Okay" HeaderText="Deffective Items" ItemStyle-ForeColor="Red" />

            </Columns>
            <EmptyDataTemplate>
                <h3>Please Enter Shift and Step ID
                </h3>
            </EmptyDataTemplate>
        </asp:GridView>

        <br />
        <br />
        <br />
        <br />
        <asp:Chart ID="Chart1" runat="server">
            <Series>
                <asp:Series Name="Series1" ChartType="Spline" YValuesPerPoint="4"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <script>
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    title: {
                        text: "Employee Performance"
                    },
                    axisY: {
                        title: "Performance",
                        suffix: " Productivity"
                    },
                    data: [{
                        type: "column",
                        yValueFormatString: "#,### units",
                        indexLabel: "{y}",
                        dataPoints: [
                            { label: "Employess 1", y: 206 },
                            { label: "Employess 2", y: 163 },
                            { label: "Employess 3", y: 154 },
                            { label: "Employess 4", y: 176 },
                            { label: "Employess 5", y: 184 },
                            { label: "Employess 6", y: 122 }
                        ]
                    }]
                });

                function updateChart() {
                    var boilerColor, deltaY, yVal;
                    var dps = chart.options.data[0].dataPoints;
                    for (var i = 0; i < dps.length; i++) {
                        deltaY = Math.round(2 + Math.random() * (-2 - 2));
                        yVal = deltaY + dps[i].y > 0 ? dps[i].y + deltaY : 0;
                        boilerColor = yVal > 200 ? "#FF2500" : yVal >= 170 ? "#FF6000" : yVal < 170 ? "#6B8E23 " : null;
                        dps[i] = { label: "Employee " + (i + 1), y: yVal, color: boilerColor };
                    }
                    chart.options.data[0].dataPoints = dps;
                    chart.render();
                };
                updateChart();

                setInterval(function () { updateChart() }, 5000);

            }
        </script>
        </head>
        <body>
            <div id="chartContainer" style="height: 370px; width: 100;"></div>
            <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        </body>

    </div>
    <asp:Timer runat="server" ID="UP_Timer" Interval="8000" />
    <asp:UpdatePanel runat="server" ID="Data_UpdatePanel">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="UP_Timer" EventName="Tick" />
        </Triggers>
        <ContentTemplate>
            <asp:Repeater runat="server" ID="Data_Repeater_Complete" DataSourceID="SqlDataSource1"></asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Complete_Ratio]"></asp:SqlDataSource>
            <asp:Repeater runat="server" ID="Data_Repeater_Defect" DataSourceID="SqlDataSource2"></asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Defective_Ratio]"></asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>

    <a href="Dashboard.aspx" id="about">Step 1</a>
    <a href="Dash.aspx" id="blog">Step 2</a>
    <a href="Dash2.aspx" id="projects">Step 3</a>
    <a href="Dash3.aspx" id="contact">Step 4</a>
</asp:Content>
