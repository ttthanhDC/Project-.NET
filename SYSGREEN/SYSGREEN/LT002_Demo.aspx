<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="LT002_Demo.aspx.cs" Inherits="SYSGREEN.LT002_Demo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
                <label for="sel1" class="col-md-2"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_reservation" placeholder="Mã reservation"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_fromDate" placeholder="Từ ngày" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_toDate" placeholder="Đến ngày"/>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
            </div> 
        </div> 
        <div class="form-horizontal">
            <div class="form-group">
                 <label for="sel1" class="col-md-2"></label>
                 <div class="col-md-2">
                     <select class="form-control" id="txt_status">
                            <option value =""></option>
                            <option value ="Chưa xử lý">Chưa xử lý</option>
                            <option value ="Đang xử lý">Đang xử lý</option>
                            <option value ="Hoàn thành">Hoàn thành</option>
                        </select>
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_name"placeholder="Họ tên khách" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_phone"placeholder="SĐT" />
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btPrint">Export</button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSave">Lưu</button>
                </div>
            </div> 
        </div> 
    </div>
<div style ="height:40px"></div>
<div style="margin-left : 30px; margin-right : 30px">
    <table id="table" 
    ></table>
</div>

    
<script>
    // Bootstrap Table
    $(function () {

        loadContent();
        function loadContent() {
            loadDataHoaDon();
        };
        function loadDataHoaDon() {
            var formSource = new FormData();
            //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT
            var json = { 'type': 0 };
            var MaHD = $("#txt_reservation").val();
            var tuNgay = $("#txt_fromDate").val();
            var denNgay = $("#txt_toDate").val();
            var trangThai = $("#txt_status").val();
            var TenKH = $("#txt_name").val();
            var SoDT = $("#txt_phone").val();
            formSource.append('type', 'getvHoaDonStep1');
            formSource.append('data', JSON.stringify(json));
            formSource.append('MaHD', MaHD);
            formSource.append('tuNgay', tuNgay);
            formSource.append('denNgay', denNgay);
            formSource.append('trangThai', trangThai);
            formSource.append('TenKH', TenKH);
            formSource.append('SoDT', SoDT);
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
                        columns: [
                            {
                                field: 'codeReser',
                                title: 'Số reservation',
                                align: 'center',
                                valign: 'middle',
                                events: codeReserEvents,
                                formatter: codeReserFormatter
                            }, {
                                field: 'date',
                                title: 'Ngày',
                                align: 'center',
                                valign: 'middle',
                                style: 'font-weight: bold',
                                fontWeight: 'bold'

                            }, {
                                field: 'user',
                                title: 'User tạo',
                                align: 'center',
                                valign: 'middle',

                            }, {
                                field: 'money',
                                title: 'Tổng tiền',
                                align: 'center',
                                valign: 'middle',
                                formatter: function (value, row, index) {
                                    return '<label style = "color: red;">' + value + '</label>';
                                }
                            }, {
                                field: 'status',
                                title: 'Trạng thái',
                                align: 'center',
                                valign: 'middle',
                                formatter: function (value, row, index) {
                                    if (value === 1) {
                                        return '<select class="form-control" id="KH' + index + '"> <option value = 0></option><option value = 1 selected = true>Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option></select>'
                                    } else if (value === 2) {
                                        return '<select class="form-control" id="KH' + index + '"> <option value = 0></option><option value = 1 >Chưa xử lý</option><option value = 2 selected = true>Đang xử lý</option><option value = 3>Hoàn thành</option></select>'
                                    } else if (value === 3) {
                                        return '<select class="form-control" id="KH' + index + '"> <option value = 0></option><option value = 1 >Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3 selected = true>Hoàn thành</option></select>'
                                    } else {
                                        return '<select class="form-control" id="KH' + index + '"> <option value = 0> selected = true</option><option value = 1 >Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option></select>'
                                    }
                                }
                            }, {
                                field: 'name',
                                title: 'Họ tên',
                                align: 'center',
                                valign: 'middle'
                            }, {
                                field: 'sdt',
                                title: 'Số điện thoại',
                                align: 'center',
                                valign: 'middle'
                            }, {
                                field: 'address',
                                title: 'Địa chỉ',
                                align: 'center',
                                valign: 'middle'
                            }, {
                                field: 'operate',
                                title: 'Thao tác',
                                align: 'center',
                                valign: 'middle',
                                events: operateEvents,
                                formatter: operateFormatter
                            }]
                    });
                    // Load Data for Grid
                    var data = [];
                    for (var i = 0 ; i < jsonData.length ; i++) {
                        var obj = {
                            codeReser: jsonData[i].MaReservation,
                            user: 'ThanhDC7',
                            date: jsonData[i].NgayTao,
                            money: jsonData[i].TongTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","),
                            status: -1,
                            statusBill: jsonData[i].TrangThai,
                            name: jsonData[i].TenKH,
                            sdt: jsonData[i].SoDienThoai,
                            address: jsonData[i].DiaChi,
                            idHoaDon: jsonData[i].ID
                        };
                        if (jsonData[i].TrangThai == "Chưa xử lý") {
                            obj.status = 1;
                        } else if (jsonData[i].TrangThai == "Đang xử lý") {
                            obj.status = 2;
                        } else if (jsonData[i].TrangThai == "Hoàn thành") {
                            obj.status = 3;
                        }
                        data.push(obj);
                    }

                    $('#table').bootstrapTable('load', data);

                },
                error: function (err) {

                }
            });
        };


    });

    function operateFormatter(value, row, index) {
        return [
        '<a class="linkIn" href="javascript:void(0)" title="in hóa đơn">',
        'In hóa đơn'
        ].join('');
    }

    window.operateEvents = {
        'click .linkIn': function (e, value, row, index) {
            // window.location = '/UserManger.aspx?paramId=' + row.id;
            alert('Action In');
        },
        'click .link': function (e, value, row, index) {
            // window.location = '/UserManger.aspx?paramId=' + row.id;
            alert('Linh qua màn hình LT001b');
        }
    };
    function codeReserFormatter(value, row, index) {
            return [
            '<a class="next" href="javascript:void(0)" title="chi tiết" style = "color: red">',
            '' + value + ''
            ].join('');
    }

    window.codeReserEvents = { 
        'click .next': function (e, value, row, index) {
            window.location = '/LT002_Demo2.aspx?paramId=' + row.idHoaDon;
            //alert('You click like action, row: ' + JSON.stringify(row));
        }
    };

    //Event Search KH
    $('#btSearch').on('click', function () {
        var formSource = new FormData();
        //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT
        var json = { 'type': 0 };
        var MaHD = $("#txt_reservation").val();
        var tuNgay = $("#txt_fromDate").val();
        var denNgay = $("#txt_toDate").val();
        var trangThai = $("#txt_status").val();
        var TenKH = $("#txt_name").val();
        var SoDT = $("#txt_phone").val();
        formSource.append('type', 'getvHoaDonStep1');
        formSource.append('data', JSON.stringify(json));
        formSource.append('MaHD', MaHD);
        formSource.append('tuNgay', tuNgay);
        formSource.append('denNgay', denNgay);
        formSource.append('trangThai', trangThai);
        formSource.append('TenKH', TenKH);
        formSource.append('SoDT', SoDT);
        $.ajax({
            url: "Configuation/HandlerInsertBill.ashx",
            type: "POST",
            data: formSource,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                // Load Data for Grid
                var data = [];
                for (var i = 0 ; i < jsonData.length ; i++) {
                    var obj = {
                        codeReser: jsonData[i].MaReservation,
                        user: 'ThanhDC7',
                        date: jsonData[i].NgayTao,
                        money: jsonData[i].TongTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","),
                        status: -1,
                        statusBill: jsonData[i].TrangThai,
                        name: jsonData[i].TenKH,
                        sdt: jsonData[i].SoDienThoai,
                        address: jsonData[i].DiaChi,
                        idHoaDon: jsonData[i].ID
                    };
                    if (jsonData[i].TrangThai == "Chưa xử lý") {
                        obj.status = 1;
                    } else if (jsonData[i].TrangThai == "Đang xử lý") {
                        obj.status = 2;
                    } else if (jsonData[i].TrangThai == "Hoàn thành") {
                        obj.status = 3;
                    }
                    data.push(obj);
                }

                $('#table').bootstrapTable('load', data);

            },
            error: function (err) {

            }
        });
    });

    $('#btSave').on('click', function () {
        var formSource = new FormData();
        //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT
        var json = $('#table').bootstrapTable('getData');
        var x = $('#table select option:selected');
        for (var i = 0; i < json.length ; i++) {
            json[i].statusBill = x[i].text;
        }
        formSource.append('type', 'updateStatusVHoaDonStep1');
        formSource.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerInsertBill.ashx",
            type: "POST",
            data: formSource,
            contentType: false,
            processData: false,
            success: function (result) {
                alert("Cập nhật trạng thái hóa đơn thành công");
            },
            error: function (err) {

            }
        });
    });

</script>
    </asp:Content>



