<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="LT002_ListReservation.aspx.cs" Inherits="SYSGREEN.LT002_ListReservation" %>

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
                <div class="col-md-1">
                    <button type="submit" class="btn btn-default" id="btSearch">Tìm kiếm</button>
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
                    <button type="submit" class="btn btn-default" id="btPrint">Export</button>
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
<<<<<<< HEAD
        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'getData');
        var json = { 'ID': 0};
        formDataListUser.append('data', JSON.stringify(json));
=======
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

                },
                error: function (err) {

                }
            });
        };
        // onchage select box
       /* var formBill = new FormData();
        var bill = {'ID':0};
        formBill.append('type', 'getData');
        formBill.append('data', JSON.stringify(bill));
>>>>>>> c48c4dbd31a1732d47409e1c6dc48396ca1a8bc5
        $.ajax({
            url: "Configuation/HandlerSysUser.ashx",
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
                        obj.id = objectData.ID;
                        obj.email = objectData.Email;
                        obj.department = objectData.DeptId;
                        obj.local = objectData.OrgId;
                        obj.dateCreate = objectData.Create_Date;
                        obj.user = objectData.UserName;
                        arr.push(obj);
                    }
                }
                data = arr;
                $('#table').bootstrapTable({
                    columns: [{
                        field: 'codeReser',
                        title: 'Số reservation',
                        align: 'center',
                        valign: 'middle',
                        formatter: function (value, row, index) {
                            if (row.isParent) {
                                return '<label style = "color: red;">' + value + '</label>';
                            } else if (row.childent) {
                                return '<label style = "color: blue;">' + value + '</label>';
                            } else {
                                return '<label style = "color: green;">' + value + '</label>';
                            }
                        }
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
                            if (row.isParent) {
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
                            if (row.isParent) {
                                if (value === 1) {
                                    return '<select class="form-control" id="KH' + index + '"> <option value = 0></option><option value = 1 selected = true>Chưa sử lý</option><option value = 2>Đang sử lý</option><option value = 3>Hoàn thành</option></select>'
                                } else if (value === 2) {
                                    return '<select class="form-control" id="KH' + index + '"> <option value = 0></option><option value = 1 >Chưa sử lý</option><option value = 2 selected = true>Đang sử lý</option><option value = 3>Hoàn thành</option></select>'
                                } else if (value === 3) {
                                    return '<select class="form-control" id="KH' + index + '"> <option value = 0></option><option value = 1 >Chưa sử lý</option><option value = 2>Đang sử lý</option><option value = 3 selected = true>Hoàn thành</option></select>'
                                } else {
                                    return '<select class="form-control" id="KH' + index + '"> <option value = 0> selected = true</option><option value = 1 >Chưa sử lý</option><option value = 2>Đang sử lý</option><option value = 3>Hoàn thành</option></select>'
                                }
                            } else {
                                return value;
                            }
                        }
                    },{
                        field: 'statusBill',
                        title: 'Trạng thái đơn con',
                        align: 'center',
                        valign: 'middle',
                        formatter: function (value, row, index) {
                            if (row.childent) {
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
                            } else {
                                return value;
                            }
                        }
                    }, {
                        field: 'link',
                        title: 'Loại đơn',
                        align: 'center',
                        valign: 'middle',
                        events: linkEvents,
                        formatter: linkFormatter
                    }, {
                        field: 'dateBill',
                        title: 'Ngày giao',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'operate',
                        title: 'In hóa đơn',
                        align: 'center',
                        valign: 'middle',
                        events: operateEvents,
                        formatter: operateFormatter
                    }],
                    data: [{
                        isParent: true,
                        nextParent: false,
                        childent: false,
                        codeReser: '002',
                        user: 'Duytn4',
                        date: '01/01/2017',
                        money: '1,000,000',
                        status: 1,
                        statusBill: '',
                        link: '',
                        dateBill: '',
                    }, {
                        isParent: false,
                        nextParent: true,
                        childent: false,
                        codeReser: 'Trần ngọc duy',
                        date: '17/109 hoàng ngân',
                        user: '0989485398',
                        money: '',
                        status: '',
                        statusBill:'' ,
                        link: '',
                        dateBill: '',
                    }, {
                        isParent: false,
                        nextParent: false,
                        childent : true,
                        codeReser: '002-001-070416',
                        date: 'Trần ngọc duy',
                        user: '0989485398',
                        money: 'thanh xuân',
                        status: '17/9 hoàng ngân',
                        statusBill: 2,
                        link: 'đơn gói',
                        dateBill: '20/07/2017',
                    }, {
                        isParent: false,
                        nextParent: false,
                        childent: true,
                        codeReser: '002-001-070416',
                        date: 'Đặng công thành',
                        user: '0989485398',
                        money: 'thanh xuân',
                        status: '17/9 hoàng ngân',
                        statusBill: 2,
                        link: 'đơn gói',
                        dateBill: '20/07/2017',
                    }, {
                        isParent: true,
                        nextParent: false,
                        childent: false,
                        codeReser: '002',
                        user: 'thành DC7',
                        date: '01/01/2017',
                        money: '1,000,000',
                        status: 1,
                        statusBill: '',
                        link: '',
                        dateBill: '',
                    }, {
                        isParent: false,
                        nextParent: true,
                        childent: false,
                        codeReser: 'Đặng công thành',
                        date: '17/109 hoàng ngân',
                        user: '0989485398',
                        money: '',
                        status: '',
                        statusBill: '',
                        link: '',
                        dateBill: '',
                    }, {
                        isParent: false,
                        nextParent: false,
                        childent: true,
                        codeReser: '002-001-070416',
                        date: 'Đặng công thành',
                        user: '0989485398',
                        money: 'thanh xuân',
                        status: '17/9 hoàng ngân',
                        statusBill: 2,
                        link: 'đơn gói',
                        dateBill: '20/07/2017',
                    }, {
                        isParent: false,
                        nextParent: false,
                        childent: true,
                        codeReser: '002-001-070416',
                        date: 'Trần ngọc duy',
                        user: '0989485398',
                        money: 'thanh xuân',
                        status: '17/9 hoàng ngân',
                        statusBill: 2,
                        link: 'đơn gói',
                        dateBill: '20/07/2017',
                    }],
                });
            },
            error: function (err) {

            }
        });
        // format table
    });

    function operateFormatter(value, row, index) {
        if(row.nextParent){
            return "";
        } else {
            return [
            '<a class="linkIn" href="javascript:void(0)" title="in hóa đơn">',
            'In hóa đơn'
            ].join('');
        }
    }

    window.operateEvents = {
        'click .linkIn': function (e, value, row, index) {
           // window.location = '/UserManger.aspx?paramId=' + row.id;
            alert('Action In');
        }
    };
    function linkFormatter(value, row, index) {
        if (row.isParent) {
            return [
            '<a class="link" href="javascript:void(0)" title="chi tiết">',
            'Chi tiết'
            ].join('');
        }else {
            return value;
        }
    }

    window.linkEvents = {
        'click .link': function (e, value, row, index) {
            // window.location = '/UserManger.aspx?paramId=' + row.id;
            alert('Linh qua màn hình LT001b');
        }
    };
</script>
    </asp:Content>


