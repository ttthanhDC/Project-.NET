<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LT001V2Demo.aspx.cs" Inherits="SYSGREEN.LT001V2Demo" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner">
        <div id="contactForm">
      <div class="form-horizontal">
        <div class="form-group">
           <label for="sel1" class="col-md-1">Nguồn</label>
            <div class="col-md-2">
                <select class="form-control" id="cb_SourceType"></select>
                <!--
                <select class="form-control" id="cb_SourceType">
                            <option value ="1">Facebook</option>
                            <option value ="2">Zalo</option>
                 </select> -->
            </div>
            <label for="sel1" class="col-md-2">Mã khách hàng</label>
            <div class="col-md-3">
                <input type="text" class="form-control" name="title" id="txtMaKH" disabled/>
            </div>
            <label for="sel1" class="col-md-2">Mã Reservation</label>
            <div class="col-md-2">
                <input type="text" class="form-control" name="title" id="txtMaHD" disabled />
            </div>
        </div> 
    </div>  
     <div class="form-horizontal">
        <div class="form-group">
           <label for="sel1" class="col-md-1"></label>
            <div class="col-md-2">
               
            </div>
            <label for="sel1" class="col-md-2">Họ và tên</label>
            <div class="col-md-3">
                <input type="text" class="form-control" name="title" id="txtHoTen" />
            </div>
            <label for="sel1" class="col-md-2">Số ngày còn lại</label>
            <div class="col-md-2">
                <input type="text" class="form-control" name="title" id="txtSoNgayConLai" disabled />
            </div>
        </div> 
    </div>
     <div class="form-horizontal">
        <div class="form-group">
           <label for="sel1" class="col-md-1"></label>
            <div class="col-md-2">
               
            </div>
            <label for="sel1" class="col-md-2">Ngày sinh</label>
            <div class="col-md-3">
                <input type="text" placeholder="DD/MM/YYYY"  class="form-control" name="title" id="txtNgaySinh" />
            </div>
            <label for="sel1" class="col-md-2">Tổng</label>
            <div class="col-md-2">
                <input type="text" class="form-control" name="title" id="txtTong" disabled />
            </div>
        </div> 
    </div>
     <div class="form-horizontal">
        <div class="form-group">
           <label for="sel1" class="col-md-1"></label>
            <div class="col-md-2">
               
            </div>
            <label for="sel1" class="col-md-2">Số điện thoại</label>
            <div class="col-md-3">
                <input type="text" class="form-control" name="title" id="txtSoDienThoai" />
            </div>
            <label for="sel1" class="col-md-2">Số tiền thu được</label>
            <div class="col-md-2">
                 <input type="text" class="form-control" name="title" id="txtSoTienThuDuoc" value='0' disabled />
            </div>
        </div> 
    </div>
     <div class="form-horizontal">
        <div class="form-group">
           <label for="sel1" class="col-md-1"></label>
            <div class="col-md-2">
               
            </div>
            <label for="sel1" class="col-md-2">Email</label>
            <div class="col-md-3">
               <input type="text" class="form-control" name="title" id="txtEmailCustomer" />
            </div>
            <label for="sel1" class="col-md-2">Chiết khấu</label>
            <div class="col-md-2">
                 <input type="text" class="form-control" name="title" id="txtChietKhau" disabled/>
            </div>
        </div> 
    </div>
      <div class="form-horizontal">
        <div class="form-group">
           <label for="sel1" class="col-md-1"></label>
            <div class="col-md-2">
               
            </div>
            <label for="sel1" class="col-md-2">Địa chỉ</label>
            <div class="col-md-3">
               <input type="text" class="form-control" name="title" id="txtDiaChiCustomer" />
            </div>
            <label for="sel1" class="col-md-2">Còn Nợ</label>
            <div class="col-md-2">
                 <input type="text" class="form-control" name="title" id="txtNo" value='0' disabled/>
            </div>
        </div> 
       <div class="form-group">
            <div class="col-md-12 col-md-offset-3">
            <div id="messages"></div>
       </div>
    </div>
    </div>
        <div class="form-horizontal">
        <div class="form-group">
           <label for="sel1" class="col-md-1"></label>
            <div class="col-md-2">
               
            </div>
            <label for="sel1" class="col-md-2">Quận</label>
            <div class="col-md-3">
                <select class="form-control" id="cb_quan"></select>
            </div>
            <label for="sel1" class="col-md-2"></label>
            <div class="col-md-2">
            </div>
        </div> 
    </div>
             </div>
        <hr style="color:blue;width:80%;text-align:center"/>
        <script id="tabTemp" type="text/x-jquery-tmpl"> 
    <div class='tab-pane' id='tab${device}'>
        <div>
            <a href="#" class="btn btn-danger btn-remove btnRmv">Huỷ đơn</a>
        </div>
    </div>
