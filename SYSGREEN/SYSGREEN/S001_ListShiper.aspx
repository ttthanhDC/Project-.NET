<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S001_ListShiper.aspx.cs" Inherits="SYSGREEN.S001_ListShiper" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner"  id ="div_sanPham">
          <div class="form-horizontal">
            <div class="form-group">
                 <label for="sel1" class="col-md-2"></label>
                 <div class="col-md-2">
                    <div class="form-group">
                          <select class="form-control" id="cbTime">
                              <option value ="1"> Ship đi</option>
                              <option value ="2"> Đến lấy</option>
                          </select>
                        </div>
                </div>
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
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
            </div> 
        </div> 
        <div class="form-horizontal">
            <div class="form-group">
                 <label for="sel1" class="col-md-1"></label>
                 <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btback2">Quay lại</button>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btIn1" runat="server" AutoPostBack="false" class="btn btn-primary" Text="In hóa đơn vận chuyển" OnClick="InHoaDon_click" />
                    <!--<button   class="btn btn-primary" id="btIn" runat="server" >In hóa đơn vận chuyển</button> -->
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btInLoTrinh">In lộ trình</button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btGopDon">Gộp đơn </button>
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_loTrinhID" readOnly = 'true'/>
                </div>
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
   <div style ="margin-left:20px;margin-right:20px;display:none" id="Div_tableSanPham">
       <table id="table"  ></table>
   </div> 
    <div style ="margin-left:20px;margin-right:20px" id="Div_tableTT">
       <table id="tableTT"  ></table>
   </div> 
    <div>
         <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
    </div>
   
   
