<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KT003_TotalExpenditure.aspx.cs" Inherits="SYSGREEN.KT003_TotalExpenditure" %>

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
                        obj.name = objectData.RoleName;
                        obj.dateCreate = objectData.Create_Date;
                        obj.user = objectData.Create_User;
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
                        field: 'spentFor',
                        title: 'Nọi dung chi',
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
                        field: 'accountFor',
                        title: 'Tài khoản chi',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,

                    }, {
                        field: 'note',
                        title: 'Ghi chúc',
                        align: 'center',
                        valign: 'middle',
                       // events: operateEvents,
                        //formatter: operateFormatter
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
                field: 'date',
                title: 'Ngày',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'spentFor',
                title: 'Nọi dung chi',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'money',
                title: 'Số tiền',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'accountFor',
                title: 'Tài khoản chi',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value === 1) {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0></option><option value = 1 selected = true>VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option><option value = 6>Tiền mặt</option></select>'
                    } else if (value === 2) {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2 selected = true>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option><option value = 6>Tiền mặt</option></select>'
                    } else if (value === 3) {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3 selected = true>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option><option value = 6>Tiền mặt</option></select>'
                    } else if (value === 4) {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4 selected = true>VP</option><option value = 5>VPDN</option><option value = 6>Tiền mặt</option></select>'
                    } else if (value === 5) {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4 >VP</option><option value = 5 selected = true>VPDN</option><option value = 6 >Tiền mặt</option></select>'
                    } else if (value === 6) {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4 >VP</option><option value = 5>VPDN</option><option value = 6 selected = true>Tiền mặt</option></select>'
                    } else {
                        return '<select class="form-control" id="NH' + index + '"> <option value = 0 selected = true></option> <option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option><option value = 6 >Tiền mặt</option></select>'
                    }
                }
            }, {
                field: 'note',
                title: 'Ghi chúc',
                align: 'center',
                valign: 'middle',
                // events: operateEvents,
                //formatter: operateFormatter
            }],
            data: [{
                permission: false,
                date: '01/07/2017',
                spentFor: 'Trả lương tháng',
                money: '1,000,000',
                accountFor: 1,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '01/07/2017',
                spentFor: 'Trả lương tháng',
                money: '1,000,000',
                accountFor: 1,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '01/07/2017',
                spentFor: 'Trả lương tháng',
                money: '1,000,000',
                accountFor: 2,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '01/07/2017',
                spentFor: 'Trả lương tháng',
                money: '1,000,000',
                accountFor: 0,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '01/07/2017',
                spentFor: 'Trả lương tháng',
                money: '1,000,000',
                accountFor: 5,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '01/07/2017',
                spentFor: 'Trả lương tháng',
                money: '1,000,000',
                accountFor: 1,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '01/07/2017',
                spentFor: 'Trả lương tháng',
                money: '1,000,000',
                accountFor: 5,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '01/07/2017',
                spentFor: 'Trả lương tháng',
                money: '1,000,000',
                accountFor: 4,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '01/07/2017',
                spentFor: 'Trả lương tháng',
                money: '1,000,000',
                accountFor: 3,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '01/07/2017',
                spentFor: 'Trả lương tháng',
                money: '1,000,000',
                accountFor: 0,
                note: 'Gấm nhận chuyển tiền'
            }, {
                permission: false,
                date: '01/07/2017',
                spentFor: 'Trả lương tháng',
                money: '1,000,000',
                accountFor: 1,
                note: 'Gấm nhận chuyển tiền'
            }],
        });
    });
    // function
    
</script>
    </asp:Content>


