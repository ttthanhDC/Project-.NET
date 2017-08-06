﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="LT002_ThemNgay.aspx.cs" Inherits="SYSGREEN.LT002_ThemNgay" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
 
<div id="contactHD">
       <div class="form-horizontal" style="margin-left:20px">
           <div class="form-group">
                <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-2">Đơn dọc</label>
                <div class="col-md-2">
                   <select class="form-control" id="cb_DonDoc"></select>
                </div>
            </div> 
        </div>
        <div class="form-horizontal" style="margin-left:20px">
           <div class="form-group">
                <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-2">Đơn</label>
                <div class="col-md-2">
                   <select class="form-control" id="cb_Don"></select>
                </div>
            </div> 
        </div>
        <div class="form-horizontal">
           <div class="form-group">
                <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-2">Ngày</label>
                <div class="col-md-2">
                     <input type="text" class="form-control" name="title" id="txt_Ngay" />
                </div>
            </div> 
    </div>
    <div class="form-horizontal">
           <div class="form-group">
                <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-2">Thứ</label>
                <div class="col-md-2">
                     <input type="text" class="form-control" name="title" id="txt_Thu" disabled="disabled" />
                </div>
            </div> 
    </div>      
 </div>   
 <div style="text-align:center;display: table;margin-top: 10px;margin-left: 3%;">
    <button type="button" class="btn btn-primary" id="btnThem">Thêm mới sản phẩm</button>
</div>
<div style="margin-left : 30px; margin-right : 30px">
    <table id="table" 
    ></table>
</div>
<div style="text-align:center;display: table;margin-top: 10px;margin-left: 45%;">
    <button type="button" class="btn btn-primary" id="btnSave">Lưu thông tin</button>
</div>
    
