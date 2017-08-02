<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S003_InputBill.aspx.cs" Inherits="SYSGREEN.S003_InputBill" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
     <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
                
                 <label for="sel1" class="col-md-1"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_code" placeholder="Mã đơn" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_name" placeholder="Họ tên khách" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ShipNumber" placeholder="Shiper number"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ShipName" placeholder="Shiper name"/>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
                <div class="col-md-1">
                   <button type="button" class="btn btn-primary" id="btSave">Lưu data</button>
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
                        obj.status = objectData.TrangThaiNHD || "";
                        obj.name = objectData.TenKH_HD || "";
                        obj.phone = objectData.SoDienThoai || "";
                        obj.district = objectData.TenQuan || "";
                        obj.address = objectData.DiaChi || "";
                        obj.money = objectData.Create_User || "";// chua có
                        obj.shiper = objectData.shipName || "";
                        obj.status = 1;// chua có
                        obj.statusTT = 2;// chua có
                        obj.note = "jshdfksdhfksdfsafsdf";// chua có
                        obj.moneyPay = objectData.shipNo || "";
                        obj.assign = objectData.userName || "";
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
    // button search
    $('#btSearch').on('click', function (e) {
        var datatable = $('#table').bootstrapTable('getData');
        var listNgayHoaDon = [];
        if (datatable) {
            for (var i = 0; i < datatable.length; i++) {
                if (datatable[i].id) {
                    listNgayHoaDon.push(datatable[i].id);
                }
            }
        }
        alert("Danh sách in hóa đơn" + listNgayHoaDon)
    });
    // button save
    $('#btSave').on('click', function (e) {
        var datatable = $('#table').bootstrapTable('getData');
        var listNgayHoaDon = [];
        if (datatable) {
            for (var i = 0; i < datatable.length; i++) {
                if (datatable[i].id) {
                    listNgayHoaDon.push(datatable[i].id);
                }
            }
        }
        alert("Danh sách in hóa đơn" + listNgayHoaDon)
    });
    var getDataTable = function (itemData) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'code',
                title: 'Mã Reservation',
                align: 'center',
                valign: 'middle',
                events: codeReserEvents,
                formatter: codeReserFormatter
            }, {
                field: 'name',
                title: 'Họ và tên',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'date',
                title: 'Ngày',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'phone',
                title: 'SĐT',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'district',
                title: 'Quận',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'address',
                title: 'Địa chỉ',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'money',
                title: 'Tiền',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'status',
                title: 'Trạng thái',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value === 1) {
                        return '<select class="form-control" id="STT' + index + '"> <option value = 0></option><option value = 1 selected = true>Chờ giao lại</option><option value = 2>Đã giao</option><option value = 3>Hủy đơn</option><option value = 4>Giao 1 phần đơn hàng</option></select>'
                    } else if (value === 2) {
                        return '<select class="form-control" id="STT' + index + '"> <option value = 0></option><option value = 1>Chờ giao lại</option><option value = 2 selected = true>Đã giao</option><option value = 3>Hủy đơn</option><option value = 4>Giao 1 phần đơn hàng</option></select>'
                    } else if (value === 3) {
                        return '<select class="form-control" id="STT' + index + '"> <option value = 0></option><option value = 1>Chờ giao lại</option><option value = 2>Đã giao</option><option value = 3 selected = true>Hủy đơn</option><option value = 4>Giao 1 phần đơn hàng</option></select>'
                    } else if (value === 4) {
                        return '<select class="form-control" id="STT' + index + '"> <option value = 0></option><option value = 1>Chờ giao lại</option><option value = 2>Đã giao</option><option value = 3>Hủy đơn</option><option value = 4 selected = true>Giao 1 phần đơn hàng</option></select>'
                    } else {
                        return '<select class="form-control" id="STT' + index + '"> <option value = 0 selected = true></option><option value = 1>Chờ giao lại</option><option value = 2>Đã giao</option><option value = 3>Hủy đơn</option><option value = 4>Giao 1 phần đơn hàng</option></select>'
                    }
                }
            }, {
                field: 'statusTT',
                title: 'Tình trạng thanh toán',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value === 1) {
                        return '<select class="form-control" id="STT' + index + '"> <option value = 0></option><option value = 1 selected = true>Đã thanh toán ( tiền mặt)</option><option value = 2>Chưa thanh toán ( tiền mặt)</option><option value = 3>Thanh toán 1 phần</option><option value = 4>Chuyển khoản</option></select>'
                    } else if (value === 2) {
                        return '<select class="form-control" id="STT' + index + '"> <option value = 0></option><option value = 1>Đã thanh toán ( tiền mặt)</option><option value = 2 selected = true>Chưa thanh toán ( tiền mặt)</option><option value = 3>Thanh toán 1 phần</option><option value = 4>Chuyển khoản</option></select>'
                    } else if (value === 3) {
                        return '<select class="form-control" id="STT' + index + '"> <option value = 0></option><option value = 1>Đã thanh toán ( tiền mặt)</option><option value = 2>Chưa thanh toán ( tiền mặt)</option><option value = 3 selected = true>Thanh toán 1 phần</option><option value = 4>Chuyển khoản</option></select>'
                    } else if (value === 4) {
                        return '<select class="form-control" id="STT' + index + '"> <option value = 0></option><option value = 1>Đã thanh toán ( tiền mặt)</option><option value = 2>Chưa thanh toán ( tiền mặt)</option><option value = 3>Thanh toán 1 phần</option><option value = 4 selected = true>Chuyển khoản</option></select>'
                    } else {
                        return '<select class="form-control" id="STT' + index + '"> <option value = 0 selected = true></option><option value = 1>Đã thanh toán ( tiền mặt)</option><option value = 2>Chưa thanh toán ( tiền mặt)</option><option value = 3>Thanh toán 1 phần</option><option value = 4>Chuyển khoản</option></select>'
                    }
                }
            }, {
                field: 'shiper',
                title: 'Shiper',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'moneyPay',
                title: 'Số TĐTT',
                align: 'center',
                valign: 'middle',
                editable: true
            }, {
                field: 'assign',
                title: 'Assign',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'note',
                title: 'Ghi chú',
                align: 'center',
                valign: 'middle',
                editable: true
            }],

            data: itemData
        });
    };
    // function
    function userFormatter(data) {
        return data.length;
    }
    function operateFormatter(value, row, index) {
        return [
            '<a class="right" href="javascript:void(0)" title="nợ ?">',
            'Nợ ?',
            '</a>',

        ].join('');
    }

    window.operateEvents = {
        'click .right': function (e, value, row, index) {
            //window.location = '/TheRightForUser.aspx?paramId=' + row.id;
            alert('Đơn thanh toán chuyển khoản nhưng vẫn còn nợ tiền ');
        }
    };
    function codeReserFormatter(value, row, index) {
        return [
        '<a class="next" href="javascript:void(0)" title="chi tiết" >',
        '' + value + ''
        ].join('');
    }

    window.codeReserEvents = {
        'click .next': function (e, value, row, index) {
            window.location = '/LT002_Demo3.aspx?paramId=' + row.id;
            //alert('You click like action, row: ' + JSON.stringify(row));
        }
    };
</script>
    </asp:Content>

