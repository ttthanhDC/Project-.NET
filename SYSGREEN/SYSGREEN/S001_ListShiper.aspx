<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S001_ListShiper.aspx.cs" Inherits="SYSGREEN.S001_ListShiper" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">

   <div style ="margin-left:20px;margin-right:20px">
       <table id="table" 
        data-search="true" 
        data-show-refresh="true" 
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
                field: 'check',
                title: 'Tích',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value) {
                        if (row.parent) {
                            return '<input type="checkbox" value="" checked></label>';
                        } else {
                            return '<input type="checkbox" value=""></label>';
                        }
                    } else {
                        return '';
                    }
                }
            },{
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
                field: 'status',
                title: 'Trạng thái',
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
                field: 'name',
                title: 'Họ tên',
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
                field: 'sdt',
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
                field: 'addres',
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
            }],
            data: [{
                check: true,
                parent: true,
                detb : true,
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money : '300,000'
            }, {
                check: false,
                parent: false,
                detb: false,
                code: 'SP1',
                date: 'Sản phẩm 1',
                district: '1',
                status: '',
                name: '',
                sdt: '',
                addres: '',
                money: ''
            }, {
                check: false,
                parent: false,
                detb: false,
                code: 'SP2',
                date: 'sản phẩm 2',
                district: '1',
                status: '',
                name: '',
                sdt: '',
                addres: '',
                money: ''
            }, {
                check: false,
                parent: false,
                detb: false,
                code: 'SP3',
                date: 'Sản phẩm 3',
                district: '1',
                status: '',
                name: '123456',
                sdt: 'Hoàng hiếu',
                addres: '',
                money: ''
            }, {
                check: true,
                parent: true,
                detb: false,
                code: '002-002-4567890',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '109 hoàng ngân thanh xuân',
                money: '1,000,000'
            }, {
                check: false,
                parent: false,
                detb: false,
                code: 'SP1',
                date: 'Sản phẩm 1',
                district: '1',
                status: '',
                name: '',
                sdt: '',
                addres: '',
                money: ''
            }, {
                check: false,
                parent: false,
                detb: false,
                code: 'SP2',
                date: 'sản phẩm 2',
                district: '1',
                status: '',
                name: '',
                sdt: '',
                addres: '',
                money: ''
            }, {
                check: false,
                parent: false,
                detb: false,
                code: 'SP3',
                date: 'Sản phẩm 3',
                district: '1',
                status: '',
                name: '123456',
                sdt: 'Hoàng hiếu',
                addres: '',
                money: ''

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

