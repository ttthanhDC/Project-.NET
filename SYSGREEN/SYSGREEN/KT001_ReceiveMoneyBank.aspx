<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KT001_ReceiveMoneyBank.aspx.cs" Inherits="SYSGREEN.KT001_ReceiveMoneyBank" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">

   <div style ="margin-left:20px;margin-right:20px">
        <table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-page-list="[10, 25, 50, 100, ALL]" 
        ></table>
   </div>
   
<script>
    // Bootstrap Table
    $(function () {
       /* var data = [];
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
                        obj.date = objectData.date;
                        obj.name = objectData.Create_Date;
                        obj.money = objectData.Create_User;
                        obj.bank = objectData.Create_User;
                        obj.code = objectData.Create_User;
                        obj.staus = objectData.Create_User;
                        obj.note = objectData.Create_User;
                        arr.push(obj);
                    }
                }
                data = arr;

                $('#table').bootstrapTable({
                    columns: [{
                        field: 'date',
                        title: 'Ngày',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        ///editable: true,
                    }, {
                        field: 'name',
                        title: 'Tên khách hàng',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        // editable: true,

                    }, {
                        field: 'money',
                        title: 'Số tiền',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        //  editable: true,
                    }, {
                        field: 'bank',
                        title: 'Ngân hàng',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                    }, {
                        field: 'code',
                        title: 'Mã giao dịch',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                    }, {
                        field: 'staus',
                        title: 'Tình trạng',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                    }, {
                        field: 'note',
                        title: 'Ghi chú',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                    }],
                    data: data
                });
            },
            error: function (err) {

            }
        }); */
        // format table
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
                //sortable: true,
                // editable: true,

            }, {
                field: 'money',
                title: 'Số tiền',
                align: 'center',
                valign: 'middle',
                //sortable: true,
                //  editable: true,
            }, {
                field: 'bank',
                title: 'Ngân hàng',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value === 1) {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0></option><option value = 1 selected = true>VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 2) {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2 selected = true>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 3) {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3 selected = true>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 4) {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4 selected = true>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 5) {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4 >VP</option><option value = 5 selected = true>VPDN</option></select>'
                    } else {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0 selected = true></option> <option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VP</option></select>'
                    }
                }
            }, {
                field: 'code',
                title: 'Mã giao dịch',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'staus',
                title: 'Tình trạng',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.permission) {
                        if (value === 1) {
                            return '<select class="form-control" id=TT' + index + '> ' +
                            '<option value = 0 > </option>' +
                            '<option value = 1 selected = true >Đã nhận tiền</option>' +
                            '<option value = 2 >Chưa nhận tiền</option></select>'
                        } else if (value === 2) {
                            return '<select class="form-control" id=TT' + index + '> ' +
                             '<option value = 0 > </option>' +
                             '<option value = 1 >Đã nhận tiền</option>' +
                             '<option value = 2 selected = true>Chưa nhận tiền</option></select>'
                        } else {
                            return '<select class="form-control" id=TT' + index + '> ' +
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
                //sortable: true,
            }],
            data: [{
                permission : false,
                date: '01/07/2017',
                name: 'Trần ngọc duy',
                money: '1,000,000',
                bank: 1,
                code: '123456789',
                staus: 1,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '03/07/2017',
                name: 'Trần ngọc duy',
                money: '1,000,000',
                bank: 2,
                code: '123456789',
                staus: 2,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
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
                permission: false,
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
                permission: false,
                date: '13/07/2017',
                name: 'Trần ngọc duy',
                money: '1,000,000',
                bank: 4,
                code: '123456789',
                staus: 1,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '23/07/2017',
                name: 'Trần ngọc duy',
                money: '1,000,000',
                bank: 0,
                code: '123456789',
                staus: 1,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '24/07/2017',
                name: 'Trần ngọc duy',
                money: '1,000,000',
                bank: 3,
                code: '123456789',
                staus: 2,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '25/07/2017',
                name: 'Trần ngọc duy',
                money: '1,000,000',
                bank: 2,
                code: '123456789',
                staus: 1,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '30/07/2017',
                name: 'Trần ngọc duy',
                money: '1,000,000',
                bank: 1,
                code: '123456789',
                staus: 2,
                note: 'Gấm nhận chuyển tiền'
            }],
        });
    });
</script>
    </asp:Content>

