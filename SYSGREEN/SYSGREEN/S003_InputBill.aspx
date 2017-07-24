<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S003_InputBill.aspx.cs" Inherits="SYSGREEN.S003_InputBill" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
     <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
                
                 <label for="sel1" class="col-md-2"></label>
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
                    <button type="submit" class="btn btn-default" id="btSearch">Tìm kiếm</button>
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
        /*var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'getData');
        var json = { 'ID': 0 };
        formDataListUser.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerSysRole.ashx",
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
                        obj.name = objectData.RoleName;
                        obj.dateCreate = objectData.Create_Date;
                        obj.user = objectData.Create_User;
                        arr.push(obj);
                    }
                }
                data = arr;

                $('#table').bootstrapTable({
                    columns: [{
                        field: 'code',
                        title: 'Mã Reservation',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        ///editable: true,
                    }, {
                        field: 'date',
                        title: 'Ngày',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        // editable: true,

                    }, {
                        field: 'district',
                        title: 'Quận',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        //  editable: true,
                    }, {
                        field: 'status',
                        title: 'Trạng thái',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                    }, {
                        field: 'name',
                        title: 'name',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                    }, {
                        field: 'sdt',
                        title: 'SĐT',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,

                    }, {
                        field: 'operate',
                        title: 'Thao tác',
                        align: 'center',
                        valign: 'middle',
                        events: operateEvents,
                        formatter: operateFormatter
                    }],
                    data: data
                });
            },
            error: function (err) {

            }
        });*/
        // format table
        $('#table').bootstrapTable({
            columns: [{
                field: 'code',
                title: 'Mã Reservation',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.parent) {
                        return '<label style = "color: blue;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'name',
                title: 'Họ và tên',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.parent && row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'date',
                title: 'Ngày',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.parent && row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'phone',
                title: 'SĐT',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.parent && row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'district',
                title: 'Quận',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.parent && row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'address',
                title: 'Địa chỉ',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.parent && row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'money',
                title: 'Tiền',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.parent && row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'status',
                title: 'Trạng thái đơn hàng',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.parent && row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'note',
                title: 'Ghi chú',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.parent && row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }],
            data: [{
                code: '002-001-123456',
                name : 'Trần ngọc duy',
                date: '20/07/2017',
                phone: '0989485398',
                district: 'Hà đông',
                address: '39 Hoàng mai, hà nội',
                money : '30000',
                status: 'Đang chuyển',
                note: 'note'
            }, {
                code: '002-001-123456',
                name: 'Trần ngọc duy',
                date: '20/07/2017',
                phone: '0989485398',
                district: 'Hà đông',
                address: '39 Hoàng mai, hà nội',
                money: '30000',
                status: 'Đang chuyển',
                note: 'note'
            }, {
                code: '002-001-123456',
                name: 'Trần ngọc duy',
                date: '20/07/2017',
                phone: '0989485398',
                district: 'Hà đông',
                address: '39 Hoàng mai, hà nội',
                money: '30000',
                status: 'Đang chuyển',
                note: 'note'
            }, {
                code: '002-001-123456',
                name: 'Trần ngọc duy',
                date: '20/07/2017',
                phone: '0989485398',
                district: 'Hà đông',
                address: '39 Hoàng mai, hà nội',
                money: '30000',
                status: 'Đang chuyển',
                note: 'note'
            }, {
                code: '002-001-123456',
                name: 'Trần ngọc duy',
                date: '20/07/2017',
                phone: '0989485398',
                district: 'Hà đông',
                address: '39 Hoàng mai, hà nội',
                money: '30000',
                status: 'Đang chuyển',
                note: 'note'
            }, {
                code: '002-001-123456',
                name: 'Trần ngọc duy',
                date: '20/07/2017',
                phone: '0989485398',
                district: 'Hà đông',
                address: '39 Hoàng mai, hà nội',
                money: '30000',
                status: 'Đang chuyển',
                note: 'note'
            }, {
                code: '002-001-123456',
                name: 'Trần ngọc duy',
                date: '20/07/2017',
                phone: '0989485398',
                district: 'Hà đông',
                address: '39 Hoàng mai, hà nội',
                money: '30000',
                status: 'Đang chuyển',
                note: 'note'
            }, {
                code: '002-001-123456',
                name: 'Trần ngọc duy',
                date: '20/07/2017',
                phone: '0989485398',
                district: 'Hà đông',
                address: '39 Hoàng mai, hà nội',
                money: '30000',
                status: 'Đang chuyển',
                note: 'note'

            }]
        });
    });
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
</script>
    </asp:Content>