<script>
    // Bootstrap Table
    $(function () {
        var dataTable = [];
        getDataTable(dataTable);


        window.idParam = getQueryVariable("paramId"); 
        window.MaLoTrinh = getQueryVariable("MaLoTrinh");
       
        //alert("Data" + window.idParam);
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
        $('#txt_loTrinhID').val(window.MaLoTrinh);

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
        formDataListUser.append('type', 'getALLDataByIdLoTrinh');
        //var json = { 'IdLotrinh': 0 };
        formDataListUser.append('IdLotrinh', window.idParam);
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
                        if (objectData.TongTienConNo) {
                            obj.money = objectData.TongTienConNo;
                        } else {
                            if (objectData.TongTien) {
                                obj.money = objectData.TongTien;
                            }
                        }
                       // obj.money = objectData.Create_User || "";// chua có
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
                getDataTableTT(data);
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
                        if (objectData.TongTienConNo) {
                            obj.money = objectData.TongTienConNo;
                        } else {
                            if (objectData.TongTien) {
                                obj.money = objectData.TongTien;
                            }
                        }
                        //obj.money = objectData.Create_User || "";// chua có
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

    //// tìm kiếm 
    $('#btback1').on('click', function (e) {
        window.location = '/S002_Route.aspx?paramId= 0';
    });
    $('#btback2').on('click', function (e) {
        window.location = '/S002_Route.aspx?paramId= 0';
    });
    $('#btSearch').on('click', function (e) {
        $('#Div_tableSanPham')[0].style.display = "block";
        $('#Div_tableTT')[0].style.display = "none";

        var data1 = [];
        var formDatasearch = new FormData();
        formDatasearch.append('type', 'getDataFilter');
        // thêm search theo hình thức ship
        var hinhThucShip = $('#cbTime').val();
        if ($('#cbTime').val() === "1" || $('#cbTime').val() === "") {
            hinhThucShip = "Ship đi";
        } else {
            hinhThucShip = "Đến lấy";
        }

        var maReservation= $('#txt_reservation').val();
        var ngayHoaDon = $('#txt_Date').val();
        var quan = $('#txt_Distric').val();
       // var soShiper = $('#txt_ShipNumber').val();
       // var tenShiper = $('#txt_ShipName').val();
        var trangThai = "";//$('#txt_status').val();

        formDatasearch.append('maReservation', maReservation);
        formDatasearch.append('ngayHoaDon', ngayHoaDon);
        formDatasearch.append('quan', quan);
        formDatasearch.append('soShiper', "");
        formDatasearch.append('tenShiper',"");
        formDatasearch.append('hinhThucShip', hinhThucShip);
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
                        if (objectData.TongTienConNo) {
                            obj.money = objectData.TongTienConNo;
                        } else {
                            if (objectData.TongTien) {
                                obj.money = objectData.TongTien;
                            }
                        }
                        //obj.money = objectData.Create_User;// chua có
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
                        if (objectData.IdLotrinhShipper + "" === window.idParam + "") {
                            obj.check = 1;
                        } else {
                            obj.check = 0;
                        }
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
        $('#Div_tableSanPham')[0].style.display = "none";
        $('#Div_tableTT')[0].style.display = "block";
        
        var formDataAssign = new FormData();
        formDataAssign.append('type', 'assignHoaDonToShiper');
        var datatable = $('#table').bootstrapTable('getData');
        var lstCheck = $('#table').find('input.check[type="checkbox"]');
        var listNgayHoaDon = [];

        if (datatable) {
            for (var i = 0; i < datatable.length; i++) {

                if (lstCheck[i].checked && datatable[i].id) {
                    listNgayHoaDon.push(datatable[i].id);
                }
            }
        }
        //alert(listNgayHoaDon);
        var shiper = $('#cbShip').val();
        var user = 0 ;//$('#userid').val(); TODO
        var IdLotrinh = window.idParam;
       
        var json = {
            'shiper': shiper,
            'user': user,
            'IdLotrinh':IdLotrinh,
            'listNgayHoaDon': listNgayHoaDon,
        };
        formDataAssign.append('data', JSON.stringify(json));
        formDataAssign.append('IdLotrinh', IdLotrinh);
        formDataAssign.append('NguoiTao', user);

        $.ajax({
            url: "Configuation/Handler1Test.ashx",
            type: "POST",
            data: formDataAssign,
            contentType: false,
            processData: false,
            success: function (result) {
                //alert("Assign thành công");
                loadDataByID();
            },
            error: function (err) {
            }
        });
    });
    $('#btSua').on('click', function (e) {
        $('#Div_tableSanPham')[0].style.display = "block";
        $('#Div_tableTT')[0].style.display = "none";
        var data1 = [];
        var formDatasearch = new FormData();
        formDatasearch.append('type', 'getDataFilter');

        var maReservation = $('#txt_reservation').val();
        var ngayHoaDon = $('#txt_Date').val();
        var quan = $('#txt_Distric').val();
        var soShiper = $('#txt_ShipNumber').val();
        // var tenShiper = $('#txt_ShipName').val();
        var trangThai = "";//$('#txt_status').val();


        formDatasearch.append('maReservation', maReservation);
        formDatasearch.append('ngayHoaDon', ngayHoaDon);
        formDatasearch.append('quan', quan);
        formDatasearch.append('soShiper', "");
        formDatasearch.append('tenShiper', "");
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
                        if (objectData.TongTienConNo) {
                            obj.money = objectData.TongTienConNo;
                        } else {
                            if (objectData.TongTien) {
                                obj.money = objectData.TongTien;
                            }
                        }
                        //obj.money = objectData.Create_User || "";// chua có
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
                        if (objectData.IdLotrinhShipper + "" === window.idParam + "") {
                            obj.check = 1;
                        } else {
                            obj.check = 0;
                        }
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




        /*var dataSearch = [];
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
                        if (objectData.TongTienConNo) {
                            obj.money = objectData.TongTienConNo;
                        } else {
                            if (objectData.TongTien) {
                                obj.money = objectData.TongTien;
                            }
                        }
                        //obj.money = objectData.Create_User || "";// chua có
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
                        if (objectData.IdLotrinhShipper + "" === window.idParam + "") {
                            obj.check = 1;
                        } else {
                            obj.check = 0;
                        }
                        // userName
                        arr.push(obj);
                    }
                }
                dataSearch = arr;
                getDataTable(dataSearch);
                //var $tableSearch = $('#table');
               // $tableSearch.bootstrapTable('load', dataSearch);
            },
            error: function (err) {
            }
        });*/
    });
    var loadDataByID = function () { 
        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'getALLDataByIdLoTrinh');
        //var json = { 'IdLotrinh': 0 };
        formDataListUser.append('IdLotrinh', window.idParam);
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
                        if (objectData.TongTienConNo) {
                            obj.money = objectData.TongTienConNo;
                        } else {
                            if (objectData.TongTien) {
                                obj.money = objectData.TongTien;
                            }
                        }
                        //obj.money = objectData.Create_User || "";// chua có
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
                var $tableSearch = $('#tableTT');
                $tableSearch.bootstrapTable('load', data);
                //getDataTable(data);
            },
            error: function (err) {
            }
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
                //checkbox: true
                formatter: function (value, row, index) {
                    if (value == 1) {
                        return '<input type="checkbox" class="check"  checked="checked" />';
                    } else {
                        return '<input type="checkbox" class="check" />';
                    }
                }
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
    // getdata table san phẩm
    var getDataTableTT = function (itemData) {
        $('#tableTT').bootstrapTable({
            columns: [{
                
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
    // dtaa
</script>
    </asp:Content>

