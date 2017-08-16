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
        window.text1 = 0;
        window.text2 = 0;
        window.text3 = 0;
        window.text4 = 0;
        window.text5 = 0;
        window.text6 = 0;
        window.text7 = 0;
        window.text8 = 0;
        window.dataKT = [];
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
                            obj.moneyTo = (objectData.SoTienThu + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            Num_SoTienThu = Num_SoTienThu + parseInt(objectData.SoTienThu);
                        }
                        if (objectData.SoTienChi) {
                            obj.moneyFor = (objectData.SoTienChi + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            Num_SoTienChi = Num_SoTienChi + parseInt(objectData.SoTienChi);
                        }
                        if (objectData.SoTienLuuChuyenThu) {
                            obj.LCTo = (objectData.SoTienLuuChuyenThu + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            Num_SoTienLuuChuyenThu = Num_SoTienLuuChuyenThu + parseInt(objectData.SoTienLuuChuyenThu);
                        }
                        if (objectData.SoTienLuuChuyenChi) {
                            obj.LCFor = (objectData.SoTienLuuChuyenChi + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            Num_SoTienLuuChuyenChi = Num_SoTienLuuChuyenChi + parseInt(objectData.SoTienLuuChuyenChi);
                        }
                        if (objectData.SoTienThu && objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienThu) - parseInt(objectData.SoTienChi);
                            obj.surplus = (x + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");;
                            Num_SoDu = Num_SoDu + x;
                        } else if (objectData.SoTienThu && !objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienThu);
                            obj.surplus = (objectData.SoTienThu + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            Num_SoDu = Num_SoDu + x;
                        } else if (!objectData.SoTienThu && objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienChi);
                            obj.surplus = (objectData.SoTienChi+ "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
                obj1.moneyTo = (Num_SoTienThu+ "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                obj1.moneyFor = (Num_SoTienChi+ "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                obj1.LCTo = (Num_SoTienLuuChuyenThu+ "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                obj1.LCFor = (Num_SoTienLuuChuyenChi+ "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                obj1.surplus = (Num_SoDu+ "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                arr.push(obj1);
                data = arr;
                getDataTable1(data);
               
                for (j = 0 ; j < data.length; j++) {
                    window.dataKT.push(data[j].surplus);
                    /*if(j === 0){
                        window.text1 = data[j].surplus;
                        dataKT.push(window.text1);
                    } else if (j === 1) {
                        window.text2 = data[j].surplus;
                        dataKT.push(window.text2);
                    } else if (j === 2) {
                        window.text1 = data[j].surplus;
                        dataKT.push(window.text3);
                    } else if (j === 3) {
                        window.text3 = data[j].surplus;
                        dataKT.push(window.text4);
                    } else if (j === 4) {
                        window.text4 = data[j].surplus;
                        dataKT.push(window.text5);
                    } else if (j === 5) {
                        window.text5 = data[j].surplus;
                        dataKT.push(window.text6);
                    } else if (j === 6) {
                        window.text6 = data[j].surplus;
                        dataKT.push(window.text7);
                    } else if (j === 7) {
                        window.text7 = data[j].surplus;
                        dataKT.push(window.text8);
                    }*/
                }
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
                            obj.moneyTo = (parseInt(objectData.SoTienThu) + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            Num_SoTienThu = Num_SoTienThu + parseInt(objectData.SoTienThu);
                        }
                        if (objectData.SoTienChi) {
                            obj.moneyFor = (parseInt(objectData.SoTienChi) + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            Num_SoTienChi = Num_SoTienChi + parseInt(objectData.SoTienChi);
                        }
                        if (objectData.SoTienLuuChuyenThu) {
                            obj.LCTo = (parseInt(objectData.SoTienLuuChuyenThu) + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            Num_SoTienLuuChuyenThu = Num_SoTienLuuChuyenThu + parseInt(objectData.SoTienLuuChuyenThu);
                        }
                        if (objectData.SoTienLuuChuyenChi) {
                            obj.LCFor = (parseInt(objectData.SoTienLuuChuyenChi )+ "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            Num_SoTienLuuChuyenChi = Num_SoTienLuuChuyenChi + parseInt(objectData.SoTienLuuChuyenChi);
                        }
                        if (objectData.SoTienThu && objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienThu) - parseInt(objectData.SoTienChi);
                            obj.surplus = (x + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");;
                            Num_SoDu = Num_SoDu + x;
                        } else if (objectData.SoTienThu && !objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienThu);
                            obj.surplus = (parseInt(objectData.SoTienThu)+ "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            Num_SoDu = Num_SoDu + x;
                        } else if (!objectData.SoTienThu && objectData.SoTienChi) {
                            var x = parseInt(objectData.SoTienChi);
                            obj.surplus = (parseInt(objectData.SoTienChi) + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            Num_SoDu = Num_SoDu + x;
                        } else {
                            var x = 0;
                            obj.surplus = x;
                            Num_SoDu = Num_SoDu + x;
                        }
                        obj.surplus2 = 0;
                        obj.surplus3 = 0;
                        arr.push(obj);
                    }
                }
                var obj1 = {};
                obj1.account = "Tổng";
                obj1.moneyTo = (Num_SoTienThu + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                obj1.moneyFor = (Num_SoTienChi + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                obj1.LCTo = (Num_SoTienLuuChuyenThu + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                obj1.LCFor = (Num_SoTienLuuChuyenChi + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                obj1.surplus = (Num_SoDu + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                obj1.surplus2 = 0;
                obj1.surplus3 = 0;
                arr.push(obj1);
                data = arr;
                for (var j = 0 ; j < data.length;j ++){
                    for (var int = 0 ; int < window.dataKT.length; int++) {
                        if(j === int){
                            data[j].surplus2 = window.dataKT[int];
                        }

                    }
                }
                // tỏng số dư

                for (var k = 0 ; k < data.length; k++) {
                    var text1 = (data[k].surplus2 + "").replace(/,/g, '');
                    var text2 = (data[k].surplus + "").replace(/,/g, '');
                    data[k].surplus3 = ((parseInt(text1) + parseInt(text2))+ "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");;
                }
                
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
                field: 'surplus2',
                title: 'Số dư kỳ trước',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'surplus',
                title: 'Số dư kỳ này',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'surplus3',
                title: 'Tổng số dư',
                align: 'center',
                valign: 'middle',
            }],
            data : itemData
        });
    };
</script>
    </asp:Content>


