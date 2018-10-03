<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="testRepeat.aspx.cs" Inherits="SLIITWeb.testRepeat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <asp:Timer runat="server" ID="UP_Timer" Interval="1000"  />
        <asp:UpdatePanel runat="server" ID="Game_UpdatePanel">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="UP_Timer"  EventName="Tick" />
            </Triggers>
            <ContentTemplate>
                <asp:Repeater runat="server" ID="BoardGameRepeater" DataSourceID="SqlDataSource1" >
                    <HeaderTemplate>
                        <table border="1">
                            <tr>
                                <th>Id</th>
                                <th>Count</th>
                                <th>Okay</th>
                                <th>Date</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#:Eval("Id") %></td>
                            <td><%#:Eval("Count") %></td>
                            <td><%#: Eval("Okay") %></td>
                            <td><%#: Eval("Date") %></td>
                           
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate></table></FooterTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Count], [Date], [Okay], [Id] FROM [Productions]"></asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>






</asp:Content>
