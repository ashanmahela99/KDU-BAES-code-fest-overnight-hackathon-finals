<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CSVPage.aspx.cs" Inherits="SLIITWeb.About" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="w3-container">
        <br />
        <br />
        <br />
        <br />
        <table class="w3-table-all w3-hoverable">
            <tr>
                <td>Select File       
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" CssClass="w3-button w3-hover-black" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:GridView runat="server" ID="CSVDatah" AutoGenerateColumns="false" CssClass="w3-table-all w3-hoverable">
            <Columns>
                <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" />
                <asp:BoundField DataField="Line_Manager" HeaderText="Line Manager" />
                <asp:BoundField DataField="Shift" HeaderText="Shift" />
                <asp:BoundField DataField="StepID" HeaderText="Step ID" />
            </Columns>
        </asp:GridView>
        <asp:Button runat="server" ID="PrintRpt" OnClick="PrintRpt_Click" Text="Print" CssClass="w3-btn w3-block w3-black" />

    </div>
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
</asp:Content>
