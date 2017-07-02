<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"  CodeBehind="LT001b_createReservation.aspx.cs" Inherits="SYSGREEN.LT001b_createReservation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner">
      <div class="form-horizontal">
        <div class="form-group">
           <label for="sel1" class="col-md-1">Nguồn</label>
            <div class="col-md-2">
                <select class="form-control" id="cb_SourceType">
                            <option value ="1">Facebook</option>
                            <option value ="2">Zalo</option>
                 </select>
            </div>
            <label for="sel1" class="col-md-2">Mã khách hàng</label>
            <div class="col-md-3">
                <input type="text" class="form-control" name="title" id="txtMaKH" />
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
                <input type="date" data-date-format="dd/mm/yyyy" class="form-control" name="title" id="txtNgaySinh" />
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
               <input type="email" class="form-control" name="title" id="txtEmail1" />
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
               <input type="email" class="form-control" name="title" id="txtDiaChi" />
            </div>
            <label for="sel1" class="col-md-2">Còn Nợ</label>
            <div class="col-md-2">
                 <input type="text" class="form-control" name="title" id="txtNo" value='0' disabled/>
            </div>
        </div> 
    </div>
     <hr style="color:blue;width:80%;text-align:center"/>
     <div style ="height:50px"></div>   
        <div class="row" style="margin-left : 30px; margin-right : 30px">
            <div class="col-md-3">
                <div class="form-group">
                  <label for="sel1">Loại đơn</label>
                  <select class="form-control" id="cb_billType">
                    <option value ="-1"></option>
                    <option value ="1">Master</option>
                    <option value ="2">Not master</option>
                  </select>
                </div>
            </div>
            <div class="col-md-3">
                 <div class="form-group">
                  <label for="sel1">Loại hình đơn</label>
                  <select class="form-control" id="cb_OrderType">
                    <option value ="-1"></option>
                    <option value ="1">Gói</option>
                    <option value ="2">Đơn lẻ</option>
                  </select>
                </div>
            </div>
            <div class="col-md-3">
                 <div class="form-group" id ="div_cb_OrderType2" style="">
                  <label for="sel1">Loại gói </label>
                  <select class="form-control" id="cb_OrderType2">
                    <option value ="-1"></option>
                    <option value ="1">Gói 2 ngày </option>
                    <option value ="2">Gói 3 ngày </option>
                    <option value ="3">Gói 4 ngày </option>
                    <option value ="4">Gói 5 ngày </option>
                  </select>
                </div>
            </div>
            <div class="col-md-3">
                 <div class="form-group" id ="div_cb_PayType" >
                  <label for="sel1">Thanh toán </label>
                  <select class="form-control" id="cb_PayType">
                    <option value ="-1"></option>
                    <option value ="1">Tiền mặt</option>
                    <option value ="2">Chuyển khoản</option>
                  </select>
                </div>
            </div>
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
<div class="modal fade" id="modalTable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 1200px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Modal table</h4>
                    </div>
                    <div class="modal-body">
                        <table id="tablePopup" 
                            data-id-field="undefined"
                            data-unique-id="undefined"
                            data-show-refresh="true">
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="btnPopup">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
   </div><!-- /.modal -->
    