</script>
<script id="navTemp" type="text/x-jquery-tmpl"> 
    <li class="li-tab-toggle">
        <a href="#tab${device}" class="tab-toggle" data-toggle="tab">
            Đơn <span class="dev-nr"></span>
        </a>
    </li>
</script>
<script id="dropTemp" type="text/x-jquery-tmpl"> 
    <li class="dropdown">
        <a href="#" data-toggle="dropdown" class="dropdown-toggle">
            More Devices <b class="caret"></b>
        </a>
        <ul class="dropdown-menu" id="drop"></ul>
    </li>
</script>

<a href="#" class="btn btn-primary" id="btnAddBill">Thêm đơn</a>
<ul class="nav nav-tabs" id="tabs">
    <li class="li-tab-toggle active"><a class="tab-toggle" href="#tab1" data-toggle="tab">Master Đơn 001</a></li>
</ul>
<div class="tab-content">
    <div class="tab-pane active" id="tab1"></div>
</div>
        <div style ="height:50px"></div>  
        
         <div id="contactHD">
             <div class="form-horizontal">
                <div class="form-group">
                   <label for="sel1" class="col-md-3">Loại hình đơn</label>
                    <div class="col-md-3">
                        <select class="form-control" id="cb_OrderType">
                            <option value ="-1"></option>
                            <option value ="1">Gói</option>
                            <option value ="2">Đơn lẻ</option>
                         </select>
                    </div>
                    <label for="sel1" class="col-md-3" id="lblMaKH">Mã khách hàng</label>
                    <div class="col-md-3" id="divMaKH">
                        <input type="text" class="form-control" name="title" id="txtMaKH1" disabled/>
                    </div>
            </div> 
            <div class="form-horizontal">
                <div class="form-group">
                   <label for="sel1" class="col-md-3" id="lbLoaiGoi">Loại gói</label>
                   <div class="col-md-3">
                        <select class="form-control" id="cb_OrderType2">
                            <option value ="-1"></option>
                            <option value ="2">Gói 2 ngày </option>
                            <option value ="3">Gói 3 ngày </option>
                            <option value ="4">Gói 4 ngày </option>
                            <option value ="5">Gói 5 ngày </option>
                            <option value ="6">Gói 6 ngày </option>
                            <option value ="7">Gói 7 ngày </option>
                        </select>
                    </div>
                    <label for="sel1" class="col-md-3" id="lblHoTen">Họ và tên</label>
                    <div class="col-md-3" id="divHoTen">
                        <input type="text" class="form-control" name="title" id="txtHoTen1" />
                    </div>
                </div> 
            </div>  
            <div class="form-horizontal">
                <div class="form-group">
                   <label for="sel1" class="col-md-3" id="lblPhiShip">Phí Ship</label>
                   <div class="col-md-3">
                        <input type="text" class="form-control" name="title" id="txt_PhiShip" />
                    </div>
                    <label for="sel1" class="col-md-3" id="lblNgaySinh">Ngày sinh</label>
                    <div class="col-md-3" id="divNgaySinh">
                        <input type="text" placeholder="dd/mm/yyyy"  class="form-control" name="title" id="txtNgaySinh1" />
                    </div>
                </div> 
            </div>  
             <div class="form-horizontal">
                <div class="form-group">
                   <label for="sel1" class="col-md-3">Thanh toán</label>
                   <div class="col-md-3">
                       <select class="form-control" id="cb_PayType">
                            <option value = "-1"></option>
                            <option value = "Tiền mặt">Tiền mặt</option>
                            <option value = "Chuyển khoản">Chuyển khoản</option>
                      </select>
                    </div>
                    <label for="sel1" class="col-md-3" id="lblSoDT">Số điện thoại</label>
                    <div class="col-md-3" id="divSoDT">
                        <input type="text" class="form-control" name="title" id="txtSoDienThoai1" />
                    </div>
                </div> 
             </div>  
              <div class="form-horizontal">
                <div class="form-group">
                   <label for="sel1" class="col-md-3"></label>
                   <div class="col-md-3">
                      
                    </div>
                    <label for="sel1" class="col-md-3" id="lblEmail">Email</label>
                    <div class="col-md-3" id="divEmail">
                        <input type="text" class="form-control" name="title" id="txtEmailCustomer1" />
                    </div>
                </div> 
            </div>  
             <div class="form-horizontal">
                <div class="form-group">
                   <label for="sel1" class="col-md-3"></label>
                   <div class="col-md-3">
                      
                    </div>
                    <label for="sel1" class="col-md-3" id="lblDiaChi">Địa chỉ</label>
                    <div class="col-md-3" id="divDiaChi">
                        <input type="text" class="form-control" name="title" id="txtDiaChiCustomer1" />
                    </div>
                </div> 
            </div>  
            <div class="form-horizontal">
                <div class="form-group">
                   <label for="sel1" class="col-md-3"></label>
                   <div class="col-md-3">
                      
                    </div>
                    <label for="sel1" class="col-md-3">Quận</label>
                    <div class="col-md-3">
                        <select class="form-control" id="cb_quan1"></select>
                    </div>
                </div> 
            </div> 
         </div>
        <div class="row" style="margin-left : 30px; margin-right : 30px">

        </div> 
        
    <div style ="text-align:center;display: table;margin: 0 auto;">
       <button type="button" class="btn btn-primary" id="btnAdd">Thêm</button>
       <button type="button" class="btn btn-primary" id="btnTackBill" style="margin-left:10px;">Tách bill</button>
    </div>