<script>
    // Bootstrap Table
    $(function () {
        window.idKHParam = 0;
        window.idHD = 0;
        window.idNgayHoaDonParam = 0;
        window.lstIdDelete = [];
        loadContent();
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) {
                    return pair[1];
                }
            }
            //alert('Query Variable ' + variable + ' not found');
        };
        function loadContent() {
            //window.idKHParam = getQueryVariable("idKHParam");
            window.idHD = getQueryVariable("idHD");
            LoadComboBoxDonDoc();
            //window.idNgayHoaDonParam = getQueryVariable("idNgayHoaDonParam");
            //LoadComboBoxQH();
            FormatDate();
            //loadThongTinKH();
            loadDataHoaDon();
            //loadSoLanGiao();
        };

        $('#txt_Ngay').on('change', function () {
            var dateNgaygiaoHangLe = this.value;
            $("#txt_Thu").val(convertDateToDay(dateNgaygiaoHangLe));
        });
        function convertDateToDay(num) {
            var x = num;
            x = x.split('/')[1] + "/" + x.split('/')[0] + "/" + x.split('/')[2];
            var date = new Date(x);
            var day = date.getDay();
            var strDay = "";
            switch (day) {
                case 0:
                    strDay = "Chủ Nhật";
                    break;
                case 1:
                    strDay = "Thứ hai";
                    break;
                case 2:
                    strDay = "Thứ ba";
                    break;
                case 3:
                    strDay = "Thứ tư";
                    break;
                case 4:
                    strDay = "Thứ năm";
                    break;
                case 5:
                    strDay = "Thứ sáu";
                    break;
                case 6:
                    strDay = "Thứ bảy";
                    break;
                case 7:
                    strDay = "Chủ Nhật";
                    break;
                default:
                    break;
            }
            return strDay
        }
        function loadComboxBoxDon(value) {
            var formSource = new FormData();
            var json = { 'ID': 0 };
            formSource.append('type', 'getLv3HD');
            formSource.append('idCTHD', value);
            formSource.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerInsertBill.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var $menu = $("#cb_Don").empty();
                    $.each(jsonData, function () {
                        $menu.append(getSourceDon(this));
                    });

                },
                error: function (err) {

                }
            });
        };
        function LoadComboBoxDonDoc() {
            var formSource = new FormData();
            var json = { 'ID': 0 };
            formSource.append('type', 'getLv2HD');
            formSource.append('idHD', window.idHD);
            formSource.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerInsertBill.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var $menu = $("#cb_DonDoc");
                    loadComboxBoxDon(jsonData[0].ID);
                    $.each(jsonData, function () {
                        $menu.append(getSourceDonDoc(this));
                    });
                },
                error: function (err) {

                }
            });
        };
        //getSourceDonDoc
        function getSourceDonDoc(itemData) {
            var name = itemData.tabIndex < 10 ? "0" + itemData.tabIndex : itemData.tabIndex;
            var item = $("<option value='" + itemData.ID + "'>").append(name);
            return item;
        }
        //getSourceDon
        function getSourceDon(itemData) {
            var name = itemData.Name ? itemData.Name : 'Đơn lẻ';
            var item = $("<option value='" + itemData.ID + "'>").append(name);
            return item;
        }
        // getSource
        function getSource(itemData) {
            var item = $("<option value='" + itemData.link + "'>")
                .append(itemData.name);
            return item;
        };
        function FormatDate() {
            $('#txtNgaySinh').datepicker({
                dateFormat: 'dd/mm/yyyy'
            });
        };

        $("#cb_DonDoc").on('change', function () {
            loadComboxBoxDon(this.value);
        });
        // eventKhachHang
        function eventKhachHang() {
            var formatDateTime = function (value) {
                if (value && value != "") {
                    var date = new Date(value);
                    var d = date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate();
                    var m = (date.getMonth() + 1) < 10 ? ('0' + (date.getMonth() + 1)) : (date.getMonth() + 1);
                    var y = date.getFullYear();
                    return d + '/' + m + '/' + y;
                } else {
                    return ''
                }
            };

            // Onchange Customer
            $('#txtSoDienThoai').on('change', function () {
                var formCustomer = new FormData();
                var json = { 'PhoneNumber': this.value };
                formCustomer.append('type', 'getDataByPhoneNumber');
                formCustomer.append('data', JSON.stringify(json));
                $.ajax({
                    url: "Configuation/HandlerSysCustomer.ashx",
                    type: "POST",
                    data: formCustomer,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        var jsonData = result;
                        var arr = [];
                        if (jsonData && jsonData.length > 0) {
                            var objectData = jsonData[0];
                            $('#txtMaKH').val("KH" + (objectData.ID < 10 ? ('0' + objectData.ID.toString()) : objectData.ID.toString()));
                            $('#txtHoTen').val(objectData.CustomerName);
                            $('#txtNgaySinh').val(formatDateTime(objectData.BirthDay));
                            document.getElementById('txtEmailCustomer').value = objectData.Email;
                            document.getElementById('txtDiaChiCustomer').value = objectData.Address;
                            $("#cb_quan option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');

                        }
                    },
                    error: function (err) {

                    }
                });
            });

            $('#txtEmailCustomer').on('change', function () {
                var formCustomer = new FormData();
                var json = { 'Email': this.value };
                formCustomer.append('type', 'getDataByEmail');
                formCustomer.append('data', JSON.stringify(json));
                $.ajax({
                    url: "Configuation/HandlerSysCustomer.ashx",
                    type: "POST",
                    data: formCustomer,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        var jsonData = result;
                        var arr = [];
                        if (jsonData && jsonData.length > 0) {
                            var objectData = jsonData[0];
                            $('#txtMaKH').val("KH" + (objectData.ID < 10 ? ('0' + objectData.ID.toString()) : objectData.ID.toString()));
                            $('#txtHoTen').val(objectData.CustomerName);
                            $('#txtNgaySinh').val(formatDateTime(objectData.BirthDay));
                            document.getElementById('txtSoDienThoai').value = objectData.PhoneNumber;
                            document.getElementById('txtDiaChiCustomer').value = objectData.Address;
                            $("#cb_quan option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');
                            if (window.isMasterTab == 0) {
                                if (window.TempTab.length > 0) {
                                    window.TempTab[0].cb_quan = objectData.MaQuan;
                                    window.TempTab[0].txtMaKH = $('#txtMaKH').val();
                                    window.TempTab[0].txtHoTen = $('#txtNgaySinh').val();
                                    window.TempTab[0].txtNgaySinh = $('#txtEmailCustomer').val();
                                    window.TempTab[0].txtDiaChiCustomer = $('#txtDiaChiCustomer').val();
                                    window.TempTab[0].txtSoDienThoai = $('#txtSoDienThoai').val();
                                }
                                $("#txtMaKH1").val($('#txtMaKH').val());
                                $("#txtHoTen1").val($('#txtHoTen').val());
                                $("#txtNgaySinh1").val($('#txtNgaySinh').val());
                                $("#txtSoDienThoai1").val($('#txtSoDienThoai').val());
                                $("#txtDiaChiCustomer1").val($('#txtDiaChiCustomer').val());
                                $("#cb_quan1 option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');
                            }

                        } else {
                            /*
                            $('#txtMaKH').val('');
                            $('#txtHoTen').val('');
                            $('#txtNgaySinh').val('');
                            document.getElementById('txtSoDienThoai').value = '';
                            document.getElementById('txtDiaChiCustomer').value = '';*/
                        }
                    },
                    error: function (err) {

                    }
                });
            });
        };
        function loadThongTinKH() {
            var formatDateTime = function (value) {
                if (value && value != "") {
                    var date = new Date(value);
                    var d = date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate();
                    var m = (date.getMonth() + 1) < 10 ? ('0' + (date.getMonth() + 1)) : (date.getMonth() + 1);
                    var y = date.getFullYear();
                    return d + '/' + m + '/' + y;
                } else {
                    return ''
                }
            };
            var formSource = new FormData();
            var json = { 'type': 0 };
            var makh = window.idKHParam;
            formSource.append('type', 'getCustomerById');
            formSource.append('data', JSON.stringify(json));
            formSource.append('makh', makh);
            $.ajax({
                url: "Configuation/HandlerSysCustomer.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    if (jsonData && jsonData.length > 0) {
                        var objectData = jsonData[0];
                        $('#txtMaKH').val("KH" + (objectData.ID < 10 ? ('0' + objectData.ID.toString()) : objectData.ID.toString()));
                        $('#txtHoTen').val(objectData.CustomerName);
                        $('#txtNgaySinh').val(formatDateTime(objectData.BirthDay));
                        $('#txtSoDienThoai').val(objectData.PhoneNumber);
                        document.getElementById('txtEmailCustomer').value = objectData.Email;
                        document.getElementById('txtDiaChiCustomer').value = objectData.Address;
                        $("#cb_quan option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');
                    }
                }, error: function (err) {

                }
            });
        }
        function loadDataHoaDon() {
            var formatDateTime = function (value) {
                if (value && value != "") {
                    var date = new Date(value);
                    var d = date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate();
                    var m = (date.getMonth() + 1) < 10 ? ('0' + (date.getMonth() + 1)) : (date.getMonth() + 1);
                    var y = date.getFullYear();
                    return d + '/' + m + '/' + y;
                } else {
                    return ''
                }
            };

            var convertDateToDay = function (num) {
                var x = num;
                x = x.split('/')[1] + "/" + x.split('/')[0] + "/" + x.split('/')[2];
                var date = new Date(x);
                var day = date.getDay();
                var strDay = "";
                switch (day) {
                    case 0:
                        strDay = "Chủ Nhật";
                        break;
                    case 1:
                        strDay = "Thứ hai";
                        break;
                    case 2:
                        strDay = "Thứ ba";
                        break;
                    case 3:
                        strDay = "Thứ tư";
                        break;
                    case 4:
                        strDay = "Thứ năm";
                        break;
                    case 5:
                        strDay = "Thứ sáu";
                        break;
                    case 6:
                        strDay = "Thứ bảy";
                        break;
                    case 7:
                        strDay = "Chủ Nhật";
                        break;
                    default:
                        break;
                }
                return strDay
            };

            var formSource = new FormData();
            var json = { 'type': 0 };
            var ngayhdId = window.idNgayHoaDonParam;
            formSource.append('type', 'getvHoaDonStep3');
            formSource.append('data', JSON.stringify(json));
            formSource.append('ngayhdId', ngayhdId);
            $.ajax({
                url: "Configuation/HandlerInsertBill.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    // table
                    $('#table').bootstrapTable({
                        columns: [{
                            field: 'stt',
                            title: 'STT',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'product',
                            title: 'Sản phẩm',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'quantity',
                            title: 'Số lượng',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'price',
                            title: 'Giá sản phẩm',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'sugar',
                            title: 'Sugar',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (row.sugar == "1") {
                                    return '<input type="checkbox" class="surgarP"  checked="checked" />';
                                } else {
                                    return '<input type="checkbox" class="surgarP" />';
                                }
                            }
                        },
                        {
                            field: 'money',
                            title: 'Thành tiền',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'promotionCode',
                            title: 'Promotion code',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'total',
                            title: 'Total',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'GhiChu',
                            title: 'Ghi chú',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'operate',
                            title: 'Thao tác',
                            align: 'center',
                            valign: 'middle',
                            events: operateEvents,
                            formatter: operateFormatter
                        }]
                    });
                    // Edit Table 
                    $table = $("#table");
                    $table.on('editable-save.bs.table', function (e, field, row, old, $el) {
                        var $els = $table.find('.editable');
                        next = $els.index($el) + 1;
                        if (field == "product") {

                            var formProduct = new FormData();
                            var json = { 'Product_Code': row[field] };
                            formProduct.append('type', 'getDataByProductCode');
                            formProduct.append('data', JSON.stringify(json));
                            $.ajax({
                                url: "Configuation/HandlerSysProduct.ashx",
                                type: "POST",
                                data: formProduct,
                                contentType: false,
                                processData: false,
                                success: function (result) {
                                    var jsonData = result;
                                    var arr = [];
                                    if (jsonData && jsonData.length > 0) {
                                        var objectData = jsonData[0];
                                        var quantity = Number(objectData.Product_Unit);
                                        row.quantity = quantity;
                                        var price = objectData.Product_Amount.toString().split('.').join('');
                                        row.price = price.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                                        row.money = (quantity * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                                        row.total = (quantity * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                                        $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                                    } else {
                                        row.quantity = "";
                                        row.price = "";
                                        row.money = "";
                                        row.total = "";
                                        $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                                    }
                                },
                                error: function (err) {

                                }
                            });
                        }
                        if (field == "quantity") {
                            var price = row.price.split('.').join('');
                            row.money = (row[field] * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                            row.total = (row[field] * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                            $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                        }
                        if (field == "promotionCode") {
                            var formpromotionCode = new FormData();
                            var json = { 'Code': row[field] };
                            formpromotionCode.append('type', 'getDataByPromotionCode');
                            formpromotionCode.append('data', JSON.stringify(json));
                            $.ajax({
                                url: "Configuation/HandlerSysPromotion.ashx",
                                type: "POST",
                                data: formpromotionCode,
                                contentType: false,
                                processData: false,
                                success: function (result) {
                                    var jsonData = result;
                                    var arr = [];
                                    if (jsonData && jsonData.length > 0) {
                                        var objectData = jsonData[0];
                                        var percent = Number(objectData.Promotion_Percent) / 100;
                                        var total = row.total.toString().split('.').join('');
                                        total = total == "" ? Number('0') : Number(total);
                                        row.total = (total - (total * percent)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");

                                        $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                                    }
                                },
                                error: function (err) {

                                }
                            });
                        }
                    });
                    // Load Data for Grid
                    var data = [];
                    for (var i = 0 ; i < jsonData.length ; i++) {
                        var index = i + 1;
                        if (i == 0) {
                            $("#txtNgayGiao").val(formatDateTime(jsonData[i].Ngay));
                            $("#txtThuGiaoHang").val(convertDateToDay(formatDateTime(jsonData[i].Ngay)));
                            $("#txtTrangThai").val(jsonData[i].TrangThai);
                            $("#txtTrangThaiGiaoHang").val(jsonData[i].TrangThai);
                            if (jsonData[i].TangGiamTien && jsonData[i].TangGiamTien != "") {
                                $("#txtTangGiamTien").val(jsonData[i].TangGiamTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                            } else {
                                $("#txtTangGiamTien").val('0');
                            }
                            $('#txtGhiChu').val(jsonData[i].GhiChuNHD);
                            $("#txtNguoiAssign").val(jsonData[i].UserName);
                            $("#txtShipper").val(jsonData[i].NAME);
                            $("#txtGoi").val(jsonData[i].Loai == 2 ? 'Lẻ' : jsonData[i].TenGoi);
                            $("#txtHinhThucShip").val(jsonData[i].HinhThucGiaoHang);
                            $("#txtHinhThucThanhToan").val(jsonData[i].HinhThucThanhToan);
                            $("#txtPhiShip").val(jsonData[i].Ship);
                            if (jsonData[i].TrangThai == "Hoàn thành") {
                                $("#lblSoTien").text("Số tiền đã thu");
                                $("#txtSoTienNgay").val(jsonData[i].SoTienThu.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                            } else if (jsonData[i].TrangThai == "Chờ xử lý") {

                                var formSource = new FormData();
                                var json = { 'type': 0 };
                                var ngayhdId = window.idNgayHoaDonParam;
                                formSource.append('type', 'getSoTienChuaXuLy');
                                formSource.append('data', JSON.stringify(json));
                                formSource.append('ngayhdId', ngayhdId);
                                $.ajax({
                                    url: "Configuation/HandlerInsertBill.ashx",
                                    type: "POST",
                                    data: formSource,
                                    contentType: false,
                                    processData: false,
                                    success: function (result) {
                                        $("#lblSoTien").text("Số tiền sẽ thu");
                                        $("#txtSoTienNgay").val(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                                    }
                                });
                            } else {
                                $("#lblSoTien").text("Số tiền sẽ thu");
                                var formSource = new FormData();
                                var json = { 'type': 0 };
                                var ngayhdId = window.idNgayHoaDonParam;
                                formSource.append('type', 'getSoTienChuaXuLy');
                                formSource.append('data', JSON.stringify(json));
                                formSource.append('ngayhdId', ngayhdId);
                                $.ajax({
                                    url: "Configuation/HandlerInsertBill.ashx",
                                    type: "POST",
                                    data: formSource,
                                    contentType: false,
                                    processData: false,
                                    success: function (result) {
                                        $("#txtSoTienNgay").val(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                                    }
                                });
                            }
                        }
                        var obj = {
                            stt: index,
                            product: jsonData[i].product,
                            quantity: jsonData[i].quantity,
                            price: jsonData[i].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","),
                            sugar: jsonData[i].sugar,
                            Error: jsonData[i].Error,
                            money: jsonData[i].money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","),
                            promotionCode: jsonData[i].promotionCode,
                            total: jsonData[i].total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","),
                            GhiChu: jsonData[i].GhiChu,
                            idhdSp: jsonData[i].IDHDSP,
                            idngayHD: window.idNgayHoaDonParam
                        }
                        data.push(obj);
                    }

                    $('#table').bootstrapTable('load', data);
                },
                error: function (err) {

                }
            });
        };
        function loadSoLanGiao() {
            var formSource = new FormData();
            var json = { 'ID': 0 };
            formSource.append('type', 'getSoLanGiao');
            formSource.append('data', JSON.stringify(json));
            formSource.append('ngayhdId', window.idNgayHoaDonParam);
            $.ajax({
                url: "Configuation/HandlerInsertBill.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    $("#txtSoluotGiao").val(result);
                },
                error: function (err) {

                }
            });
        };

    });

    function operateFormatter(value, row, index) {
        return [
        '<a class="linkIn" href="javascript:void(0)" title="xóa">',
        'Xóa'
        ].join('');
    }

    window.operateEvents = {
        'click .linkIn': function (e, value, row, index) {
            var $table = $('#table');
            window.lstIdDelete.push(row.idhdSp);
            $('#table').bootstrapTable('remove', {
                field: 'stt',
                values: [row.stt]
            });
        }
    };

    $('#btnThem').on('click', function () {
        var $table = $('#table');
        var data = $('#table').bootstrapTable('getData');
        var obj = {};
        obj.stt = data.length + 1;;
        obj.product = '';
        obj.quantity = '';
        obj.price = '';
        obj.sugar = '';
        obj.Error = '';
        obj.money = '';
        obj.promotionCode = '';
        obj.total = '';
        obj.GhiChu = '';
        obj.idhdSp = '';
        obj.idngayHD = window.idNgayHoaDonParam;
        $table.bootstrapTable('append', [obj]);
    });

    $('#btnSave').on('click', function () {
        var formatDateTime = function (value) {
            if (value && value != "") {
                var date = new Date(value.split("/")[1] + "/" + value.split("/")[0] + "/" + value.split("/")[2]);
                var d = date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate();
                var m = (date.getMonth() + 1) < 10 ? ('0' + (date.getMonth() + 1)) : (date.getMonth() + 1);
                var y = date.getFullYear();
                return m + '/' + d + '/' + y;
            } else {
                return ''
            }
        };
        var formSource = new FormData();
        //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT
        //window.lstIdDelete
        var data = $('#table').bootstrapTable('getData');
        var lstSurgar = $('#table').find('input.surgarP[type="checkbox"]');
        for (var i = 0; i < data.length ; i++) {
            data[i].sugar = lstSurgar[i].checked ? 1 : 0;
        }
        formSource.append('type', 'insertNgayDonHang');
        formSource.append('data', JSON.stringify(data));
        formSource.append('idGoi', $('#cb_Don').val());
        formSource.append('ngayDH', formatDateTime($('#txt_Ngay').val()));
        $.ajax({
            url: "Configuation/HandlerInsertBill.ashx",
            type: "POST",
            data: formSource,
            contentType: false,
            processData: false,
            success: function (result) {
                alert("Thêm mới ngày cho đơn hàng thành công");
            }
        });
    });


</script>
    </asp:Content>





