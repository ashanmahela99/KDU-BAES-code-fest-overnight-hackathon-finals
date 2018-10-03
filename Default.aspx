<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SLIITWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
.button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #f4511e;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #f9722e}

.button:active {
  background-color: #f4511e;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
    <br />
    <br />
    <br />
    <br />
    <asp:button runat="server" ID="CSVbtn" CssClass="button" Text="Read CSV" OnClick="CSVbtn_Click"/>
     <br />
    <br />
    <br />
    <br />
    <asp:button runat="server" ID="DashBtn" CssClass="button" Text="Dashboard" OnClick="DashBtn_Click" />
   

</asp:Content>
