<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dash2.aspx.cs" Inherits="SLIITWeb.dash2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="Scripts/chartContainer3js.js"></script>
    <script src="Scripts/chartContainer2js.js"></script>
    <script src="Scripts/chartContainer1js.js"></script>
    <script src="Scripts/chartContainerjs.js"></script>
    <script src="Scripts/canvasjs.min.js"></script>
    <link href="Content/SidebarHoover.css" rel="stylesheet" />
    <title></title>
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
    <script type="text/javascript">  
        function CallDataService() {
            var yvalue1 = document.getElementById(<%:("Complete_Ratio") %>).value;
            var yvalue2 = document.getElementById(<%:("Defective_Ratio") %>).value;
            var UserMessage = document.getElementById("TxtMessage").value;
            tempuri.org.IDataService.InsertData(UserName, UserEmail, UserMessage, ShowMessage, null, null);
        }

        function ShowMessage() {
            LblMessage.innerHTML = "Data Inserted Successfully";
        }
    </script>
</head>
<body>
    <h1>Dashboard
    </h1>
    <form id="form2" runat="server" style="align-content: space-between">
        <div>
            <div style="height: 251px; width: 1100px; align-content: center" id="1">
                <div id="chartContainer2" style="height: 370px; width: 100%;"></div>
            </div>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/WcfDataService.svc" />
            </Services>
        </asp:ScriptManager>
        <asp:Timer runat="server" ID="UP_Timer" Interval="1000" />
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
    </form>
    <div id="mySidenav" class="sidenav">
        <a href="Dashboard.aspx" id="about">Step 1</a>
        <a href="Dash.aspx" id="blog">Step 2</a>
        <a href="Dash3" id="projects">Step 4</a>
        <a href="Employee_Details.aspx" id="contact">Employee Performance</a>
    </div>
</body>
</html>
