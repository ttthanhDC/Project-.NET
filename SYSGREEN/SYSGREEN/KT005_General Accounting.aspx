<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KT005_General Accounting.aspx.cs" Inherits="SYSGREEN.KT005_General_Accounting" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
<div style="width:100%;margin-left:20px;margin-right:20px;font-size: large;">Số dư kỳ trước</div>
<div style ="margin-left:20px;margin-right:20px">
        <table id="table" 
        ></table>
    </div>
    <div style ="height : 30px"></div>
    <div style="width:100%;margin-left:20px;margin-right:20px;font-size: large;">Số dư kỳ này</div>
    <div style ="margin-left:20px;margin-right:20px">
        <table id="table2" 
        ></table>
    </div>
  
   
<script>
    // Bootstrap Table
    $(function () {

        getTable1();
        getTable2();
       
    });
    var getTable1 = function (itemData) {
        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'viewKeToanTongHopKy');
        var json = { 'ID': 0 };
        formDataListUser.append('data', JSON.stringify(json));
        formDataListUser.append('flag', "0");
        $.ajax({
            url: "Configuation/HandlerKeToan.ashx",
            type: "POST",
            data: formDataListUser,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                var Num_SoTienThu = 0;
                var Num_SoTienChi = 0;
                var Num_SoTienLuuChuyenChi = 0;
                var Num_SoTienLuuChuyenThu = 0;
                var Num_SoDu = 0;
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.account = objectData.TaiKhoan;
                        if (objectData.SoTienThu) {
                            obj.moneyTo = parseInt(objectData.SoTienThu);
                            Num_SoTienThu = Num_SoTienThu + parseInt(objectData.SoTienThu);
                        }
                        if (objectData.SoTienChi) {
                            obj.moneyFor = parseInt(objectData.SoTienChi);
                            Num_SoTienChi = Num_SoTienChi + parseInt(objectData.SoTienChi);
                        }
                        if (objectData.SoTienLuuChuyenThu) {
                            obj.LCTo = parseInt(objectData.SoTienLuuChuyenThu);
                            Num_SoTienLuuChuyenThu = Num_SoTienLuuChuyenThu + parseInt(objectData.SoTienLuuChuyenThu);
                        }
                        if (objectData.SoTienLuuChuyenChi) {
                            obj.LCFor = parseInt(objectData.SoTienLuuChuyenChi);
                            Num_SoTienLuuChuyenChi = Num_SoTienLuuChuyenChi + parseInt(objectData.SoTienLuuChuyenChi);
                        }
                        if (objectData.SoTienThu && objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienThu) - parseInt(objectData.SoTienChi);
                            obj.surplus = x;
                            Num_SoDu = Num_SoDu + x;
                        } else if (objectData.SoTienThu && !objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienThu);
                            obj.surplus = x;
                            Num_SoDu = Num_SoDu + x;
                        } else if (!objectData.SoTienThu && objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienChi);
                            obj.surplus = x;
                            Num_SoDu = Num_SoDu + x;
                        } else {
                            var x = 0;
                            obj.surplus = x;
                            Num_SoDu = Num_SoDu + x;
                        }
                        arr.push(obj);
                    }
                }
                var obj1 = {};
                obj1.account = "Tổng";
                obj1.moneyTo = Num_SoTienThu;
                obj1.moneyFor = Num_SoTienChi;
                obj1.LCTo = Num_SoTienLuuChuyenThu;
                obj1.LCFor = Num_SoTienLuuChuyenChi;
                obj1.surplus = Num_SoDu;
                arr.push(obj1);
                data = arr;
                getDataTable1(data);
            },
            error: function (err) {

            }
        });
    };
    var getTable2 = function (itemData) {
        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'viewKeToanTongHopKy');
        var json = { 'ID': 0 };
        formDataListUser.append('data', JSON.stringify(json));
        formDataListUser.append('flag', "1");
        $.ajax({
            url: "Configuation/HandlerKeToan.ashx",
            type: "POST",
            data: formDataListUser,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                var Num_SoTienThu = 0;
                var Num_SoTienChi = 0;
                var Num_SoTienLuuChuyenChi = 0;
                var Num_SoTienLuuChuyenThu = 0;
                var Num_SoDu = 0;
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.account = objectData.TaiKhoan;
                        if (objectData.SoTienThu) {
                            obj.moneyTo = parseInt(objectData.SoTienThu);
                            Num_SoTienThu = Num_SoTienThu + parseInt(objectData.SoTienThu);
                        }
                        if(objectData.SoTienChi){
                            obj.moneyFor = parseInt(objectData.SoTienChi);
                            Num_SoTienChi = Num_SoTienChi + parseInt(objectData.SoTienChi);
                        }
                        if(objectData.SoTienLuuChuyenThu){
                            obj.LCTo = parseInt(objectData.SoTienLuuChuyenThu);
                            Num_SoTienLuuChuyenThu = Num_SoTienLuuChuyenThu + parseInt(objectData.SoTienLuuChuyenThu);
                        }
                        if(objectData.SoTienLuuChuyenChi){
                            obj.LCFor = parseInt(objectData.SoTienLuuChuyenChi);
                            Num_SoTienLuuChuyenChi = Num_SoTienLuuChuyenChi + parseInt(objectData.SoTienLuuChuyenChi);
                        }
                        if (objectData.SoTienThu && objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienThu) - parseInt(objectData.SoTienChi);
                            obj.surplus = x;
                            Num_SoDu = Num_SoDu + x;
                        } else if (objectData.SoTienThu && !objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienThu);
                            obj.surplus = x;
                            Num_SoDu = Num_SoDu + x;
                        } else if (!objectData.SoTienThu && objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienChi);
                            obj.surplus = x;
                            Num_SoDu = Num_SoDu + x;
                        } else {
                            var x = 0;
                            obj.surplus = x;
                            Num_SoDu = Num_SoDu + x;
                        }
                        arr.push(obj);
                    }
                }
                var obj1 = {};
                obj1.account = "Tổng";
                obj1.moneyTo = Num_SoTienThu;
                obj1.moneyFor = Num_SoTienChi;
                obj1.LCTo = Num_SoTienLuuChuyenThu;
                obj1.LCFor = Num_SoTienLuuChuyenChi;
                obj1.surplus = Num_SoDu;
                arr.push(obj1);
                data = arr;
                getDataTable2(data);
            },
            error: function (err) {

            }
        });
    };
    // function
    var getDataTable1 = function (itemData) {
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
                formatter: function (value, row, index) {
                    if (row.LCTo && row.LCFor) {
                        var x = parseInt(row.LCTo.replace(/,/g, '') + "");
                        var y = parseInt(row.LCFor.replace(/,/g, '') + "");
                        var z = x - y;
                        return z;
                    } else if (row.LCTo && !row.LCFor) {
                        return row.LCTo;
                    } else if (!row.LCTo && row.LCFor) {
                        return row.LCFor;
                    } else if (!row.LCTo && !row.LCFor) {
                        return "";
                    }
                }
            }],
            data : itemData
        });
    };
    var getDataTable2 = function (itemData) {
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
            data : itemData
        });
    };
</script>
    </asp:Content>