</div>
<div style ="height:40px"></div>
<div style="margin-left : 30px; margin-right : 30px">
    <table id="table" 
        data-search="true" 
        data-show-refresh="true" 
    ></table>
</div>
<div style="text-align:center;display: table;margin-top: 10px;margin-left: 50%;">
    <button type="button" class="btn btn-primary" id="btnSave">Lưu đơn hàng</button>
</div>
<div class="modal fade" id="modalTable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 1200px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Thông tin gói đơn hàng</h4>
                    </div>
                    <div class="modal-body">
                        <table id="tablePopup" 
                            data-id-field="undefined"
                            data-unique-id="undefined"
                            data-show-refresh="true">
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnPopup">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
   </div><!-- /.modal -->

    <div class="modal fade" id="modalTableSingle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 1200px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Thông tin gói đơn hàng lẻ</h4>
                    </div>
                    <div class="modal-body">
                        <div id="dvHidden">
                        </div>
                        <button type="button" class="btn btn-primary"  id="btnAddSingle">Thêm mới </button>
                        <table id="tablePopupSingle" 
                            data-id-field="undefined"
                            data-unique-id="undefined"
                            data-show-refresh="true">
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnPopupSingle">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
   </div><!-- /.modal -->
    
<script>
    // Bootstrap Table
    $(function () {
        var maxTabs = 50, index = 1;
        var lstTable = [];
        var dataGlobal  = [];
        window.dataGlobal = [];
        window.indexTab = 0;
        /************************************************
        ******** Load Content Form
        ************************************************/
        loadContent();
        function loadContent() {
            LoadComboBoxNguon();
            LoadComboBoxQH();
            validateKhachHang();
            eventKhachHang();
            addHoaDon();
            indexTab = 0;
            updateComponent(0);
        };
        // validateKhachHang
        function validateKhachHang() {
            $('#contactForm').bootstrapValidator({
                container: '#messages',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    txtHoTen: {
                        validators: {
                            notEmpty: {
                                message: 'Họ tên là thông tin bắt buộc không được để trống'
                            }
                        }
                    },
                    txtNgaySinh: {
                        validators: {
                            date: {
                                format: 'MM/DD/YYYY',
                                message: 'Format ngày sinh không đúng!'
                            },
                        }
                    },
                    txtSoDienThoai: {

                        validators: {
                            notEmpty: {
                                message: 'Số điện thoại là thông tin bắt buộc không được để trống'
                            },
                            stringLength: {
                                max: 15,
                                message: 'The title must be less than 15 characters long'
                            }
                        }
                    },

                    txtSoDienThoai: {

                        validators: {
                            notEmpty: {
                                message: 'Số điện thoại là thông tin bắt buộc không được để trống'
                            },
                            stringLength: {
                                max: 15,
                                message: 'The title must be less than 15 characters long'
                            }
                        }
                    },
                    txtEmailCustomer: {

                        validators: {
                            emailAddress: {
                                message: 'Địa chỉ Email không đúng định dạng'
                            },
                            regexp: {
                                regexp: '^[^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
                                message: 'Địa chỉ Email không đúng định dạng'
                            }
                        }
                    },

                    content: {
                        validators: {
                            notEmpty: {
                                message: 'The content is required and cannot be empty'
                            },
                            stringLength: {
                                max: 500,
                                message: 'The content must be less than 500 characters long'
                            }
                        }
                    }
                }
            });
        };
        // LoadComboBoxNguon
        function LoadComboBoxNguon() {
            var formSource = new FormData();
            var json = { 'ID': 0 };
            formSource.append('type', 'getData');
            formSource.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerSysSource.ashx",
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
                            obj.name = objectData.Source_Name;
                            obj.link = objectData.ID;
                            obj.sub = null;
                            arr.push(obj);
                        }
                    }
                    var data1 = { menu: arr };
                    var $menu = $("#cb_SourceType");
                    $.each(data1.menu, function () {
                        $menu.append(getSource(this));
                    });
                },
                error: function (err) {

                }
            });
        };
        // Get Source Quan Huyen
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
                    var $menu = $("#cb_quan");
                    var $menu1 = $("#cb_quan1");
                    $.each(data1.menu, function () {
                        $menu.append(getSource(this));
                        $menu1.append(getSource(this));
                    });
                },
                error: function (err) {

                }
            });
        };
        // getSource
        function getSource(itemData) {
            var item = $("<option value='" + itemData.link + "'>")
                .append(itemData.name);
            return item;
        };
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
            $('#txtSoDienThoai1').on('change', function () {
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
                            $('#txtMaKH1').val("KH" + (objectData.ID < 10 ? ('0' + objectData.ID.toString()) : objectData.ID.toString()));
                            $('#txtHoTen1').val(objectData.CustomerName);
                            $('#txtNgaySinh1').val(formatDateTime(objectData.BirthDay));
                            document.getElementById('txtEmailCustomer1').value = objectData.Email;
                            document.getElementById('txtDiaChiCustomer1').value = objectData.Address;
                            $("#cb_quan1 option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');
                        }
                            /*
                        else {
                            $('#txtMaKH1').val('');
                            $('#txtHoTen1').val('');
                            $('#txtNgaySinh1').val('');
                            document.getElementById('txtEmailCustomer1').value = '';
                            document.getElementById('txtDiaChiCustomer1').value = '';
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
            $('#txtEmailCustomer1').on('change', function () {
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
                            $('#txtMaKH1').val("KH" + (objectData.ID < 10 ? ('0' + objectData.ID.toString()) : objectData.ID.toString()));
                            $('#txtHoTen1').val(objectData.CustomerName);
                            $('#txtNgaySinh1').val(formatDateTime(objectData.BirthDay));
                            document.getElementById('txtSoDienThoai1').value = objectData.PhoneNumber;
                            document.getElementById('txtDiaChiCustomer1').value = objectData.Address;
                            $("#cb_quan1 option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');
                        } else {
                            /*
                            $('#txtMaKH1').val('');
                            $('#txtHoTen1').val('');
                            $('#txtNgaySinh1').val('');
                            document.getElementById('txtSoDienThoai1').value = '';
                            document.getElementById('txtDiaChiCustomer1').value = '';*/
                        }
                    },
                    error: function (err) {

                    }
                });
            });
        };
        // event add Hoa Don
        function hiddenInfoKH() {
            $("#div_cb_OrderType2").css("display", "block");
            $("#lbLoaiGoi").css("display", "block");
            $("#div_PhiShip").css("display", "none");
            $("#lblPhiShip").css("display", "none");
        };
        function addHoaDon() {
            $('#btnAddBill').click(function (e) {
                e.preventDefault();
                index++;
                $('.tab-toggle').length !== maxTabs ||
                    $('#tabs').append($.tmpl(dropTemp))
                    .find('#drop').append($('.li-tab-toggle:last').removeClass('active'));

                $.tmpl(navTemp, { "device": index }).insertAfter('.li-tab-toggle:last');
                $.tmpl(tabTemp, { "device": index }).appendTo('.tab-content');
                $('.li-tab-toggle:last a').tab('show');
                lstTable.push({ 'lst': [] });
                updateTabs();
            });

            $(document).on('click', '.btnRmv', function (e) {
                var tabs = $('.li-tab-toggle').length,
                    nav = $('.li-tab-toggle.active');

                nav.parent('#tabs').find('#drop li:first').insertBefore('#tabs .dropdown');
                tabs !== maxTabs + 1 || $('#drop li').insertBefore('#tabs .dropdown').siblings('.dropdown').remove();

                $('a', nav.is('li:last') ? nav.prev() : nav.next()).tab('show');
                nav.add($('a', nav).attr('href')).remove();
                lstTable.splice(lstTable.length - 1);
                updateTabs();
            });

            function updateTabs() {
                for (var i = 0; i < $('.tab-toggle').length; i++) {
                    var index = i + 1;
                    var strIndex = (index < 10 ? "00" + index : "0" + index);
                    $('.tab-toggle:eq(' + i + ') .dev-nr, .tab-pane:eq(' + i + ') .dev-nr').text(strIndex);
                    $('.tab-toggle:eq(' + i + ')').attr("id", i);
                }
                window.indexTab = $('.tab-toggle').length - 1;
                updateComponent($('.tab-toggle').length -1);
            }

            $('#tabs').click('tabsselect', function (event, ui) {
                var index = event.toElement.id;
                if (index == "tabs" || index == "") {
                    // Không làm gì hết !
                } else {
                    window.indexTab = parseInt(index);
                    updateComponent(parseInt(index));
                }
               
            });

           
        };
        /************************************************
        ******** Hóa đơn Grid 
        ************************************************/
        // Init Component in 1 Tab
        function initComponent(index) {
            initGridChiTietDonHang();
            loadDataGridChiTietDonHang(index);
            loadDataCustomer();
            if (window.indexTab <= 0) {
                eventAddChiTietDonHang();
            }
        };
        // Init GridChiTietDonHang  in 1 Tab
        function initGridChiTietDonHang(){
            $('#table').bootstrapTable({
                columns: [
                    {
                        field: 'fSTT',
                        title: 'STT',
                        align: 'center',
                        valign: 'middle',
                    },
                    {
                        field: 'fLoaiHinhDon',
                        title: 'Loại hình đơn',
                        align: 'center',
                        valign: 'middle',
                        events: window.typeBillEvents = {
                            'click .product': function (e, value, row, index) {
                                eventLinkPopup(e, value, row, index);
                            }
                        },
                        formatter: billFormatter
                    },
                    {
                        field: 'fLoaiGoi',
                        title: 'Loại gói',
                        align: 'center',
                        valign: 'middle',
                        
                    },
                    {
                        field: 'fPhiShip',
                        title: 'Phí Ship',
                        align: 'center',
                        valign: 'middle',
                    },
                    {
                        field: 'fLoaiThanhToan',
                        title: 'Loại thanh toán',
                        align: 'center',
                        valign: 'middle',
                        fontWeight: 'bold'
                    },
                    {
                         field: 'fThanhTien',
                         title: 'Thành tiền',
                         align: 'center',
                         valign: 'middle',
                         editable: false,
                    },
                    {
                         field: 'fThaoTac',
                         title: 'Thao tác',
                         align: 'center',
                         valign: 'middle',
                         events: window.operateEvents = {
                             'click .remove': function (e, value, row, index) {
                                 $('#table').bootstrapTable('remove', {
                                     field: 'fSTT',
                                     values: [row.fSTT]
                                 });
                             }
                         },
                         formatter: operateFormatter

                    }
                ],
                data: []
            });

           
        };
        // Format Field Grid
        function operateFormatter(value, row, index) {
            return [
                 '<a class="remove" href="javascript:void(0)" title="Xoá">',
                'Xóa',
                '</a>',
            ].join('');
        }
        // Format Field Grid
        function billFormatter(value, row, index) {
            return [
                '<a class="product" href="javascript:void(0)" title="Thông tin gói">',
                    value,
                '</a>',
            ].join('');
        }
        // Update updateComponent
        function updateComponent(index) {
            initComponent(index);
        };
        function loadDataGridChiTietDonHang(index) {
            $table = $('#table');
            if (window.dataGlobal.length > 0) {
                var check = false;
                for (var i = 0 ; i < window.dataGlobal.length ; i++) {
                    if (window.dataGlobal[i].tabIndex == window.indexTab) {
                        $table.bootstrapTable('load', window.dataGlobal[i].data);
                        check = true;
                        break;
                    }
                }
                if (!check) {
                    $table.bootstrapTable('load', []);
                }
            } else {
                $table.bootstrapTable('load', []);
            }
        };
        function loadDataCustomer() {
            if (window.dataGlobal.length > 0) {
                var check = false;
                var infoKH = null;
                for (var i = 0 ; i < window.dataGlobal.length ; i++) {
                    if (window.dataGlobal[i].tabIndex == window.indexTab) {
                        //$table.bootstrapTable('load', window.dataGlobal[i].data);
                        check = true;
                        infoKH = window.dataGlobal[i].infoKH;
                        $('#txtMaKH1').val(infoKH.maKH);
                        $('#txtHoTen1').val(infoKH.hoTen);
                        $('#txtNgaySinh1').val(formatDateTime(infoKH.ngaySinh));
                        $('#txtSoDienThoai1').val(infoKH.soDienThoai)
                        document.getElementById('txtEmailCustomer1').value = infoKH.email;
                        document.getElementById('txtDiaChiCustomer1').value = infoKH.diaChi;
                        $("#cb_quan1 option[value=" + objectData.maquan + "]").attr('selected', 'selected');
                        break;
                    }
                }
                
            } else {
                //$table.bootstrapTable('load', []);
            }
        };
        function eventAddChiTietDonHang(index) {
            //$("#div_PhiShip").css("dedplay", "none");
            // onchage select box 
            $('#cb_OrderType').on('change', function () {
                if (this.value == "1") {
                    $('#txt_PhiShip').attr('disabled', 'disabled');
                } else {
                    $('#txt_PhiShip').removeAttr('disabled');
                }
            })
        };
        $('#btnAdd').on('click', function () {
            var $table = $('#table');
            //$table.bootstrapTable('insertRow', { index: 1, row: row });
            var obj = {};
            var check = true;
            if ($('#cb_OrderType').val() == -1) {
                alert('Vui lòng chọn loại hình đơn !');
                check = false;
                return;
            }
            if ($('#cb_billType').val() != -1) {
                if ($('#cb_OrderType').val() == 1) {
                    if ($('#cb_OrderType2').val() == -1) {
                        alert('Vui lòng chọn loại gói !');
                        check = false;
                        return;
                    }
                } else if ($('#cb_OrderType').val() == 2) {
                    if ($('#txt_PhiShip').val() == "") {
                        alert('Vui lòng nhập phí ship !');
                        check = false;
                        return;
                    }
                }
            }
            if ($('#cb_PayType').val() == -1) {
                alert('Vui lòng chọn hình thức thanh toán !');
                check = false;
                return;
            }

            if (check) {
                var data = $table.bootstrapTable('getData');
                obj.fSTT = data.length + 1;
                obj.fLoaiHinhDon = $('#cb_OrderType :selected').text();
                obj.fLoaiHinhDonId = $('#cb_OrderType').val();
                if (obj.fLoaiHinhDonId == 1) {
                    obj.fLoaiGoi = $('#cb_OrderType2 :selected').text();
                    obj.fLoaiGoiId = $('#cb_OrderType2').val();
                    obj.fPhiShip = "0";
                } else {
                    obj.fLoaiGoi = "....";
                    obj.fLoaiGoiId = 1;
                    obj.fPhiShip = $('#txt_PhiShip').val().toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.") + " VNĐ";

                }

                obj.fLoaiThanhToan = $('#cb_PayType :selected').text();
                obj.fLoaiThanhToanId = $('#cb_PayType').val();
                obj.fThanhTien = "0";
                obj.detalMaster = [];
                if ($('#cb_OrderType :selected').text() == 'Gói') {
                    var songayconlai = $('#txtSoNgayConLai').val() != "" ? $('#txtSoNgayConLai').val() : '0'
                    songayconlai = Number(songayconlai) + parseInt($('#cb_OrderType2').val());
                    $('#txtSoNgayConLai').val(songayconlai);
                } else {
                    var songayconlai = $('#txtSoNgayConLai').val() != "" ? $('#txtSoNgayConLai').val() : '0';
                    songayconlai = Number(songayconlai) + 1;
                    $('#txtSoNgayConLai').val(songayconlai);
                }
                //Harcode
                if (window.dataGlobal.length > 0) {
                    var check = false;
                    for (var i = 0; i < window.dataGlobal.length ; i++) {
                        if (window.dataGlobal[i].tabIndex == window.indexTab) {
                            obj.billId = window.dataGlobal[i].data.length;
                            window.dataGlobal[i].data.push(obj);
                            $table.bootstrapTable('load', window.dataGlobal[i].data);
                            check = true;
                            break;
                        }
                    }
                    if (!check) {
                        var infoKH = {};
                        if (window.indexTab == 0) {
                            infoKH.maKH = $('#txtMaKH').val();
                            infoKH.hoTen = $('#txtHoTen').val();
                            infoKH.ngaySinh = $('#txtNgaySinh').val();
                            infoKH.soDienThoai = $('#txtSoDienThoai').val();
                            infoKH.soDienThoai = document.getElementById('txtSoDienThoai').value;
                            infoKH.email = document.getElementById('txtEmailCustomer').value;
                            infoKH.diaChi = document.getElementById('txtDiaChiCustomer').value;
                            infoKH.maquan = $('cb_quan').val();
                            infoKH.billId = 0;
                        } else {
                            infoKH.maKH = $('#txtMaKH1').val();
                            infoKH.hoTen = $('#txtHoTen1').val();
                            infoKH.ngaySinh = $('#txtNgaySinh1').val();
                            infoKH.soDienThoai = $('#txtSoDienThoai1').val();
                            infoKH.soDienThoai = document.getElementById('txtSoDienThoai1').value;
                            infoKH.email = document.getElementById('txtEmailCustomer1').value;
                            infoKH.diaChi = document.getElementById('txtDiaChiCustomer1').value;
                            infoKH.maquan = $('cb_quan1').val();
                            infoKH.billId = 0;
                        }
                        window.dataGlobal.push({ 'tabIndex': window.indexTab, 'data': [obj], 'infoKH': infoKH, 'isMaster': window.indexTab == 0 ? true : false });
                        $table.bootstrapTable('append', [obj]);
                    }
                } else {
                    obj.billId = 0;
                    var infoKH = {};
                    if (window.indexTab == 0) {
                        infoKH.maKH = $('#txtMaKH').val();
                        infoKH.hoTen = $('#txtHoTen').val();
                        infoKH.ngaySinh = $('#txtNgaySinh').val();
                        infoKH.soDienThoai = $('#txtSoDienThoai').val();
                        infoKH.soDienThoai = document.getElementById('txtSoDienThoai').value;
                        infoKH.email = document.getElementById('txtEmailCustomer').value;
                        infoKH.diaChi = document.getElementById('txtDiaChiCustomer').value;
                        infoKH.maquan = $('cb_quan').val();
                        infoKH.billId = 0;
                    } else {
                        infoKH.maKH = $('#txtMaKH1').val();
                        infoKH.hoTen = $('#txtHoTen1').val();
                        infoKH.ngaySinh = $('#txtNgaySinh1').val();
                        infoKH.soDienThoai = $('#txtSoDienThoai1').val();
                        infoKH.soDienThoai = document.getElementById('txtSoDienThoai1').value;
                        infoKH.email = document.getElementById('txtEmailCustome1r').value;
                        infoKH.diaChi = document.getElementById('txtDiaChiCustomer1').value;
                        infoKH.maquan = $('cb_quan1').val();
                        infoKH.billId = 0;
                    }
                    window.dataGlobal.push({ 'tabIndex': window.indexTab, 'data': [obj], 'infoKH': infoKH, 'isMaster': window.indexTab == 0 ? true : false});
                    $table.bootstrapTable('append', [obj]);
                }
                //$table.bootstrapTable('insertRow', { index: obj.stt, row: obj });

            }
        });
        function eventLinkPopup(e, value, row, index) {
            if (row.fLoaiHinhDonId == 1) { // Gói
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
                    for (var m = 0; m < n; m++) {
                        var obj = {};
                        obj.id = m;
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
                        dataTemp.push(obj);
                    }
                    $table.bootstrapTable('load', dataTemp);
                }
                $('#modalTable').modal('show');
            } else if (row.fLoaiHinhDonId == 2) { // Lẻ
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
            }
            
        };
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
                    editable: function(value, row, index){
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

                }, {
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
                        return '<input type="checkbox" value=""></label>';
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
                    editable: true,
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
                    events: window.operateEventsPopup = {
                        'click .remove': function (e, value, row, index) {
                            operateEventsPopup(e, value, row, index);
                        }
                    },
                    formatter: operateFormatterPopup

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
                                $table.bootstrapTable('updateRow', { index: window.dataGlobal[m].data[k].id - 1, row: window.dataGlobal[m].data[k] });
                            }
                        }
                        total += Number(window.dataGlobal[m].data[k].fThanhTien.split('.').join(''));
                    }
                }
                $('#txtTong').val(total.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
                
            }
        });
        /************************************************
        ******** Popup Hóa đơn lẻ Grid 
        ************************************************/
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
                    events:  window.operateEventsPopupSingle = {
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
            var dataPopup = $('#tablePopupSingle').bootstrapTable('getData');
            var objCustomer = {};
            objCustomer.name = $('#txtHoTenPopUp').val();
            objCustomer.phone = $('#txtSoDienThoaiPopUp').val();
            objCustomer.address = $('#txtDiaChiPopUp').val();
            objCustomer.delivery = $('#txtDeliveryPopup').val();
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
                                $table.bootstrapTable('updateRow', { index: window.dataGlobal[m].data[k].id - 1, row: window.dataGlobal[m].data[k] });
                            }
                        }
                        total += Number(window.dataGlobal[m].data[k].fThanhTien.split('.').join(''));
                    }
                }
                $('#txtTong').val(total.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
            }
        });
        /*************************************************
        ******** Save Hóa đơn 
        *************************************************/
        $('#btnSave').on('click', function () {
            var obj = {};
            obj.maKH = $('#txtMaKH').val();
            obj.hoTen = $('#txtHoTen').val();
            obj.ngaySinh = $('#txtNgaySinh').val();
            obj.soDienThoai = $('#txtSoDienThoai').val();
            obj.soDienThoai = document.getElementById('txtSoDienThoai').value;
            obj.email = document.getElementById('txtEmailCustomer').value;
            obj.diaChi = document.getElementById('txtDiaChiCustomer').value;
            obj.maquan = $('#cb_quan').val();
            var bill = {};
            bill.sourceName = $('#cb_SourceType :selected').text();
            bill.sourceId = $('#cb_SourceType').val();
            bill.songayconlai = $('#txtSoNgayConLai').val();
            bill.tong = $('#txtTong').val().split('.').join('');
            bill.sotienthuduoc = $('#txtSoTienThuDuoc').val() != "" ? $('#txtSoTienThuDuoc').val().split('.').join('') : '0'
            bill.chietkhau = $('#txtChietKhau').val() != "" ? $('#txtChietKhau').val().split('.').join('') : '0'
            bill.conNo = $('#txtNo').val() != "" ? $('#txtNo').val().split('.').join('') : '0'
            bill.inFoCustomer = obj;
            bill.infoBill = window.dataGlobal;
            var formBill = new FormData();
            formBill.append('type', 'insert');
            formBill.append('data', JSON.stringify(bill));
            $.ajax({
                url: "Configuation/HandlerInsertBill.ashx",
                type: "POST",
                data: formBill,
                contentType: false,
                processData: false,
                success: function (result) {
                    $('#txtMaHD').val("HD" + result);
                },
                error: function (err) {

                }
            });
        });
    });
</script>
    </asp:Content>