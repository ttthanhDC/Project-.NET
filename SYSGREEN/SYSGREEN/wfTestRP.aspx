<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="wfTestRP.aspx.cs" Inherits="SYSGREEN.wfTestRP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">

<%@ Import Namespace ="Syncfusion.MVC.EJ" %>
<%@ Import Namespace ="Syncfusion.JavaScript.Models" %>
<%@ Import Namespace ="Syncfusion.JavaScript" %>
<link href="Content/Sync/ejthemes/bootstrap.min.css" rel="stylesheet" />
<link href="Content/Sync/ejthemes/ej.widgets.core.min.css" rel="stylesheet" />
<link href="Content/Sync/ejthemes/default-theme/ej.widgets.all.min.css" rel="stylesheet" />
<link href="Content/Sync/default.css" rel="stylesheet" />
<link href="Content/Sync/reportdefault.css" rel="stylesheet" />

<script src="Scripts/Sync/jquery-1.11.3.min.js"></script>
<script src="Scripts/Sync/jquery.easing.1.3.min.js"></script>

<script src="Scripts/Sync/ej.web.all.min.js"></script>
<script src="Scripts/Sync/ej.unobtrusive.min.js"></script>

    <button type="button" class="btn btn-primary" id="btnAdd">Open Dialog</button>

    <div id="dialog" title="Dialog">
        <!--dialog content-->
        <p>This is a Dialog</p>
    </div>

    <div  style="height: 650px;width: 950px;min-height:404px;" id="viewer">

    </div>
    <script>
        $(function () {
            $("#btnAdd").ejButton({ click: "openDialog" });
            $("#dialog").ejDialog({ showOnInit: false });
            $("#viewer").ejReportViewer({
                reportServiceUrl: "/api/ReportApi",
                reportPath: '~/App_Data/GroupingAggregate.rdlc'
            });
        });
        function openDialog() {
            $("#dialog").ejDialog("open");
        }
    </script>
</asp:Content>
