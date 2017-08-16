<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S004_ReportedOver.aspx.cs" Inherits="SYSGREEN.S004_ReportedOver" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
     <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-7"></label>
                
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ChotCa" placeholder= "Ngày Chốt ca" />
                </div>
                 
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
                 <div class="col-md-1">
                    <div id ="Div_ChotCa"><button type="button" class="btn btn-primary" id="btChot">Chốt Ca</button></div>
                </div>
               
            </div> 
        </div> 
        </div>
    <div style ="margin-left:10px;margin-right:10px;">
         <table id="table"></table>
    </div>
      
    <script>
        $(function () {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getvBaoCao05');
            var json = { 'ID': 0 };
            formDataListUser.append('data', JSON.stringify(json));
            formDataListUser.append('denNgay', "");
            formDataListUser.append('shipperName',"");

            var d = new Date();
            var strDate = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
            formDataListUser.append('tuNgay', strDate);

            $.ajax({
                url: "Configuation/HandlerBaoCao.ashx",
                type: "POST",
                data: formDataListUser,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    var textDi = 0;
                    var textNhan = 0;
                    var textTraVe = 0;
                    var duKienThu = 0;

                    if (jsonData && jsonData.length > 0) {
                        for (var i = 0; i < jsonData.length ; i++) {
                            var objectData = jsonData[i];
                            var obj = {};
                            obj.id = objectData.MaLoTrinhId;
                            obj.maCD = objectData.MaChuyenDi;
                            obj.checkTong = false;
                            // obj.isShiper = true;
                            if (objectData.MaShipper) {
                                if (parseInt(objectData.MaShipper) < 10) {
                                    obj.shipmunber = "S00" + objectData.MaShipper;
                                } else {
                                    obj.shipmunber = "S0" + objectData.MaShipper;
                                }
                            } else {
                                obj.shipmunber = "";
                            }

                            obj.name = objectData.HoTen;
                            obj.take = objectData.Nhan;
                            textNhan = textNhan + objectData.Nhan;
                            obj.go = objectData.Di;
                            textDi = textDi + objectData.Di;
                            obj._return = objectData.Trave;
                            textTraVe = textTraVe + objectData.Trave;
                            obj.noney = (objectData.DuKienThu + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            duKienThu = duKienThu + objectData.DuKienThu; 
                            arr.push(obj);
                        }
                    }
                    var obj1 = {};
                    obj1.checkTong = true;
                    obj1.id = "Tổng";
                    obj1.shipmunber = "";
                    obj1.name = "";
                    obj1.take = textNhan;
                    obj1.go = textDi;
                    obj1._return = textTraVe;
                    obj1.noney = (duKienThu + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    arr.push(obj1);
                    window.TongTien = duKienThu;
                    data = arr;
                    getDataTable(data);
                },
                error: function (err) {

                }
            });

        });
        $('#txt_ChotCa').on('change', function () {
            var d = new Date();
            var strDate = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
            var text = $('#txt_ChotCa').val();
            var x = text.split("/");
            var y = parseInt(x[1]);
            var z = x[0] + "/" + y + "/" + x[2];
            if (z !== strDate) {
                $('#Div_ChotCa')[0].style.display = "none";
            } else {
                $('#Div_ChotCa')[0].style.display = "block";
            }
            
        });
        var getDataTable = function (itemData) {
            $('#table').bootstrapTable({
                columns: [{
                    field: 'id',
                    title: 'Mã chuyến đi',
                    align: 'center',
                    valign: 'middle',
                    //events: reservationEvents,
                    //formatter: reservationFormatter
                    formatter: function (value, row, index) {
                        if (row.checkTong) {
                            return '<label style = "color: red;">' + value + '</label>';
                        } else {
                            return value;
                        }
                    }
                }, {
                    field: 'shipmunber',
                    title: 'Mã shiper',
                    align: 'center',
                    valign: 'middle',
                    
                }, {
                    field: 'name',
                    title: 'Họ tên',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'take',
                    title: 'Nhận',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        if (row.checkTong) {
                            return '<label style = "color: red;">' + value + '</label>';
                        } else {
                            return value;
                        }
                    }
                }, {
                    field: 'go',
                    title: 'Đi',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        if (row.checkTong) {
                            return '<label style = "color: red;">' + value + '</label>';
                        } else {
                            return value;
                        }
                    }
                }, {
                    field: '_return',
                    title: 'Trả về',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        if (row.checkTong) {
                            return '<label style = "color: red;">' + value + '</label>';
                        } else {
                            return value;
                        }
                    }
                }, {
                    field: 'noney',
                    title: 'Số tiền thu được',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        if (row.checkTong) {
                            return '<label style = "color: red;">' + value + '</label>';
                        } else {
                            return value;
                        }
                    }
                }],
                data: itemData
            });
        };
        $('#btSearch').on('click', function (e) {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getvBaoCao05');
            var json = { 'ID': 0 };
            formDataListUser.append('data', JSON.stringify(json));
            formDataListUser.append('tuNgay', $('#txt_ChotCa').val());
            formDataListUser.append('denNgay', "");
            formDataListUser.append('shipperName', "");

            $.ajax({
                url: "Configuation/HandlerBaoCao.ashx",
                type: "POST",
                data: formDataListUser,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    var textDi = 0;
                    var textNhan = 0;
                    var textTraVe = 0;
                    var duKienThu = 0;

                    if (jsonData && jsonData.length > 0) {
                        for (var i = 0; i < jsonData.length ; i++) {
                            var objectData = jsonData[i];
                            var obj = {};
                            obj.id = objectData.MaLoTrinhId;
                            obj.maCD = objectData.MaChuyenDi;
                            obj.checkTong = false;
                            // obj.isShiper = true;
                            if (objectData.MaShipper) {
                                if (parseInt(objectData.MaShipper) < 10) {
                                    obj.shipmunber = "S00" + objectData.MaShipper;
                                } else {
                                    obj.shipmunber = "S0" + objectData.MaShipper;
                                }
                            } else {
                                obj.shipmunber = "";
                            }

                            obj.name = objectData.HoTen;
                            obj.take = objectData.Nhan;
                            textNhan = textNhan + objectData.Nhan;
                            obj.go = objectData.Di;
                            textDi = textDi + objectData.Di;
                            obj._return = objectData.Trave;
                            textTraVe = textTraVe + objectData.Trave;
                            obj.noney = (objectData.DuKienThu + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            duKienThu = duKienThu + objectData.DuKienThu;
                            arr.push(obj);
                        }
                    }
                    var obj1 = {};
                    obj1.checkTong = true;
                    obj1.id = "Tổng";
                    obj1.shipmunber = "";
                    obj1.name = "";
                    obj1.take = textNhan;
                    obj1.go = textDi;
                    obj1._return = textTraVe;
                    obj1.noney = (duKienThu + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    arr.push(obj1);
                    data = arr;
                    window.TongTien = duKienThu;
                    var $table = $('#table');
                    $table.bootstrapTable('load', data);
                },
                error: function (err) {

                }
            });
        });
        $('#btChot').on('click', function (e) {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'InsertChotCaReturnId');
            var json = { 'ID': 0 };
            formDataListUser.append('data', JSON.stringify(json));
            formDataListUser.append('TienThuDuoc', window.TongTien);

            $.ajax({
                url: "Configuation/HandlerChotCa.ashx",
                type: "POST",
                data: formDataListUser,
                contentType: false,
                processData: false,
                success: function (result) {
                    alert(result);
                },
                error: function (err) {

                }
            });
        });
        // function
        function userFormatter(data) {
            return data.length;
        }
        function reservationFormatter(value, row, index) {
            return [
                '<a class="edit" href="javascript:void(0)" title="mã rỉevation">',
                '' + row.maCD + '',
                '</a>  ',
            ].join('');
        }

        window.reservationEvents = {
            'click .edit': function (e, value, row, index) {
                //window.location = '/UserManger.aspx?paramId=' + row.id;
                alert('Sự kiện chuyển màn hình');
            },
            'click .remove': function (e, value, row, index) {
                $('#table').bootstrapTable('remove', {
                    field: 'id',
                    values: [row.id]
                });
            }
        };

    </script>
    
    </asp:Content>


