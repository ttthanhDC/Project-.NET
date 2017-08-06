<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S001_ListShiper.aspx.cs" Inherits="SYSGREEN.S001_ListShiper" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px" id ="div_LoTrinh">
         <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ngayTT" placeholder="Ngày"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_IDLoTinh" placeholder="ID lộ trình" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_shipNameTT" placeholder="Ship name"/>
                </div>
                 <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ShipNumberTT"placeholder="Shiper number" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ttLoTrinh"placeholder="Trạng thái Lộ trình" />
                </div>
                  <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="btTKLoTrinh">Tìm kiếm lộ trình</button>
                </div>
                
            </div> 
        </div> 
    </div>
    <div style ="margin-left:20px;margin-right:20px" id ="div_TableLoTrinh">
          <table id="tableLoTrinh" 
       
        ></table>
    </div>
    <div style="height:20px"></div>
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px" id ="div_TaoLoTrinh">
        <div class="form-horizontal">
            <div class="form-group">
                <label for="sel1" class="col-md-5"></label>
                  <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="btTaoLoTrinh">Tạo lộ trình</button>
                </div>
                 
            </div> 
        </div> 
    </div>
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px;display : none" id ="div_sanPham">
        <hr />
          <div class="form-horizontal">
            <div class="form-group">
                 <label for="sel1" class="col-md-2"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_reservation" placeholder="Mã đơn"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_Date" placeholder="Ngày" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_Distric" placeholder="Quận"/>
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_status"placeholder="Trạng thái" />
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
            </div> 
        </div> 
        <div class="form-horizontal">
            <div class="form-group">
                 <label for="sel1" class="col-md-2"></label>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="btIn">In hóa đơn vận chuyển</button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btInLoTrinh">In lộ trình</button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btGopDon">Gộp đơn </button>
                </div>
                  <label for="sel1" class="col-md-2"></label>
                <div class="col-md-2">
                    <div class="form-group">
                          <select class="form-control" id="cbShip">
                          </select>
                        </div>
                </div>
                
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btChuyen">Lưu </button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSua">Sửa</button>
                </div>
            </div> 
        </div> 
        
    </div>
   <div style ="margin-left:20px;margin-right:20px" id="Div_tableSanPham">
       <table id="table" 
       
        ></table>
   </div> 
   
<script>
    // Bootstrap Table
    $(function () {
        
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
                        obj.check = false;

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
    // search all
    var SearchAllDataTable = function () { 
        var dataSearch = [];
        var formDataSearchAll = new FormData();
        formDataSearchAll.append('type', 'getALLData');
        var json = { 'ID': 0 };
        formDataSearchAll.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/Handler1Test.ashx",
            type: "POST",
            data: formDataSearchAll,
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
                        obj.check = false;

                        obj.user = objectData.userName || "";
                        // userName
                        arr.push(obj);
                    }
                }
                dataSearch = arr;
               // getDataTable(dataSearch);
                var $tableSearch = $('#table');
                $tableSearch.bootstrapTable('load', dataSearch);
            },
            error: function (err) {
            }
        });
    };
    // btTKLoTrinh
    $('#btTKLoTrinh').on('click', function (e) {
        
      //  $('#div_TableLoTrinh')[0].style.display = "block";
        var itemData = [
            {
                codeLT: '20082017-AM',
                shipName: 'Trần ngọc duy',
                shipNo: 'Ship 001',
                date: '20/08/2017',
                user: 'Duytn4',
                status: 3,
            }, {
                codeLT: '21082017-AM',
                shipName: 'Trần ngọc duy',
                shipNo: 'Ship 001',
                date: '20/08/2017',
                user: 'Duytn4',
                status: 2,
            }, {
                codeLT: '22082017-AM',
                shipName: 'Trần ngọc duy',
                shipNo: 'Ship 001',
                date: '20/08/2017',
                user: 'Duytn4',
                status: 1,
            }, {
                codeLT: '23082017-AM',
                shipName: 'Trần ngọc duy',
                shipNo: 'Ship 001',
                date: '20/08/2017',
                user: 'Duytn4',
                status: 3,
            }, {
                codeLT: '24082017-AM',
                shipName: 'Trần ngọc duy',
                shipNo: 'Ship 001',
                date: '20/08/2017',
                user: 'Duytn4',
                status: 2,
            }
        ];
        getDataTableLoTrinh(itemData);
        
    });
    $('#btTaoLoTrinh').on('click', function (e) {
        $('#div_sanPham')[0].style.display = "block";
        //$('#Div_tableSanPham')[0].style.display = "block";
        
    });
    //// tìm kiếm 
    $('#btSearch').on('click', function (e) {
        var data1 = [];
        var formDatasearch = new FormData();
        formDatasearch.append('type', 'getDataFilter');

        var maReservation= $('#txt_reservation').val();
        var ngayHoaDon = $('#txt_Date').val();
        var quan = $('#txt_Distric').val();
       // var soShiper = $('#txt_ShipNumber').val();
       // var tenShiper = $('#txt_ShipName').val();
        var trangThai = $('#txt_status').val();

        formDatasearch.append('maReservation', maReservation);
        formDatasearch.append('ngayHoaDon', ngayHoaDon);
        formDatasearch.append('quan', quan);
        formDatasearch.append('soShiper', "");
        formDatasearch.append('tenShiper',"");
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
                        obj.check = false;
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
        var listNgayHoaDon = [];
        if (datatable) {
            for (var i = 0; i < datatable.length; i++) {
                if (datatable[i].check && datatable[i].id) {
                    listNgayHoaDon.push(datatable[i].id);
                }
            }
        }
        //alert(listNgayHoaDon);
        var shiper = $('#cbShip').val();
        var user = $('#userid').val();
       
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
                    SearchAllDataTable();
                    alert("Assign thành công");
                }
            },
            error: function (err) {
            }
        });
    });
    // getdata table lộ trình
    var getDataTableLoTrinh = function (itemData) {
        $('#tableLoTrinh').bootstrapTable({
            columns: [{
                field: 'codeLT',
                title: 'Mã lộ trình',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<label style = "color: blue;">' + value + '</label>';
                }
            }, {
                field: 'shipName',
                title: 'Ship Name',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'shipNo',
                title: 'Ship Number',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'date',
                title: 'Ngày tạo lộ trình',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'user',
                title: 'User tạo lộ trình',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'status',
                title: 'Trạng thái',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value === 1) {
                        return '<select class="select1" id="Bill' + index + '"> <option value = 0></option><option value = 1 selected = true>Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option></select>'
                    } else if (value === 2) {
                        return '<select class="select1" id="Bill' + index + '"> <option value = 0></option><option value = 1>Chưa xử lý</option><option value = 2  selected = true>Đang xử lý</option><option value = 3>Hoàn thành</option></select>'
                    } else if (value === 3) {
                        return '<select class="select1" id="Bill' + index + '"> <option value = 0></option><option value = 1>Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3  selected = true>Hoàn thành</option></select>'
                    } else {
                        return '<select class="select1" id="Bill' + index + '"> <option value = 0  selected = true></option><option value = 1>Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option></select>'
                    }
                }
            }],

            data: itemData
        });
    };
    // getdata table san phẩm
    var getDataTable = function (itemData) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'check',
                title: 'Tích',
                align: 'center',
                valign: 'middle',
                checkbox : true
            }, {
                field: 'code',
                title: 'Mã đơn',
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

