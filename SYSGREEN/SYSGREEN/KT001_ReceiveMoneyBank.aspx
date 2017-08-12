<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KT001_ReceiveMoneyBank.aspx.cs" Inherits="SYSGREEN.KT001_ReceiveMoneyBank" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">

   <div style ="margin-left:20px;margin-right:20px">
        <table id="table"></table>
   </div>
   
<script>
    // Bootstrap Table
    $(function () {
        var data =  [{
            permission: true,
            date: '01/07/2017',
            name: 'Trần ngọc duy',
            money: '1,000,000',
            bank: 1,
            code: '123456789',
            staus: 1,
            note: 'Gấm nhận chuyển tiền'
        }, {
            permission: true,
            date: '03/07/2017',
            name: 'Trần ngọc duy',
            money: '1,000,000',
            bank: 2,
            code: '123456789',
            staus: 2,
            note: 'Gấm nhận chuyển tiền'
        }, {
            permission: true,
            date: '04/07/2017',
            name: 'Trần ngọc duy',
            money: '1,000,000',
            bank: 3,
            code: '123456789',
            staus: 'a',
            note: 'Gấm nhận chuyển tiền'
        }, {
            permission: true,
            date: '06/07/2017',
            name: 'Trần ngọc duy',
            money: '1,000,000',
            bank: 4,
            code: '123456789',
            staus: 1,
            note: 'Gấm nhận chuyển tiền'
        }, {
            permission: true,
            date: '09/07/2017',
            name: 'Trần ngọc duy',
            money: '1,000,000',
            bank: 'TPB',
            code: '123456789',
            staus: 1,
            note: 'Gấm nhận chuyển tiền'
        }, {
            permission: true,
            date: '11/07/2017',
            name: 'Trần ngọc duy',
            money: '1,000,000',
            bank: 3,
            code: '123456789',
            staus: 1,
            note: 'Gấm nhận chuyển tiền'
        }, {
            permission: true,
            date: '13/07/2017',
            name: 'Trần ngọc duy',
            money: '1,000,000',
            bank: 4,
            code: '123456789',
            staus: 1,
            note: 'Gấm nhận chuyển tiền'
        }, {
            permission: true,
            date: '23/07/2017',
            name: 'Trần ngọc duy',
            money: '1,000,000',
            bank: 0,
            code: '123456789',
            staus: 1,
            note: 'Gấm nhận chuyển tiền'
        }, {
            permission: true,
            date: '24/07/2017',
            name: 'Trần ngọc duy',
            money: '1,000,000',
            bank: 3,
            code: '123456789',
            staus: 2,
            note: 'Gấm nhận chuyển tiền'
        }, {
            permission: true,
            date: '25/07/2017',
            name: 'Trần ngọc duy',
            money: '1,000,000',
            bank: 2,
            code: '123456789',
            staus: 1,
            note: 'Gấm nhận chuyển tiền'
        }, {
            permission: true,
            date: '30/07/2017',
            name: 'Trần ngọc duy',
            money: '1,000,000',
            bank: 1,
            code: '123456789',
            staus: 2,
            note: 'Gấm nhận chuyển tiền'
        }]
        getDataTable(data);
    });
    var getDataTable = function (itemData) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'date',
                title: 'Ngày',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value) {
                        return '<label style = "color: blue;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'name',
                title: 'Tên khách hàng',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'money',
                title: 'Số tiền',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'bank',
                title: 'Ngân hàng',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value === 1) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 selected = true>VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 2) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2 selected = true>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 3) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3 selected = true>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 4) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4 selected = true>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 5) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4 >VP</option><option value = 5 selected = true>VPDN</option></select>'
                    } else {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0 selected = true></option> <option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VP</option></select>'
                    }
                }
            }, {
                field: 'code',
                title: 'Mã giao dịch',
                align: 'center',
                valign: 'middle',
                editable: true,
            }, {
                field: 'staus',
                title: 'Tình trạng',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.permission) {
                        if (value === 1) {
                            return '<select class="select2" id=TT' + index + '> ' +
                            '<option value = 0 > </option>' +
                            '<option value = 1 selected = true >Đã nhận tiền</option>' +
                            '<option value = 2 >Chưa nhận tiền</option></select>'
                        } else if (value === 2) {
                            return '<select class="select2" id=TT' + index + '> ' +
                             '<option value = 0 > </option>' +
                             '<option value = 1 >Đã nhận tiền</option>' +
                             '<option value = 2 selected = true>Chưa nhận tiền</option></select>'
                        } else {
                            return '<select class="select2" id=TT' + index + '> ' +
                            '<option value = 0 selected = true> </option>' +
                            '<option value = 1 >Đã nhận tiền</option>' +
                            '<option value = 2 >Chưa nhận tiền</option></select>'
                        }
                    } else {
                        return "";
                    }
                }
            }, {
                field: 'note',
                title: 'Ghi chú',
                align: 'center',
                valign: 'middle',
                editable: true,
            }, {
                field: 'operate',
                title: 'Lưu',
                align: 'center',
                valign: 'middle',
                events: operateEvents,
                formatter: operateFormatter
            }],
            data: itemData
        });
    };
    function operateFormatter(value, row, index) {
        return [
            '<a class="save" href="javascript:void(0)" title="Lưu">',
            'Lưu data',
            '</a>',
        ].join('');
    }

    window.operateEvents = {
        'click .save': function (e, value, row, index) {
            var formData = new FormData();
            var id = parseInt(row.id + "");
            var json = { 'ID': id };
            jQuery.ajaxSetup({ async: true });
            formData.append('type', 'DeleteTrinhShipper');
            formData.append('IdLotrinh', id);
            $.ajax({
                url: "Configuation/HandlerShipper.ashx",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function (result) {
                    eventSearch();
                },
                error: function (err) {
                    eventSearch();
                }
            });
        }
    };
</script>
    </asp:Content>

