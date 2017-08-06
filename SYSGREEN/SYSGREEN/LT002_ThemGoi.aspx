﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="LT002_ThemGoi.aspx.cs" Inherits="SYSGREEN.LT002_ThemGoi" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   <div id="contactHD">
       <div class="form-horizontal" style="margin-left:20px">
           <div class="form-group">
                <label for="sel1" class="col-md-2">Loại đơn</label>
                <div class="col-md-3">
                    <select class="form-control" id="cb_LoaiDon"></select>
                </div>
               <label for="sel1" class="col-md-3" id="lblMaKH">Mã khách hàng</label>
                <div class="col-md-3" id="divMaKH">
                        <input type="text" class="form-control" name="title" id="txtMaKH" disabled="disabled"/>
                </div>
            </div> 
           <div class="form-group">
                <label for="sel1" class="col-md-2">Loại hình đơn</label>
                <div class="col-md-3">
                    <select class="form-control" id="cb_OrderType">
                        <option value ="-1"></option>
                        <option value ="1">Gói</option>
                        <option value ="2">Đơn lẻ</option>
                        </select>
                </div>
                <label for="sel1" class="col-md-3" id="lblHoTen">Họ và tên</label>
                    <div class="col-md-3" id="divHoTen">
                        <input type="text" class="form-control" name="title" id="txtHoTen" />
                    </div>
            </div> 
            <div class="form-horizontal">
                <div class="form-group">
                   <label for="sel1" class="col-md-2" id="lbLoaiGoi">Gói</label>
                   <div class="col-md-3">
                        <select class="form-control" id="cb_OrderType2">
                            <option value ="-1"></option>
                            <option value ="8">A1 </option>
                            <option value ="12">A2 </option>
                            <option value ="12">A3 </option>
                            <option value ="12">B1</option>
                            <option value ="8">B2</option>
                            <option value ="12">B3</option>
                            <option value ="8">C1</option>
                            <option value ="12">C2</option>
                            <option value ="8">C3</option>
                            <option value ="12">C4</option>
                             <option value ="10">D</option>
                        </select>
                    </div>
                    <label for="sel1" class="col-md-3" id="lblNgaySinh">Ngày sinh</label>
                    <div class="col-md-3" id="divNgaySinh">
                        <input type="text" placeholder="dd/mm/yyyy" data-date-format='dd/mm/yyyy' class="form-control" name="title" id="txtNgaySinh" />
                    </div>
                </div> 
            </div>  
            <div class="form-horizontal">
                <div class="form-group">
                   <label for="sel1" class="col-md-2" id="lblPhiShip">Hình thức Ship</label>
                   <div class="col-md-3">
                        <select class="form-control" id="cb_hinhthucShip">
                            <option value = "-1"></option>
                            <option value = "Ship đi">Ship đi</option>
                            <option value = "Đến lấy">Đến lấy</option>
                      </select>
                    </div>
                    <label for="sel1" class="col-md-3" id="lblSoDT">Số điện thoại</label>
                    <div class="col-md-3" id="divSoDT">
                        <input type="text" class="form-control" name="title" id="txtSoDienThoai" />
                    </div>
                </div> 
            </div>  
             <div class="form-horizontal">
                <div class="form-group">
                   <label for="sel1" class="col-md-2">Thanh toán</label>
                   <div class="col-md-3">
                       <select class="form-control" id="cb_PayType">
                            <option value = "-1"></option>
                            <option value = "Tiền mặt">Tiền mặt</option>
                            <option value = "Chuyển khoản">Chuyển khoản</option>
                      </select>
                    </div>
                     <label for="sel1" class="col-md-3" id="lblEmail">Email</label>
                    <div class="col-md-3" id="divEmail">
                        <input type="text" class="form-control" name="title" id="txtEmailCustomer" />
                    </div>
                </div> 
             </div>  
              <div class="form-horizontal">
                <div class="form-group">
                   <label for="sel1" class="col-md-2">Phí Ship</label>
                   <div class="col-md-3">
                       <input type="text" class="form-control" name="title" id="txt_PhiShip" />
                    </div>
                   <label for="sel1" class="col-md-3" id="lblDiaChi">Địa chỉ</label>
                    <div class="col-md-3" id="divDiaChi">
                        <input type="text" class="form-control" name="title" id="txtDiaChiCustomer" />
                    </div>
                </div> 
            </div>  
           <div class="form-horizontal">
                <div class="form-group">
                    <label for="sel1" class="col-md-5"></label>
                   
                    <label for="sel1" class="col-md-3">Quận</label>
                    <div class="col-md-3">
                        <select class="form-control" id="cb_quan"></select>
                    </div>
                </div> 
            </div> 
         </div>
        <div class="row" style="margin-left : 30px; margin-right : 30px">

        </div> 
        
    <div style ="text-align:center;display: table;margin: 0 auto;">
       <button type="button" class="btn btn-primary" id="btnSave">Lưu đơn hàng</button>
    </div>
