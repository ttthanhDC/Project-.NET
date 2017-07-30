<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"CodeBehind="LT002_Demo2.aspx.cs" Inherits="SYSGREEN.LT002_Demo2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
        <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-10">
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
        loadContent();
        function loadContent() {

            loadDataHoaDon();
        };
        function loadDataHoaDon() {
            var idParam = getQueryVariable("paramId");
            var formSource = new FormData();
            var json = { 'type': 0 };
            formSource.append('type', 'getvHoaDonStep2');
            formSource.append('data', JSON.stringify(json));
            formSource.append('ID', idParam);
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
                            field: 'codeReser',
                            title: 'Số reservation',
                            align: 'center',
                            valign: 'middle',
                            events: codeReserEvents,
                            formatter: codeReserFormatter
                        }, {
                            field: 'name',
                            title: 'Họ tên',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'sdt',
                            title: 'Số điện thoại',
                            align: 'center',
                            valign: 'middle',
                            editable: true,

                        }, {
                            field: 'district',
                            title: 'Quận',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'address',
                            title: 'Địa chỉ',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'status',
                            title: 'Trạng thái',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (value === 1) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 selected = true>Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 2) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ xử lý</option><option value = 2 selected = true>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 3) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3 selected = true>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 4) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1>Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4 selected = true>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 5) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5 selected = true>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 6) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6 selected = true>Đang chuyển</option></select>'
                                } else {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0> selected = true</option><option value = 1 >Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                }
                            }
                        }, {
                            field: 'typeBill',
                            title: 'Loại Đơn',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'date',
                            title: 'Ngày',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'money',
                            title: 'Tiền',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'dateThu',
                            title: 'Ngày thu',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                return '<label style = "color: red;">' + value + '</label>';
                            }
                        }, {
                            field: 'operate',
                            title: '',
                            align: 'center',
                            valign: 'middle',
                            events: operateEvents,
                            formatter: operateFormatter
                        }]
                    });
                    //Load Data Grid
                    var data = [];
                    for (var i = 0 ; i < jsonData.length ; i++) {
                        var obj = {
                            codeReser: '',
                            name: jsonData[i].TenKH,
                            sdt: jsonData[i].SoDienThoai,
                            district: jsonData[i].TenQuan,
                            address: jsonData[i].DiaChi,
                            status: -1,
                            typeBill: -1,
                            date: jsonData[i].NgayHD,
                            money: jsonData[i].ThanhTien,
                            IdNgayHD : jsonData[i].IdNgayHD,
                        };
                        var codeRever = 'HD' + (jsonData[i].ID < 10 ? '0' + jsonData[i].ID : jsonData[i].ID) + "-" + (jsonData[i].tabIndex < 10 ? '0' + jsonData[i].tabIndex : jsonData[i].tabIndex) ;
                        obj.codeReser = codeRever;
                        // Trạng thái
                        if (jsonData[i].TrangThai == "Chưa xử lý") {
                            obj.status = 1;
                        }else if (jsonData[i].TrangThai == "Đang xử lý") {
                            obj.status = 2;
                        }else if (jsonData[i].TrangThai == "Hoàn thành") {
                            obj.status = 3;
                        }else if (jsonData[i].TrangThai == "Chờ giao lại") {
                            obj.status = 4;
                        }else if (jsonData[i].TrangThai == "Hủy") {
                            obj.status = 5;
                        } else if (jsonData[i].TrangThai == "Đang chuyển") {
                            obj.status = 6;
                        }
                        // Type BIll
                        if (jsonData[i].Loai == 1) {
                            obj.typeBill = "Đơn gói";
                        }else if (jsonData[i].Loai == 2) {
                            obj.typeBill = "Đơn lẻ";
                        }
                        //Đang chuyển
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
        'IN'
        ].join('');
    }

    window.operateEvents = {
        'click .linkIn': function (e, value, row, index) {
            // window.location = '/UserManger.aspx?paramId=' + row.id;
            alert('Action In');
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




