<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"CodeBehind="LT002_Demo2.aspx.cs" Inherits="SYSGREEN.LT002_Demo2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
                <label for="sel1" class="col-md-3"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_reservation" placeholder="Mã reservation"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_fromDate" placeholder="Từ ngày" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_toDate" placeholder="Đến ngày"/>
                </div>
                
            </div> 
        </div> 
        <div class="form-horizontal">
            <div class="form-group">
                 <label for="sel1" class="col-md-3"></label>
                 <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_status"placeholder="Trạng thái bill" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_name"placeholder="Họ tên khách" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_phone"placeholder="SĐT" />
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-default" id="btSearch">Tìm kiếm</button>
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
            var json = { 'type': 0 };
            var makh = "";
            var mahd = "HD13";
            var tensp = "";
            formSource.append('type', 'getData');
            formSource.append('data', JSON.stringify(json));
            formSource.append('MaHD', mahd);
            formSource.append('TenKH', makh);
            formSource.append('TenSP', tensp);
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
                            valign: 'middle'
                        }, {
                            field: 'sdt',
                            title: 'Số điện thoại',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'district',
                            title: 'Quận',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'address',
                            title: 'Địa chỉ',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'status',
                            title: 'Trạng thái',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (value === 1) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 selected = true>Chờ sử lý</option><option value = 2>Đang sử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 2) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ sử lý</option><option value = 2 selected = true>Đang sử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 3) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ sử lý</option><option value = 2>Đang sử lý</option><option value = 3 selected = true>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 4) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1>Chờ sử lý</option><option value = 2>Đang sử lý</option><option value = 3>Hoàn thành</option><option value = 4 selected = true>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 5) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ sử lý</option><option value = 2>Đang sử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5 selected = true>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 6) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ sử lý</option><option value = 2>Đang sử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6 selected = true>Đang chuyển</option></select>'
                                } else {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0> selected = true</option><option value = 1 >Chờ sử lý</option><option value = 2>Đang sử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
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
                            valign: 'middle'
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
                        }],
                        data: [{
                            codeReser: '002-001-070217',
                            name: 'Trần ngọc duy',
                            sdt: '0989485398',
                            district: 'Thanh xuân',
                            address: '19 hoàng ngân',
                            status: 1,
                            typeBill:'Đơn gói',
                            date: '01/01/2017',
                            money: '500,000',
                            dateThu: '01/01/2017'

                           
                        }, {
                            codeReser: '002-001-070217',
                            name: 'Trần ngọc duy',
                            sdt: '0989485398',
                            district: 'Thanh xuân',
                            address: '19 hoàng ngân',
                            status: 1,
                            typeBill: 'Đơn gói',
                            date: '01/01/2017',
                            money: '500,000',
                            dateThu: ''
                        }, {
                            codeReser: '002-001-070217',
                            name: 'Trần ngọc duy',
                            sdt: '0989485398',
                            district: 'Thanh xuân',
                            address: '19 hoàng ngân',
                            status: 1,
                            typeBill: 'Đơn gói',
                            date: '01/01/2017',
                            money: '500,000',
                            dateThu: ''
                        }, {
                            codeReser: '002-001-070217',
                            name: 'Trần ngọc duy',
                            sdt: '0989485398',
                            district: 'Thanh xuân',
                            address: '19 hoàng ngân',
                            status: 1,
                            typeBill: 'Đơn gói',
                            date: '01/01/2017',
                            money: '500,000',
                            dateThu: ''
                        }, {
                            codeReser: '002-001-070217',
                            name: 'Trần ngọc duy',
                            sdt: '0989485398',
                            district: 'Thanh xuân',
                            address: '19 hoàng ngân',
                            status: 1,
                            typeBill: 'Đơn gói',
                            date: '01/01/2017',
                            money: '500,000',
                            dateThu: ''
                        }, {
                            codeReser: '002-001-070217',
                            name: 'Trần ngọc duy',
                            sdt: '0989485398',
                            district: 'Thanh xuân',
                            address: '19 hoàng ngân',
                            status: 2,
                            typeBill: 'Đơn gói',
                            date: '01/01/2017',
                            money: '500,000',
                            dateThu: ''
                        }, {
                            codeReser: '002-001-070217',
                            name: 'Trần ngọc duy',
                            sdt: '0989485398',
                            district: 'Thanh xuân',
                            address: '19 hoàng ngân',
                            status: 1,
                            typeBill: 'Đơn gói',
                            date: '01/01/2017',
                            money: '500,000',
                            dateThu: ''
                        }, {
                            codeReser: '002-002-071217',
                            name: 'Trần ngọc duy',
                            sdt: '0989485398',
                            district: 'Thanh xuân',
                            address: '19 hoàng ngân',
                            status: 1,
                            typeBill: 'Đơn lẻ',
                            date: '01/01/2017',
                            money: '600,000',
                            dateThu: '01/01/2017'
                        }],
                    });
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




