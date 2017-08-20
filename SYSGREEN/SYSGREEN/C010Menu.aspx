﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="C010Menu.aspx.cs" Inherits="SYSGREEN.Page.CauHinh.C010Menu" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <script src="Scripts/Validator/bootstrap-select.js"></script>

    <div class="main-content-inner" style ="margin-right:20px;margin-left:20px">
        
    </div>
    <div style ="margin-right:20px;margin-left:20px;margin-top:20px">
      
        
    <table id="table"></table>
   </div>
<script>
    // Bootstrap Table
    $(function () {
        var data = [];
        loadDataTable()
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) {
                    return pair[1];
                }
            }
        }


    });



    var loadDataTable = function (data) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'stt',
                title: 'STT',
                align: 'center',
                valign: 'middle',
                //sortable: true,
                ///editable: true,
            }, {
                field: 'thu',
                title: 'Thứ',
                align: 'center',
                valign: 'middle',
                // sortable: true,
                // editable: true,

            },
               {
                   field: 'operate',
                   title: 'Thao tác',
                   align: 'center',
                   valign: 'middle',
                   events: window.operateEvents = {
                       'click .right': function (e, value, row, index) {
                           window.location = '/C010_ConfigMenu.aspx?id=' + row.thuID;
                       }
                   },
                   formatter: operateFormatter
               }],
            data: [
                   { 'stt': 1, 'thu': 'Thứ Hai', 'thuID': 1 },
                   { 'stt': 2, 'thu': 'Thứ Ba', 'thuID': 2 },
                   { 'stt': 3, 'thu': 'Thứ Tư', 'thuID': 3 },
                   { 'stt': 4, 'thu': 'Thứ Năm', 'thuID': 4 },
                   { 'stt': 5, 'thu': 'Thứ Sáu', 'thuID': 5 },
                   { 'stt': 6, 'thu': 'Thứ Bảy', 'thuID': 6 },
            ]
        });
    };
    function userFormatter(data) {
        return data.length;
    }
    function operateFormatter(value, row, index) {
        return [
                   '<a class="right" href="javascript:void(0)" title="Sửa">',
                   '<i class="glyphicon glyphicon-pencil"></i>',
                   '</a>'
        ].join('');
    }

    window.operateEvents = {
        'click .right': function (e, value, row, index) {
            window.location = '/C002_GroupUser.aspx?id=' + row.id;
        },
        'click .remove': function (e, value, row, index) {
        }
    };

</script>
    </asp:Content>
