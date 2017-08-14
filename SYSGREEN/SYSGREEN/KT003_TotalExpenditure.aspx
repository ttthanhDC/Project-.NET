﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KT003_TotalExpenditure.aspx.cs" Inherits="SYSGREEN.KT003_TotalExpenditure" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">

    <div style ="margin-left:20px;margin-right:20px">
        <button type="button" class="btn btn-primary" id="btAdd">Thêm mới</button>
        <table id="table"
             data-search="true" 
            ></table>
    </div>
   
<script>
    // Bootstrap Table
    $(function () {
        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'viewManHinhChi');
        var json = { 'ID': 0 };
        formDataListUser.append('data', JSON.stringify(json));
        formDataListUser.append('Ngay', "");
        $.ajax({
            url: "Configuation/HandlerKeToan.ashx",
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
                        obj.permission = true;
                        obj.money = objectData.SoTien;
                        obj.accountFor = objectData.MaNganHang;
                        /*if(objectData.MaNganHang === 1){
                            obj.accountFor = "VCB";
                        }else if(objectData.MaNganHang === 2){
                            obj.accountFor = "BIDV";
                        }
                        else if(objectData.MaNganHang === 3){
                            obj.accountFor = "TCB";
                        }
                        else if(objectData.MaNganHang === 4){
                            obj.accountFor = "VP";
                        }else if(objectData.MaNganHang === 5){
                            obj.accountFor = "VPDN";
                        }else if(objectData.MaNganHang === 6){
                            obj.accountFor = "Tiền mặt";
                        }else {
                            obj.accountFor = "";
                        }*/
                        obj.accountFor = objectData.MaNganHang;
                        obj.note = objectData.GhiChu;
                        var data_ngay = objectData.Ngay;
                        var z = "";
                        if (data_ngay) {
                            var x = data_ngay.substr(0, 10);
                            var y = x.split("-");
                            var y1 = y[0];
                            var y2 = y[1];
                            var y3 = y[2];
                            z = y3 + "/" + y2 + "/" + y1;
                        }
                        obj.date = z;
                        obj.spentFor = objectData.NoiDungChi;
                        arr.push(obj);
                    }
                }
                data = arr;
                getDataTable(data);
            },
            error: function (err) {

            }
        });
    });
    var loadAllDataTable = function () {
        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'viewManHinhChi');
        var json = { 'ID': 0 };
        formDataListUser.append('data', JSON.stringify(json));
        formDataListUser.append('Ngay', "");
        $.ajax({
            url: "Configuation/HandlerKeToan.ashx",
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
                        obj.permission = true;
                        obj.money = objectData.SoTien;
                        obj.accountFor = objectData.MaNganHang;
                        /*if(objectData.MaNganHang === 1){
                            obj.accountFor = "VCB";
                        }else if(objectData.MaNganHang === 2){
                            obj.accountFor = "BIDV";
                        }
                        else if(objectData.MaNganHang === 3){
                            obj.accountFor = "TCB";
                        }
                        else if(objectData.MaNganHang === 4){
                            obj.accountFor = "VP";
                        }else if(objectData.MaNganHang === 5){
                            obj.accountFor = "VPDN";
                        }else if(objectData.MaNganHang === 6){
                            obj.accountFor = "Tiền mặt";
                        }else {
                            obj.accountFor = "";
                        }*/
                        obj.accountFor = objectData.MaNganHang;
                        obj.note = objectData.GhiChu;
                        var data_ngay = objectData.Ngay;
                        var z = "";
                        if (data_ngay) {
                            var x = data_ngay.substr(0, 10);
                            var y = x.split("-");
                            var y1 = y[0];
                            var y2 = y[1];
                            var y3 = y[2];
                            z = y3 + "/" + y2 + "/" + y1;
                        }
                        obj.date = z;
                        obj.spentFor = objectData.NoiDungChi;
                        arr.push(obj);
                    }
                }
                data = arr;
                var $table = $('#table');
                $table.bootstrapTable('load', data);
            },
            error: function (err) {

            }
        });
    };
    var getDataTable = function (itemData) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'date',
                title: 'Ngày',
                align: 'center',
                valign: 'middle',
                editable: true,
            }, {
                field: 'spentFor',
                title: 'Nọi dung chi',
                align: 'center',
                valign: 'middle',
                editable: true,
            }, {
                field: 'money',
                title: 'Số tiền',
                align: 'center',
                valign: 'middle',
                editable: true,
            }, {
                field: 'accountFor',
                title: 'Tài khoản chi',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value === 1) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 selected = true>VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 2) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2 selected = true>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 3) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3 selected = true>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 4) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4 selected = true>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 5) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4 >VP</option><option value = 5 selected = true>VPDN</option></select>'
                    } else {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0 selected = true></option> <option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    }
                }
            }, {
                field: 'note',
                title: 'Ghi chúc',
                align: 'center',
                valign: 'middle',
                editable: true,
            }, {
                field: 'operater',
                title: 'Ghi chúc',
                align: 'center',
                valign: 'middle',
                events: operateEvents,
                formatter: operateFormatter
            }],
            data: itemData
        });
    };
    $('#btAdd').on('click', function (e) {
        window.location = '/KT003_Detail.aspx?id=' + "Add";
    });
    // function
    function operateFormatter(value, row, index) {
        return [
            '<a class="edit" href="javascript:void(0)" title="Sửa">',
            'Sửa',
            '</a>  '
        ].join('');
    }

    window.operateEvents = {
        'click .edit': function (e, value, row, index) {
            var formDataSave = new FormData();
            formDataSave.append('type', 'InsertChiTietChiReturnId');
            var json = { 'ID': 0 };
            formDataSave.append('data', JSON.stringify(json));
            var date = "";
            if (row.date) {
                var y = row.date.split("/");
                var y1 = y[0];
                var y2 = y[1];
                var y3 = y[2];
                date = y2 + "/" + y1 + "/" + y3;
            }
            formDataSave.append('Ngay', date);
            formDataSave.append('NoiDungChi', row.spentFor);
            formDataSave.append('SoTien', row.money);
            //formDataSave.append('MaNganHang',row.accountFor);
            formDataSave.append('GhiChu',row.note);
            formDataSave.append('IdKeToan', row.id);
            var lst1 = $('#table select.select1 option:selected');
            formDataSave.append('MaNganHang', lst1[index].value);
            $.ajax({
                url: "Configuation/HandlerKeToan.ashx",
                type: "POST",
                data: formDataSave,
                contentType: false,
                processData: false,
                success: function (result) {
                    loadAllDataTable();
                    alert("Tạo thành công");
                },
                error: function (err) {
                }
            });
        }
    };
</script>
    </asp:Content>