<script>
    // Bootstrap Table
    $(function () {
        window.dataGlobal = [];
        //Onclick add Table Master
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
                for (var i = 0; i < window.dataGlobal.length ; i++) {
                    if (window.dataGlobal[i].billId == dataPopup[0].parentBillId) {
                        window.dataGlobal[i].monny = totalMoneyPopup.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                        window.dataGlobal[i].detalMaster = dataPopup;
                    }
                    total += Number(window.dataGlobal[i].monny.split('.').join(''));
                }
                $('#txtTong').val(total.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
                $table.bootstrapTable('removeAll');
                $table.bootstrapTable('load', window.dataGlobal);
            }
        });
        $('#btnAdd').on('click', function () {
            var $table = $('#table');
            //$table.bootstrapTable('insertRow', { index: 1, row: row });
            var obj = {};
            var check = true;
            if ($('#cb_billType').val() == -1) {
                alert('Vui lòng chọn loại đơn !');
                check = false;
            }
            if ($('#cb_OrderType').val() == -1) {
                alert('Vui lòng chọn loại hình đơn !');
                check = false;
            }
            if ($('#cb_PayType').val() == -1) {
                alert('Vui lòng chọn hình thức thanh toán !');
                check = false;
            }
            if ($('#cb_billType').val() != -1) {
                if ($('#cb_OrderType').val() == 1) {
                    if ($('#cb_OrderType2').val() == -1) {
                        alert('Vui lòng chọn loại gói !');
                        check = false;
                    }
                }
            }
            if (check) {
                var data = $table.bootstrapTable('getData');
                var checkMaster = false;
                if (data.length > 0) {
                    for (var i = 0; i < data.length ; i++) {
                        if (data[i].billType == "Master") {
                            checkMaster = true;
                            break;
                        }
                    }
                }
                if (!checkMaster) {
                    if ($('#cb_billType').val() == 1) {
                        obj.Master = true;
                        obj.billType = $('#cb_billType :selected').text();
                    } 
                }else {
                    if ($('#cb_billType').val() == 1) {
                        obj.Master = true;
                        obj.billType = '';
                    }
                }
                if ($('#cb_billType').val() == 2) {
                    obj.billType = $('#cb_billType :selected').text();
                }
                obj.billTypeId = $('#cb_billType').val();
                if ($('#cb_OrderType :selected').text() == 'Gói') {
                    obj.OrderType = $('#cb_OrderType2 :selected').text();
                } else {
                    obj.OrderType = 'Đơn lẻ'
                }
                obj.OrderTypeId = $('#cb_OrderType').val();
                obj.OrderType2Id = $('#cb_OrderType2').val();
                obj.dateShip = '';
                obj.discount = '';
                obj.monny = '0';
                //Harcode
                if ($('#cb_OrderType :selected').text() == 'Gói') {
                    if ($('#cb_OrderType2').val() == 1) {
                        var songayconlai = $('#txtSoNgayConLai').val() != "" ? $('#txtSoNgayConLai').val() : '0'
                        songayconlai = Number(songayconlai) + 2;
                        $('#txtSoNgayConLai').val(songayconlai);
                    } else if ($('#cb_OrderType2').val() == 2) {
                        var songayconlai = $('#txtSoNgayConLai').val() != "" ? $('#txtSoNgayConLai').val() : '0'
                        songayconlai = Number(songayconlai) + 3;
                        $('#txtSoNgayConLai').val(songayconlai);
                    }
                } else {
                    var songayconlai = $('#txtSoNgayConLai').val() != "" ? $('#txtSoNgayConLai').val() : '0';
                    songayconlai = Number(songayconlai) + 1;
                    $('#txtSoNgayConLai').val(songayconlai);
                }
                
                obj.payType = $('#cb_PayType :selected').text();
                obj.payTypeId = $('#cb_PayType').val();
                obj.stt = data.length + 1;
                if (window.dataGlobal.length > 0) {
                    var n = window.dataGlobal.length - 1;
                    obj.billId = window.dataGlobal[n] + 1;
                } else {
                    obj.billId = 1;
                }
                
                obj.detalMaster = [];
                window.dataGlobal.push(obj);
                $table.bootstrapTable('insertRow', { index: obj.stt, row: obj });
            }
        });
        // onchage select box 
        $('#cb_OrderType').on('change', function () {
            if (this.value == "1") {
                $("#div_cb_OrderType2").css("display", "block");
            } else {
                $("#div_cb_OrderType2").css("display", "none");
            }
        })
        $('#table').bootstrapTable({
            columns: [{
                field: 'stt',
                title: 'STT',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'billType',
                title: 'Loại hóa đơn',
                align: 'center',
                valign: 'middle',
                style: 'font-weight: bold',
                fontWeight: 'bold'

            }, {
                field: 'OrderType',
                title: 'Loại đơn hàng',
                align: 'center',
                valign: 'middle',
                events: typeBillEvents,
                formatter: billFormatter

            }, {
                field: 'payType',
                title: 'Loại thanh toán',
                align: 'center',
                valign: 'middle',
                fontWeight: 'bold'
            },
             {
                 field: 'monny',
                 title: 'Thành tiền',
                 align: 'center',
                 valign: 'middle',
                 editable: false,
             }, {
                 field: 'operate',
                 title: 'Thao tác',
                 align: 'center',
                 valign: 'middle',
                 events: operateEvents,
                 formatter: operateFormatter

             }],
            data: []
        });
    });


    function userFormatter(data) {
        return data.length;
    }
    function operateFormatter(value, row, index) {
        return [
             '<a class="remove" href="javascript:void(0)" title="Xoá">',
            'Xóa',
            '</a>',
        ].join('');
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
    function productFormatter(value, row, index) {
        return [
            '<a class="product" href="javascript:void(0)" title="Sản phẩm">',
                value,
            '</a>',
        ].join('');
    }

    function billFormatter(value, row, index) {
        return [
            '<a class="product" href="javascript:void(0)" title="Thông tin gói">',
                value,
            '</a>',
        ].join('');
    }
    window.operateEventsPopup = {
        'click .remove': function (e, value, row, index) {
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
                obj.id = null; obj.parent = false; obj.deliveryDate = ''; obj.product = '';
                obj.sugar = 1; obj.quantity = ''; obj.price = ''; obj.money = ''; obj.promotionCode = '';
                obj.total = ''; obj.test = ''; obj.operate = '0';
                obj.parentBillId = parentBillId; obj.parentId = parendId;
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
    };
    window.operateEvents = {
        'click .remove': function (e, value, row, index) {
            $('#table').bootstrapTable('remove', {
                field: 'stt',
                values: [row.stt]
            });


            for (var i = 0; i < window.dataGlobal.length ; i++) {
                if (window.dataGlobal[i].billId == row.billId) {
                    window.dataGlobal.splice(i, 1);
                    break;
                }
            }
            if ($('#table').bootstrapTable('getData').length < 1) {
                $('#txtSoNgayConLai').val('0');
            } else {
                //Master goi
                var soNgayConLai = $('#txtSoNgayConLai').val();
                if (row.billTypeId == 1 && row.OrderTypeId == 1) {
                    if (row.OrderType2Id == 2) {
                        soNgayConLai = (Number(soNgayConLai) - 2) < 0 ? '0' : (Number(soNgayConLai) - 2);
                    }
                    if (row.OrderType2Id == 3) {
                        soNgayConLai = (Number(soNgayConLai) - 3) < 0 ? '0' : (Number(soNgayConLai) - 3);
                    }
                } else if (row.OrderTypeId == 2) {
                    soNgayConLai = (Number(soNgayConLai) - 1) < 0 ? '0' : (Number(soNgayConLai) - 1);
                }
                $('#txtSoNgayConLai').val(soNgayConLai);
                $('#txtSoNgayConLai')
                var tong = $('#txtTong').val();
                if (tong == "") {
                    tong = "0";
                }
                tong = Number(tong.split('.').join('')) - Number(row.split('.').join(''));
                if (tong < 0) tong = 0;
                tong = tong.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                $('#txtTong').val(tong);
            }
        }
    };
    window.productEvents = {
        'click .product': function (e, value, row, index) {
            alert('You click like action, row: ' + JSON.stringify(row));
        }
    };

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
                fontWeight: 'bold'

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
                valign: 'middle'
            },
            {
                field: 'operate',
                title: 'Thao tác',
                align: 'center',
                valign: 'middle',
                events: operateEventsPopup,
                formatter: operateFormatterPopup

            }],
            data: []
        });

       

        $table.on('editable-save.bs.table', function (e, field, row, old, $el) {
            var $els = $table.find('.editable');
            next = $els.index($el) + 1;
            if (field == "product") {
                if (row[field] == "SP001") {
                    row.quantity = 1;
                    row.price = "200000".replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                    row.money = (1 * 200000).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                    row.total = (1 * 200000).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                    $table.bootstrapTable('updateRow', { index: row.id -1 , row: row });
                } else if (row[field] == "SP002") {
                    row.quantity = 1;
                    row.price = "300000".replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                    row.money = (1 * 300000).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                    row.total = (1 * 300000).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                    $table.bootstrapTable('updateRow', { index: row.id -1, row: row });
                }
            }
            if (field == "quantity") {
                var price = row.price.split('.').join('');
                row.money = (row[field] * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                row.total = (row[field] * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                $table.bootstrapTable('updateRow', { index: row.id -1, row: row });
            }
        });
    };

    function updateCell(caller) {
        var $table = $('#tablePopup');
    }
    window.typeBillEvents = {
        'click .product': function (e, value, row, index) {
            //alert('You click like action, row: ' + JSON.stringify(row));
            // Master , gói
            if (row.billTypeId == 1 && row.OrderTypeId == 1) {
                var $table = $('#tablePopup');
                initTablePopup();
                $table.bootstrapTable('removeAll');
                
                var dataTemp = [];
                for (var i = 0; i < window.dataGlobal.length ; i++) {
                    if (window.dataGlobal[i].billId == row.billId) {
                        dataTemp = window.dataGlobal[i].detalMaster;
                        break;
                    }
                }
                if (dataTemp.length > 0) {
                    for (var i = 0; i < dataTemp.length; i++) {
                        $table.bootstrapTable('append', [dataTemp[i]]);
                    }
                } else {
                    var obj = {};
                    obj.parent = true;
                    obj.parentBillId = row.billId;
                    obj.parentId = null;
                    obj.id = 1;
                    obj.deliveryDate = '01/07/2017';
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
                    // $table.bootstrapTable('insertRow', { index: obj.stt, row: obj });
                    if (row.OrderType2Id == 1) {
                        var obj1 = {};
                        obj1.id = 2;
                        obj1.parent = true;
                        obj1.parentBillId = row.billId;
                        obj1.parentId = null;
                        obj1.deliveryDate = '02/07/2017';
                        obj1.product = '';
                        obj1.sugar = 1;
                        obj1.quantity = '';
                        obj1.price = '';
                        obj1.money = '';
                        obj1.promotionCode = '';
                        obj1.total = '';
                        obj1.test = '';
                        obj1.operate = '1';
                        // $table.bootstrapTable('insertRow', { index: obj1.stt, row: obj1 });
                        $table.bootstrapTable('append', [obj1]);
                    } else if (row.OrderType2Id == 2) {
                        var obj2 = {};
                        obj2.id = 3;
                        obj2.parent = true;
                        obj2.parentBillId = row.billId;
                        obj2.parentId = null;
                        obj2.deliveryDate = '03/07/2017';
                        obj2.product = '';
                        obj2.sugar = 1;
                        obj2.quantity = '';
                        obj2.price = '';
                        obj2.money = '';
                        obj2.promotionCode = '';
                        obj2.total = '';
                        obj2.test = '';
                        obj2.operate = '1';
                        // $table.bootstrapTable('insertRow', { index: obj1.stt, row: obj1 });
                        $table.bootstrapTable('append', [obj2]);
                    }
                }
                $('#modalTable').modal('show');
            } else if (row.billTypeId == 1 && row.OrderTypeId == 2) { // Master  , Đơn Lẻ

            } else if (row.billTypeId == 2 && row.OrderTypeId == 1) { // Not Master , Gói

            } else if (row.billTypeId == 2 && row.OrderTypeId == 2) { // Not Master , Đơn lẻ

            }
           
            
        }
    };
</script>
    </asp:Content>



