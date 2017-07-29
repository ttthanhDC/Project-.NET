<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S001_ListShiper.aspx.cs" Inherits="SYSGREEN.S001_ListShiper" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-1">
                    <input type="text" class="form-control" name="title" id="txt_reservation" placeholder="Mã reservation"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_Date" placeholder="Ngày" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_Distric" placeholder="Quận"/>
                </div>
                 <div class="col-md-1">
                    <input type="text" class="form-control" name="title" id="txt_ShipNumber"placeholder="Shiper number" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ShipName"placeholder="Shiper name" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_status"placeholder="Trạng thái" />
                </div>
                
            </div> 
        </div> 
        <div class="form-horizontal">
            <div class="form-group">
                 <label for="sel1" class="col-md-1"></label>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="btIn">In hóa đơn vận chuyển</button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btBeark">Tách bill</button>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                          <select class="form-control" id="cbShip">
                            
                          </select>
                        </div>
                </div>
                 <div class="col-md-2">
                    <div class="form-group">
                           <select class="form-control" id="userid"></select>
                        </div>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btChuyen">Assign </button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
            </div> 
        </div> 
        
    </div>
   <div style ="margin-left:20px;margin-right:20px">
       <table id="table" 
       
        ></table>
   </div> 
   
<script>
    // Bootstrap Table
    $(function () {
        // Load Data user
        var formDataUser = new FormData();
        formDataUser.append('type', 'getData');
        var json = { 'ID': 0 };
        formDataUser.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerSysUser.ashx",
            type: "POST",
            data: formDataUser,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.name = objectData.UserName;
                        obj.link = objectData.ID;
                        obj.sub = null;
                        arr.push(obj);
                    }
                }
                var data = { menu: arr };
                var $menu = $("#userid");
                $.each(data.menu, function () {
                    $menu.append(
                        getUser(this)
                    );
                });
            },
            error: function (err) {

            }
        });
        // select box user  
        var getUser = function (itemData) {
            var item = $("<option value='" + itemData.link + "'>")
                .append(itemData.name);
            return item;
        };
        // 
        // Load Data user
        var formDataShip = new FormData();
        formDataShip.append('type', 'getAllShiper');
        var json = { 'ID': 0 };
        formDataShip.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/Handler1Test.ashx",
            type: "POST",
            data: formDataShip,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.name = objectData.NAME;
                        obj.link = objectData.SHIPER_ID;
                        obj.sub = null;
                        arr.push(obj);
                    }
                }
                var data = { menu: arr };
                var $menu = $("#cbShip");
                $.each(data.menu, function () {
                    $menu.append(
                        getShip(this)
                    );
                });
            },
            error: function (err) {

            }
        });
        // select box shiper  
        var getShip = function (itemData) {
            var item = $("<option value='" + itemData.link + "'>")
                .append(itemData.name);
            return item;
        };
        // table


        // load data 
        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'getALLData');
        var json = { 'ID': 0 };
        formDataListUser.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/Handler1Test.ashx",
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
                        obj.id = objectData.ID_NHD;

                        obj.code = objectData.MaReservation;
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
                        obj.district = objectData.TenQuan || "";
                        obj.status = objectData.TrangThaiNHD || "";
                        obj.name = objectData.TenKH_HD || "";
                        obj.sdt = objectData.SoDienThoai || "";
                        obj.addres = objectData.DiaChi || "";
                        obj.money = objectData.Create_User || "";// chua có
                        obj.shipName = objectData.shipName || "";
                        obj.shipNumber = objectData.shipNo || "";
                        var TongTienConNo = objectData.TongTienConNo;
                        if (TongTienConNo) {
                            obj.detb = true;
                        } else {
                            obj.detb = false;
                        }

                        obj.user = objectData.userName || "";
                        // userName
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
    // tìm kiếm
    $('#btSearch').on('click', function (e) {
        var data1 = [];
        var formDatasearch = new FormData();
        formDatasearch.append('type', 'getDataFilter');

        var maReservation= $('#txt_reservation').val();
        var ngayHoaDon = $('#txt_Date').val();
        var quan = $('#txt_Distric').val();
        var soShiper = $('#txt_ShipNumber').val();
        var tenShiper = $('#txt_ShipName').val();
        var trangThai = $('#txt_status').val();

        formDatasearch.append('maReservation', maReservation);
        formDatasearch.append('ngayHoaDon', ngayHoaDon);
        formDatasearch.append('quan', quan);
        formDatasearch.append('soShiper', soShiper);
        formDatasearch.append('tenShiper',tenShiper);
        formDatasearch.append('trangThai', trangThai);
        $.ajax({
            url: "Configuation/Handler1Test.ashx",
            type: "POST",
            data: formDatasearch,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.id = objectData.ID_NHD;

                        obj.code = objectData.MaReservation || "";
                        var data_ngay = objectData.Ngay ;
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
                        obj.district = objectData.TenQuan || "";
                        obj.status = objectData.TrangThaiNHD || "";
                        obj.name = objectData.TenKH_HD || "";
                        obj.sdt = objectData.SoDienThoai || "";
                        obj.addres = objectData.DiaChi || "";
                        obj.money = objectData.Create_User;// chua có
                        obj.shipName = objectData.shipName || "";
                        obj.shipNumber = objectData.shipNo || "";
                        var TongTienConNo = objectData.TongTienConNo;
                        if (TongTienConNo) {
                            obj.detb = true;
                        } else {
                            obj.detb = false;
                        }
                       
                        obj.user = objectData.userName || "";
                        // userName
                        arr.push(obj);
                    }
                }
                data1 = arr;
                //getDataTable(data1);
                var $table = $('#table');
                $table.bootstrapTable('load', data1);
            },
            error: function (err) {
            }
        });
    });

    // btAssign button
    $('#btChuyen').on('click', function (e) {
        var formDataAssign = new FormData();
        formDataAssign.append('type', 'assignHoaDonToShiper');
        var datatable = $('#table').bootstrapTable('getData');
        alert("Dât: " + datatable);
        var shiper = $('#cbShip').val();
        var user = $('#userid').val();
        var listNgayHoaDon = [30, 31, 32, 33];
        var json = {
            'shiper': shiper,
            'user': user,
            'listNgayHoaDon': listNgayHoaDon,
        };
        formDataAssign.append('data', JSON.stringify(json));

        $.ajax({
            url: "Configuation/Handler1Test.ashx",
            type: "POST",
            data: formDataAssign,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    alert("Assign thành công");
                }
            },
            error: function (err) {
            }
        });
    });
    // getdata table 
    var getDataTable = function (itemData) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'check',
                title: 'Tích',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value) {
                        return '<input type="checkbox" value="" checked></label>';
                    } else {
                        return '<input type="checkbox" value=""></label>';
                    }
                }
            }, {
                field: 'code',
                title: 'Mã Reservation',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<label style = "color: blue;">' + value + '</label>';
                }
            }, {
                field: 'date',
                title: 'Ngày',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'district',
                title: 'Quận',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'status',
                title: 'Trạng thái',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'name',
                title: 'Họ tên',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'sdt',
                title: 'SĐT',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'addres',
                title: 'Địa chỉ',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'shipName',
                title: 'Ship Name',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'shipNumber',
                title: 'ShipNo',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'user',
                title: 'User',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'money',
                title: 'Tiền',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }],

            data: itemData
        });
    };
    // function
    
</script>
    </asp:Content>

