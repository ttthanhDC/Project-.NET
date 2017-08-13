<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="wfTestRP.aspx.cs" Inherits="SYSGREEN.wfTestRP" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
     <!-- <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" /> -->
    <div id="chartContainer" style="height: 400px; width: 100%;"></div>
    <script>
        $(function () {
            loadContent();
            function loadContent() {
                var chart = new CanvasJS.Chart("chartContainer",
	            {
	                theme: "theme2",
	                title: {
	                    text: "Gaming Consoles Sold in 2012"
	                },
	                data: [
		            {
		                type: "pie",
		                showInLegend: true,
		                toolTipContent: "{y} - #percent %",
		                yValueFormatString: "#0.#,,. Million",
		                legendText: "{indexLabel}",
		                dataPoints: [
				            { y: 10, indexLabel: "PlayStation 3" },
				            { y: 10, indexLabel: "Wii" },
				            { y: 10, indexLabel: "Xbox 360" },
				            { y: 10, indexLabel: "Nintendo DS" },
				            { y: 10, indexLabel: "PSP" },
				            { y: 10, indexLabel: "Nintendo 3DS" },
				            { y: 40, indexLabel: "PS Vita" }
		                ]
		            }
	                ]
	            });
                chart.render();
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
