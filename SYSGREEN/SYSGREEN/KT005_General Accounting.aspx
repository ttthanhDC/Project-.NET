<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KT005_General Accounting.aspx.cs" Inherits="SYSGREEN.KT005_General_Accounting" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">

<div style ="margin-left:20px;margin-right:20px">
        <table id="table" 
        ></table>
    </div>
    <div style ="height : 30px"></div>
    <div style ="margin-left:20px;margin-right:20px">
        <table id="table2" 
        ></table>
    </div>
  
   
<script>
    // Bootstrap Table
    $(function () {
        /*var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'getData');
        var json = { 'ID': 0 };
        formDataListUser.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerSysRole.ashx",
            type: "POST",
            data: formDataListUser,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.id = objectData.ID;
                        obj.name = objectData.RoleName;
                        obj.dateCreate = objectData.Create_Date;
                        obj.user = objectData.Create_User;
                        arr.push(obj);
                    }
                }
                data = arr;

                $('#table').bootstrapTable({
                    columns: [{
                        field: 'account',
                        title: 'Tài khoản',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        ///editable: true,
                    }, {
                        field: 'moneyTo',
                        title: 'Thu',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        // editable: true,

                    }, {
                        field: 'moneyFor',
                        title: 'Chi',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        //  editable: true,
                    }, {
                        field: 'LCTo',
                        title: 'Lưu chuyển thu',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,

                    }, {
                        field: 'LCFor',
                        title: 'Lưu chuyển chi',
                        align: 'center',
                        valign: 'middle',
                       // events: operateEvents,
                       // formatter: operateFormatter
                    }, {
                        field: 'surplus',
                        title: 'Số dư',
                        align: 'center',
                        valign: 'middle',
                        //events: operateEvents,
                        //formatter: operateFormatter
                    }],
                    data: data
                });
            },
            error: function (err) {

            }
        });*/
        // format table
        $('#table').bootstrapTable({
            columns: [{
                field: 'account',
                title: 'Tài khoản',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'moneyTo',
                title: 'Thu',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'moneyFor',
                title: 'Chi',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'LCTo',
                title: 'Lưu chuyển thu',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'LCFor',
                title: 'Lưu chuyển chi',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'surplus',
                title: 'Số dư',
                align: 'center',
                valign: 'middle',
            }],
            data: [{
                account: 'Két',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000',
            }, {
                account: 'Tiền mặt',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'CPDN',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'VP',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'TCB',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'VCB',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'BIDV',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'Tổng',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }],
        });
        $('#table2').bootstrapTable({
            columns: [{
                field: 'account',
                title: 'Tài khoản',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'moneyTo',
                title: 'Thu',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'moneyFor',
                title: 'Chi',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'LCTo',
                title: 'Lưu chuyển thu',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'LCFor',
                title: 'Lưu chuyển chi',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'surplus',
                title: 'Số dư',
                align: 'center',
                valign: 'middle',
            }],
            data: [{
                account: 'Két',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000',
            }, {
                account: 'Tiền mặt',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'CPDN',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'VP',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'TCB',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'VCB',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'BIDV',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }, {
                account: 'Tổng',
                moneyTo: '1,000,000',
                moneyFor: '2,000,000',
                LCTo: '20,000,000',
                LCFor: '12,000,000',
                surplus: '8,000,000'
            }],
        });
    });
    // function
</script>
    </asp:Content>


