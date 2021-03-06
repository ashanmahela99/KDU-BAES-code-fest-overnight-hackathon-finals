﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SLIITWeb.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("#search").live("click", function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '<%=ResolveUrl("~/Services/Service.svc/GetCustomers") %>',
                data: '{"prefix": "' + $("#prefix").val() + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    $.each(customers, function () {
                        html += "<span>Name: " + this.Name + " Id: " + this.Id + "</span><br />";
                    });
                    $("#results").html(html == "" ? "No results" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="text" id="prefix" />
        <input id="search" type="button" value="Search" />
        <div id="results"></div>
    </form>
</body>
</html>