</div>
    <div id="divTableGoi" style="width:100%;margin-left:30px;margin-top:10px;margin-right:30px;">
        
         <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-horizontal">
                                     <div class="form-group">
                                            <label for="sel1" class="col-md-2">Import Template</label>
                                            <div class="col-md-4">
                                                <input type="file" class="form-control" name="title" id="txtFile"/>
                                            </div>
                                            <label for="sel1" class="col-md-2" id="lblSoTien"></label>
                                            <div class="col-md-4">
                                                <button type="button" class="btn btn-primary"  id="btnUpload">Upload</button>
                                            </div>
                                     </div> 
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-horizontal">
                                     <div class="form-group">
                                            <label for="sel1" class="col-md-2">Promition Code</label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control" name="title" id="txtPromotionCode"/>
                                            </div>
                                            <label for="sel1" class="col-md-2" id="Tổng tiền gói"></label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control" name="title" id="txtTotalTienGoi" disabled="disabled"/>
                                            </div>
                                     </div> 
                                </div>
                            </div>
                        </div>
                        <table id="tablePopup" 
                            data-id-field="undefined"
                            data-unique-id="undefined"
                            data-show-refresh="true">
                        </table>
    </div >
    <div id="divTableLe" style="width:100%;margin-left:30px;margin-top:10px;margin-right:30px;">
         <div id="dvHidden"></div>
         <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                       <label for="sel1" class="col-md-3" id="lblNgayGiaoHangLe">Ngày giao hàng</label>
                                       <div class="col-md-3">
                                            <input type="text" placeholder="dd/mm/yyyy" data-date-format='dd/mm/yyyy' class="form-control" name="title" id="txtNgayGiaoHangLe" />
                                        </div>
                                        <label for="sel1" class="col-md-3" id="lblThuGiaoHangLe"> Thứ </label>
                                        <div class="col-md-3" id="divThuGiaoHangLe">
                                            <input type="text" class="form-control" name="title" id="txtThuGiaoHangLe" disabled />
                                        </div>
                                     </div> 
                            </div>  
                            </div>
                        </div>
                       
                        <button type="button" class="btn btn-primary"  id="btnAddSingle">Thêm mới </button>
                        <table id="tablePopupSingle" 
                            data-id-field="undefined"
                            data-unique-id="undefined"
                            data-show-refresh="true">
                        </table>
    </div >
   
    <script>
        $(function () {

        
        window.idHD = 0;
        window.infoKH = null;
        window.totalTienGoi = 0;
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
            window.idHD = getQueryVariable("idHD");
            FormatDate();
            LoadComboBoxDonDoc();
            LoadComboBoxQH();
            loadGoiHD();
            loadInfoKHByHD();
            eventKhachHang();
            eventAddChiTietDonHang();
            initTablePopup();
            initTableSinglePopup();
            $("#divTableLe")[0].style.display = 'none';
            $("#divTableGoi")[0].style.display = 'inline-block';
        };

        function loadGoiHD() {
            var formSource = new FormData();
            var json = { 'type': 0 };
            formSource.append('type', 'getGoiHD');
            formSource.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerInsertBill.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    window.dataGoi = result;
                },
                error: function (err) {

                }
            });
        }

        function FormatDate() {
            $('#txtNgaySinh').datepicker({
                dateFormat: 'dd/mm/yyyy'
            });

        };

        // format Money
        function formatterThousandDelimiter(num) {
            return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        function LoadComboBoxQH() {
            var formSource = new FormData();
            var json = { 'ID': 0 };
            formSource.append('type', 'getData');
            formSource.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerQuanHuyen.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    if (jsonData && jsonData.length > 0) {
                        for (var i = 0; i < jsonData.length ; i++) {
                            var objectData = jsonData[i];
                            var obj = {};
                            obj.name = objectData.TenQuan;
                            obj.link = objectData.MaQuan;
                            obj.sub = null;
                            arr.push(obj);
                        }
                    }
                    var data1 = { menu: arr };
                    var $menu1 = $("#cb_quan");
                    $.each(data1.menu, function () {
                        $menu1.append(getSource(this));
                    });
                },
                error: function (err) {

                }
            });
        };

        function eventAddChiTietDonHang() {
            //$("#div_PhiShip").css("dedplay", "none");
            // onchage select box 
            $('#cb_OrderType').on('change', function () {
                if (this.value == "1") {
                    $('#txt_PhiShip').attr('disabled', 'disabled');
                    $('#txt_PhiShip').val("");
                    $("#cb_OrderType2").removeAttr('disabled');
                    $("#divTableLe")[0].style.display = 'none';
                    $("#divTableGoi")[0].style.display = 'inline-block';
                } else {
                    $("#cb_OrderType2 option[value=-1]").attr('selected', 'selected');
                    $("#cb_OrderType2").attr("disabled", "disabled");
                    $('#txt_PhiShip').removeAttr('disabled');
                    $("#divTableGoi")[0].style.display = 'none';
                    $("#divTableLe")[0].style.display = 'inline-block';
                }
            });
            $('#cb_hinhthucShip').on('change', function () {
                if (this.value == "Ship đi") {
                    if ($('#cb_OrderType').val() != "1") {
                        $('#txt_PhiShip').removeAttr('disabled');
                    }
                } else {
                    $('#txt_PhiShip').val("0");
                }
            });

            $('#cb_OrderType2').on('change', function () {
                var loaigoi = $('#cb_OrderType2 :selected').text();
                for (var k = 0; k < window.dataGoi.length ; k++) {
                    if (window.dataGoi[k].Name.trim() == loaigoi.trim()) {
                        $("#txtTotalTienGoi").val(window.dataGoi[k].Tien.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
                        break;
                    }
                }
            });



        };
        function loadInfoKHByHD() {
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
            var json = { 'ID': 0 };
            formSource.append('type', 'loadInfoKHByHD');
            formSource.append('idHD', window.idHD);
            formSource.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerInsertBill.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result[0];
                    window.infoKH = jsonData;
                    $('#txtMaKH').val("KH" + (jsonData.IdKH < 10 ? ('0' + jsonData.IdKH.toString()) : jsonData.IdKH.toString()));
                    $('#txtHoTen').val(jsonData.CustomerName);
                    $('#txtNgaySinh').val(formatDateTime(jsonData.BirthDay));
                    document.getElementById('txtEmailCustomer').value = jsonData.Email;
                    document.getElementById('txtDiaChiCustomer').value = jsonData.Address;
                    document.getElementById('txtSoDienThoai').value = jsonData.PhoneNumber;
                    $("#cb_quan option[value=" + jsonData.MaQuan + "]").attr('selected', 'selected');
                    $('#txtHoTen').val(jsonData.CustomerName);
                },
                error: function (err) {

                }
            });
        };
        

        function loadComboxBoxDon(value) {
            var formSource = new FormData();
            var json = { 'ID': 0 };
            formSource.append('type', 'getInfoKHBy');
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

        $("#cb_LoaiDon").on('change', function () {
            //loadInfoKH(this.value);
        });

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
                    var $menu = $("#cb_LoaiDon");
                    //loadComboxBoxDon(jsonData[0].ID);
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
        // getSource
        function getSource(itemData) {
            var item = $("<option value='" + itemData.link + "'>")
                .append(itemData.name);
            return item;
        };
        function loadGoiHD() {
            var formSource = new FormData();
            var json = { 'type': 0 };
            formSource.append('type', 'getGoiHD');
            formSource.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerInsertBill.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    window.dataGoi = result;
                },
                error: function (err) {

                }
            });
        };

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
                        /*
                    else {
                        $('#txtMaKH').val('');
                        $('#txtHoTen').val('');
                        $('#txtNgaySinh').val('');
                        document.getElementById('txtEmailCustomer').value = '';
                        document.getElementById('txtDiaChiCustomer').value = '';
                    }*/
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
        // Onchange Ship
        $('#txt_PhiShip').on('change', function () {
            $("#txt_PhiShip").val(formatterThousandDelimiter(this.value));
        });
        $('#btnAdd').on('click', function (e) {
            if ($('#cb_OrderType').val() == 1) { // Gói
                var $table = $('#tablePopup');
                initTablePopup();
                var dataTabIndex = [];
                var dataTemp = [];
                for (var i = 0; i < window.dataGlobal.length ; i++) {
                    if (window.dataGlobal[i].tabIndex == window.indexTab) {
                        dataTabIndex = window.dataGlobal[i].data;
                        break;
                    }
                }
                if (dataTabIndex.length > 0) {
                    for (var k = 0; k < dataTabIndex.length ; k++) {
                        if (dataTabIndex[k].billId == row.billId) {
                            dataTemp = dataTabIndex[k].detalMaster;
                            break;
                        }
                    }
                }

                if (dataTemp.length > 0) {
                    $table.bootstrapTable('load', dataTemp);
                } else {
                    var dataTemp = [];
                    var n = row.fLoaiGoiId;
                    var tien = 0;
                    //var idGoi = 0;

                    for (var m = 0; m < n; m++) {
                        var index = m + 1;
                        var obj = {};

                        obj.id = index;
                        obj.parent = true;
                        obj.parentBillId = row.billId;
                        obj.parentId = -1;
                        obj.deliveryDate = '';
                        obj.product = '';
                        obj.sugar = 1;
                        obj.quantity = '';
                        obj.price = '';
                        obj.money = '';
                        obj.promotionCode = '';
                        obj.total = '';
                        obj.test = '';
                        obj.operate = '1';
                        obj.thugiaohang = '';
                        obj.note = '';
                        dataTemp.push(obj);
                    }
                    $table.bootstrapTable('load', dataTemp);

                }
                $('#modalTable').modal('show');
                disableEditableTable();
            } else if ('#cb_OrderType') { // Lẻ
                var $table = $('#tablePopupSingle');
                $('#dvHidden').css({ 'display': 'block' });
                initTableSinglePopup();
                var dataTemp = [];
                var objCustomer = {};
                var dataTabIndex = [];
                for (var i = 0; i < window.dataGlobal.length ; i++) {
                    if (window.dataGlobal[i].tabIndex == window.indexTab) {
                        dataTabIndex = window.dataGlobal[i].data;
                        break;
                    }
                }
                if (dataTabIndex.length > 0) {
                    for (var k = 0; k < dataTabIndex.length ; k++) {
                        if (dataTabIndex[k].billId == row.billId) {
                            dataTemp = dataTabIndex[k].detalMaster;
                            objCustomer = dataTabIndex[k].detalCustomer;
                            break;
                        }
                    }
                }

                if (objCustomer) {
                    $('#txtHoTenPopUp').val(objCustomer.name);
                    $('#txtSoDienThoaiPopUp').val(objCustomer.phone);
                    $('#txtDiaChiPopUp').val(objCustomer.address);
                    $('#txtDeliveryPopup').val(objCustomer.delivery);
                }
                if (dataTemp.length > 0) {
                    window.rowTemp = row;
                    $table.bootstrapTable('load', dataTemp);
                } else {
                    window.rowTemp = row;
                    var dataTemp = [];
                    $table.bootstrapTable('load', dataTemp);
                }
                $('#modalTableSingle').modal('show');
                $('#txtNgayGiaoHangLe').datepicker({
                    dateFormat: 'dd/mm/yyyy'
                });
            }

        });
        /************************************************
       ******** Popup Hóa đơn gói Grid 
       ************************************************/
        
        function initTablePopup() {
            var $table = $('#tablePopup');
            $('#tablePopup').bootstrapTable({
                columns: [{
                    field: 'id',
                    title: 'STT',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'deliveryDate',
                    title: 'Ngày giao hàng',
                    align: 'center',
                    valign: 'middle',
                    style: 'font-weight: bold',
                    fontWeight: 'bold',
                    editable: function (value, row, index) {
                        if (row.operate == -1) {
                            return false;
                        } else {
                            return true;
                        }
                    },
                    formatter: function (value, row, index) {
                        if (row.operate == -1) {
                            return '';
                        } else {
                            if (value == "") {
                                return ""
                            } else {
                                return value;
                            }
                        }
                    }

                },
                {
                    field: 'thugiaohang',
                    title: 'Thứ giao hàng',
                    align: 'center',
                    valign: 'middle',
                },
                {
                    field: 'product',
                    title: 'Sản phẩm',
                    align: 'center',
                    valign: 'middle',
                    editable: true
                },
                {
                    field: 'quantity',
                    title: 'Số lượng',
                    align: 'center',
                    valign: 'middle',
                    editable: true
                },
                {
                    field: 'price',
                    title: 'Giá sản phẩm',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'sugar',
                    title: 'Sugar',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        if (row.operate == "1") {
                            return "<label></label>";
                        } else {
                            if (row.sugar == "1") {
                                return '<input type="checkbox"  checked="checked" />';
                            } else {
                                return '<input type="checkbox"  />';
                            }

                        }
                    }
                },
                {
                    field: 'money',
                    title: 'Thành tiền',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'total',
                    title: 'Total',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'note',
                    title: 'Ghi chú',
                    align: 'center',
                    valign: 'middle',
                    editable: true,
                },
                {
                    field: 'operate',
                    title: 'Thao tác',
                    align: 'center',
                    valign: 'middle',
                    events: window.operateEventsPopup = {
                        'click .remove': function (e, value, row, index) {
                            operateEventsPopup(e, value, row, index);
                        }
                    },
                    formatter: operateFormatterPopup

                }],
                data: []
            });
            $table.on('check.bs.table', function (e, field, row, old, $el) {
                var x = "1";
            });
            $table.on('editable-save.bs.table', function (e, field, row, old, $el) {
                var $els = $table.find('.editable');
                next = $els.index($el) + 1;
                if (field == "deliveryDate") {
                    var deliveryDate = row.deliveryDate;
                    row.thugiaohang = convertDateToDay(deliveryDate);
                    $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                    disableEditableTable();
                }
                if (field == "note") {
                    $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                    disableEditableTable();
                }
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
                                disableEditableTable();
                            } else {
                                row.quantity = "";
                                row.price = "";
                                row.money = "";
                                row.total = "";
                                $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                                disableEditableTable();
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
                    disableEditableTable();
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
                                disableEditableTable();
                            }
                        },
                        error: function (err) {

                        }
                    });
                }

            });
        };
        $('#txtPromotionCode').on('change', function () {
            var formpromotionCode = new FormData();
            var json = { 'Code': $('#txtPromotionCode').val() };
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
                        var total = $('#txtTotalTienGoi').val().toString().split('.').join('');
                        total = total == "" ? Number('0') : Number(total);
                        $('#txtTotalTienGoi').val((total - (total * percent)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
                    }
                },
                error: function (err) {

                }
            });
        });
        function disableEditableTable() {
            var $table = $('#tablePopup');
            $tableRows = $table.find('tbody tr');
            tableData = $table.bootstrapTable('getData', true);
            $.each(tableData, function (i, row) {
                //that.$body.find('a[data-name="' + column.field + '"]').editable(column.editable)
                if (row.operate == "1") {
                    $tableRows.eq(i).find('a[data-name="' + 'product' + '"]').editable('toggleDisabled');
                    $tableRows.eq(i).find('a[data-name="' + 'quantity' + '"]').editable('toggleDisabled');
                    //$tableRows.eq(i).find('a[data-name="' + 'promotionCode' + '"]').editable('toggleDisabled');
                    $tableRows.eq(i).find('a[data-name="' + 'note' + '"]').editable('toggleDisabled');
                } else {
                    $tableRows.eq(i).find('a[data-name="' + 'deliveryDate' + '"]').editable('toggleDisabled');
                }
            });
        };
        function operateEventsPopup(e, value, row, index) {
            var $table = $('#tablePopup');
            if (row.operate == "1") {
                var data = $table.bootstrapTable('getData');
                var dataTemp = [];
                var position = -1;
                var parendId = -1;
                var parentBillId = -1;
                for (var i = 0; i < data.length ; i++) {
                    dataTemp.push(data[i]);
                    if (data[i].id == row.id) {
                        position = i;
                        parendId = i;
                        parentBillId = row.parentBillId;
                        break;
                    }
                }
                var obj = {};
                obj.id = -1; obj.parent = false; obj.deliveryDate = ''; obj.product = '';
                obj.sugar = 1; obj.quantity = ''; obj.price = ''; obj.money = ''; obj.promotionCode = '';
                obj.total = ''; obj.test = ''; obj.operate = '0';
                obj.parentBillId = parentBillId; obj.parentId = parendId + 1;
                obj.thugiaohang = ''; obj.note = '';
                dataTemp.push(obj);
                var k = position + 1;
                for (k ; k < data.length ; k++) {
                    if (data[k].parendId && parentId == parentId) {
                        //NOT PUSH
                    } else {
                        dataTemp.push(data[k]);
                    }
                }
                for (var n = 0; n < dataTemp.length ; n++) {
                    var m = n + 1;
                    dataTemp[n].id = m;
                }
                $table.bootstrapTable('removeAll');
                $table.bootstrapTable('load', dataTemp);

            } else {
                $('#tablePopup').bootstrapTable('remove', {
                    field: 'id',
                    values: [row.id]
                });
                var data = $table.bootstrapTable('getData');
                for (var i = 0; i < data.length ; i++) {
                    var k = i + 1;
                    data[i].id = k;
                }
                $table.bootstrapTable('load', data);
            }
            disableEditableTable();
        }
        function operateFormatterPopup(value, row, index) {
            if (value == "1") {
                return [
                 '<a class="remove" href="javascript:void(0)" title="Thêm mới">',
                'Thêm mới',
                '</a>',
                ].join('');
            } else {
                return [
                  '<a class="remove" href="javascript:void(0)" title="Thêm mới">',
                 'Xóa',
                 '</a>',
                ].join('');
            }

        }
        $('#btnPopup').on('click', function () {
            var $tablePopup = $('#tablePopup');
            var $table = $('#table');
            var dataPopup = $('#tablePopup').bootstrapTable('getData');
            var objCustomer = {};
            objCustomer.maKH = $("#txtMaKH1").val();
            objCustomer.hoTen = $("#txtHoTen1").val();
            objCustomer.ngaySinh = $("#txtNgaySinh1").val();
            objCustomer.soDienThoai = $("#txtSoDienThoai1").val();
            objCustomer.email = $("#txtEmailCustomer1").val();
            objCustomer.diaChi = $("#txtDiaChiCustomer").val("");
            objCustomer.maquan = $('#cb_quan1').val();
            if (dataPopup.length > 0) {
                /*
                var totalMoneyPopup = 0;
                for (var i = 0; i < dataPopup.length ; i++) {
                    var thanhtien = dataPopup[i].total.split('.').join('');
                    totalMoneyPopup += Number(thanhtien);
                }*/
                var total = 0;
                for (var m = 0; m < window.dataGlobal.length ; m++) {
                    var check = false;
                    if (window.dataGlobal[m].tabIndex == window.indexTab) {
                        check = true;
                    }
                    for (var k = 0; k < window.dataGlobal[m].data.length ; k++) {
                        if (check) {
                            if (window.dataGlobal[m].data[k].billId == dataPopup[0].parentBillId) {
                                //window.dataGlobal[m].data[k].fThanhTien = totalMoneyPopup.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                                window.dataGlobal[m].data[k].detalMaster = dataPopup;
                                window.dataGlobal[m].data[k].detailCustomer = objCustomer;
                                $table.bootstrapTable('updateRow', { index: window.dataGlobal[m].data[k].id - 1, row: window.dataGlobal[m].data[k] });
                            }
                        }
                        total += Number(window.dataGlobal[m].data[k].fThanhTien.split('.').join(''));
                    }
                }
                $('#txtTong').val(total.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));

            }
        });
        function initTableSinglePopup() {
            var $table = $('#tablePopupSingle');
            $('#tablePopupSingle').bootstrapTable({
                columns: [{
                    field: 'id',
                    title: 'STT',
                    align: 'center',
                    valign: 'middle',
                },
                {
                    field: 'product',
                    title: 'Sản phẩm',
                    align: 'center',
                    valign: 'middle',
                    editable: true
                },
                {
                    field: 'quantity',
                    title: 'Số lượng',
                    align: 'center',
                    valign: 'middle',
                    editable: true
                },
                {
                    field: 'price',
                    title: 'Giá sản phẩm',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'sugar',
                    title: 'Sugar',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        if (value) {
                            return '<input type="checkbox" value="" checked></label>';
                        } else {
                            return '<input type="checkbox" value=""></label>';
                        }

                    }
                },
                {
                    field: 'money',
                    title: 'Thành tiền',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'promotionCode',
                    title: 'Promotion Code',
                    align: 'center',
                    valign: 'middle',
                    editable: true
                },
                {
                    field: 'total',
                    title: 'Total',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'note',
                    title: 'Ghi chú',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'operate',
                    title: 'Thao tác',
                    align: 'center',
                    valign: 'middle',
                    events: window.operateEventsPopupSingle = {
                        'click .remove': function (e, value, row, index) {
                            var $table = $('#tablePopupSingle');
                            $('#tablePopupSingle').bootstrapTable('remove', {
                                field: 'id',
                                values: [row.id]
                            });
                        }
                    },
                    formatter: operateFormatterPopupSingle
                }],
                data: []
            });



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
        };
        $('#txtNgayGiaoHangLe').on('change', function () {
            var dateNgaygiaoHangLe = this.value;
            $("#txtThuGiaoHangLe").val(convertDateToDay(dateNgaygiaoHangLe));
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
        function operateFormatterPopupSingle(value, row, index) {
            return [
                '<a class="remove" href="javascript:void(0)" title="Thêm mới">',
               'Xóa',
               '</a>',
            ].join('');
        }
        $('#btnAddSingle').on('click', function () {
            var $table = $('#tablePopupSingle');
            var data = $('#tablePopupSingle').bootstrapTable('getData');
            var obj = {};
            obj.id = data.length + 1;;
            obj.parent = false;
            obj.parentBillId = window.rowTemp.billId;
            obj.parentId = -1;
            obj.deliveryDate = '';
            obj.product = '';
            obj.sugar = 1;
            obj.quantity = '';
            obj.price = '';
            obj.money = '';
            obj.promotionCode = '';
            obj.total = '';
            obj.test = '';
            obj.operate = '1';
            $table.bootstrapTable('append', [obj]);
        });
        $('#btnPopupSingle').on('click', function () {
            var $tablePopup = $('#tablePopupSingle');
            var $table = $('#table');
            var ngayGiaoHangLe = $("#txtNgayGiaoHangLe").val();
            var dataPopup = $('#tablePopupSingle').bootstrapTable('getData');
            var objCustomer = {};
            objCustomer.maKH = $("#txtMaKH1").val();
            objCustomer.hoTen = $("#txtHoTen1").val();
            objCustomer.ngaySinh = $("#txtNgaySinh1").val();
            objCustomer.soDienThoai = $("#txtSoDienThoai1").val();
            objCustomer.email = $("#txtEmailCustomer1").val();
            objCustomer.diaChi = $("#txtDiaChiCustomer").val("");
            objCustomer.maquan = $('#cb_quan1').val();
            if (dataPopup.length > 0) {
                var totalMoneyPopup = 0;
                for (var i = 0; i < dataPopup.length ; i++) {
                    var thanhtien = dataPopup[i].total.split('.').join('');
                    totalMoneyPopup += Number(thanhtien);
                }
                var total = 0;
                for (var m = 0; m < window.dataGlobal.length ; m++) {
                    var check = false;
                    if (window.dataGlobal[m].tabIndex == window.indexTab) {
                        check = true;
                    }
                    for (var k = 0; k < window.dataGlobal[m].data.length ; k++) {
                        if (check) {
                            if (window.dataGlobal[m].data[k].billId == dataPopup[0].parentBillId) {
                                window.dataGlobal[m].data[k].fThanhTien = totalMoneyPopup.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                                window.dataGlobal[m].data[k].detalMaster = dataPopup;
                                window.dataGlobal[m].data[k].detailCustomer = objCustomer;
                                window.dataGlobal[m].data[k].ngayGiaoHangLe = ngayGiaoHangLe;
                                $table.bootstrapTable('updateRow', { index: window.dataGlobal[m].data[k].id - 1, row: window.dataGlobal[m].data[k] });
                            }
                        }
                        total += Number(window.dataGlobal[m].data[k].fThanhTien.split('.').join(''));
                    }
                }
                $('#txtTong').val(total.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
            }
        });
        /*****
        ******* Upload file Excel *****
        *******/
        $('#btnUpload').on('click', function () {
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
            var file = document.getElementById("txtFile");
            var files = file.files;
            var obj = {};
            var formBill = new FormData();
            formBill.append('type', 'uploadFile');
            formBill.append('file', files[0]);
            formBill.append('data', JSON.stringify(obj));
            $.ajax({
                url: "Configuation/HandlerInsertBill.ashx",
                type: "POST",
                data: formBill,
                contentType: false,
                processData: false,
                success: function (result) {
                    var x = result;
                    var index = 0;
                    var dataTemp = [];
                    for (var i = 1; i < result.length ; i++) {
                        var obj = {};
                        if (result[i].Column1 && result[i].Column1 != "") {
                            index = i;
                            obj.id = index;
                            obj.parent = true;
                            obj.parentBillId = window.indexGoi;
                            obj.parentId = -1;
                            obj.deliveryDate = formatDateTime(result[i].Column1);
                            obj.thugiaohang = convertDateToDay(result[i].Column1);
                            obj.product = '';
                            obj.sugar = 0;
                            obj.quantity = '';
                            obj.price = '';
                            obj.money = '';
                            obj.promotionCode = '';
                            obj.total = '';
                            obj.test = '';
                            obj.operate = '1';
                            obj.thugiaohang = '';
                            obj.note = '';
                        } else {
                            obj.id = i;
                            obj.parent = false;
                            obj.parentBillId = window.indexGoi;
                            obj.parentId = index;
                            obj.deliveryDate = "";
                            obj.thugiaohang = "";
                            obj.product = result[i].Column3;
                            obj.sugar = result[i].Column6 ? result[i].Column6 : 0;
                            obj.quantity = result[i].Column4;
                            obj.price = '0';
                            obj.money = '0';
                            obj.promotionCode = '0';
                            obj.total = '0';
                            obj.test = '';
                            obj.operate = '0';
                            obj.thugiaohang = '';
                            obj.note = '';
                        }
                        dataTemp.push(obj);
                    }
                    $('#tablePopup').bootstrapTable('load', dataTemp);
                    disableEditableTable();
                },
                error: function (err) {

                }
            });

        });
        });
        </script>
</asp:Content>
