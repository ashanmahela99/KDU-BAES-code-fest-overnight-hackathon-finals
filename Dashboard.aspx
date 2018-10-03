<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SLIITWeb.Contact" %>


<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
    <p style="font-size: xx-large">
        Dashboard
    </p>
    <br />
    <br />
    <div style="height: 251px; align-content: center" id="1">
        <div id="chartContainer3" style="height: 370px; width: 100%;"></div>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script src="Scripts/chartContainer3js.js"></script>
    </div>
    <div class="w3-container">
        <br />
        <br />
        <br />
        <br />
        <p style="font-size: xx-large">
            Deffective Items
        </p>
        <asp:GridView runat="server" ID="gridCount" AutoGenerateColumns="false" CssClass="w3-table-all w3-hoverable">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Step ID" />
                <asp:BoundField DataField="Count" HeaderText="Count" />
                <asp:BoundField DataField="Okay" HeaderText="Deffective Items" ItemStyle-ForeColor="Red" />
                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:d}" />
            </Columns>

        </asp:GridView>

        <br />
        <br />
        <br />
        <br />

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
        <a href="Dash.aspx" id="about">Step 2</a>
        <a href="Dash2.aspx" id="blog">Step 3</a>
        <a href="Dash3.aspx" id="projects">Step 4</a>
        <a href="Employee_Details.aspx" id="contact">Employee Performance</a>
    </div>
</asp:Content>

