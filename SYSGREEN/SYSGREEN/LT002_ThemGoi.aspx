<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="LT002_ThemGoi.aspx.cs" Inherits="SYSGREEN.LT002_ThemGoi" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   <div id="contactHD">
       <div class="form-horizontal" style="margin-left:20px">
           <div class="form-group">
                <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-2">Loại đơn</label>
                <div class="col-md-3">
                    <select class="form-control" id="cb_LoaiDon">
                        <option value ="-1"></option>
                        <option value ="1">001</option>
                        <option value ="2">002</option>
                        </select>
                </div>
            </div> 
           <div class="form-group">
                <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-2">Loại hình đơn</label>
                <div class="col-md-3">
                    <select class="form-control" id="cb_OrderType">
                        <option value ="-1"></option>
                        <option value ="1">Gói</option>
                        <option value ="2">Đơn lẻ</option>
                        </select>
                </div>
            </div> 
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="sel1" class="col-md-3"></label>
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
                    
                </div> 
            </div>  
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="sel1" class="col-md-3"></label>
                   <label for="sel1" class="col-md-2" id="lblPhiShip">Hình thức Ship</label>
                   <div class="col-md-3">
                        <select class="form-control" id="cb_hinhthucShip">
                            <option value = "-1"></option>
                            <option value = "Ship đi">Ship đi</option>
                            <option value = "Đến lấy">Đến lấy</option>
                      </select>
                    </div>
                    
                </div> 
            </div>  
             <div class="form-horizontal">
                <div class="form-group">
                    <label for="sel1" class="col-md-3"></label>
                   <label for="sel1" class="col-md-2">Thanh toán</label>
                   <div class="col-md-3">
                       <select class="form-control" id="cb_PayType">
                            <option value = "-1"></option>
                            <option value = "Tiền mặt">Tiền mặt</option>
                            <option value = "Chuyển khoản">Chuyển khoản</option>
                      </select>
                    </div>
                    
                </div> 
             </div>  
              <div class="form-horizontal">
                <div class="form-group">
                    <label for="sel1" class="col-md-3"></label>
                   <label for="sel1" class="col-md-2">Phí Ship</label>
                   <div class="col-md-3">
                       <input type="text" class="form-control" name="title" id="txt_PhiShip" />
                    </div>
                   
                </div> 
            </div>  
         </div>
        <div class="row" style="margin-left : 30px; margin-right : 30px">

        </div> 
        
    <div style ="text-align:center;display: table;margin: 0 auto;">
       <button type="button" class="btn btn-primary" id="btnAdd">Thêm</button>
    </div>
</div>
   <table id="tablePopup" 
                            data-id-field="undefined"
                            data-unique-id="undefined"
                            data-show-refresh="true">
                        </table>
    <script>
        loadContent();
        function loadContent() {
            loadGoiHD();
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
    </script>
</asp:Content>

