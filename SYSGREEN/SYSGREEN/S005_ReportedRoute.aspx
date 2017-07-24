<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S005_ReportedRoute.aspx.cs" Inherits="SYSGREEN.S005_ReportedRoute" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <script>
        $(function () {
            // get data table
            //var data = [];
            //var formDataListUser = new FormData();
            //formDataListUser.append('type', 'getData');
            //var json = { 'ID': 0 };
            //formDataListUser.append('data', JSON.stringify(json));
            //$.ajax({
            //    url: "Configuation/HandlerSysUser.ashx",
            //    type: "POST",
            //    data: formDataListUser,
            //    contentType: false,
            //    processData: false,
            //    success: function (result) {
            //        var jsonData = result;
            //        var arr = [];
            //        if (jsonData && jsonData.length > 0) {
            //            for (var i = 0; i < jsonData.length ; i++) {
            //                var objectData = jsonData[i];
            //                var obj = {};
            //                obj.id = objectData.ID;
            //                obj.customer = objectData.ID;
            //                obj.bill = objectData.ID;
            //                obj.address = objectData.ID;
            //                obj.typePay = objectData.ID;
            //                obj.user = objectData.ID;
            //                obj.time = objectData.ID;
            //                obj.total = objectData.ID;

            //                arr.push(obj);
            //            }
            //        }
            //        // init table
            //    },
            //    error: function (err) {
            //    }
            //});
            // format table
            $('#table').bootstrapTable({
                columns: [{
                    field: 'codeBill',
                    title: 'Mã đơn',
                    align: 'center',
                    valign: 'middle',
                    events: reservationEvents,
                    formatter: reservationFormatter
                }, {
                    field: 'customer',
                    title: 'Khách đặt',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: true,
                }, {
                    field: 'sdt',
                    title: 'Số điện thoại',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: true,

                }, {
                    field: 'money',
                    title: 'Số tiền phải thu',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    // editable: true,
                }, {
                    field: 'address',
                    title: 'lộ trình',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    // editable: true,
                }, {
                    field: 'date',
                    title: 'Ngày',
                    align: 'center',
                    valign: 'middle',
                    // sortable: true,
                    //editable: false
                }, {
                    field: 'shiper',
                    title: 'người ship',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    // editable: true,
                }, {
                    field: 'note',
                    title: 'Ghi chú',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    // editable: true,
                }],
                data: [{
                    codeBill: '0001',
                    customer: 'Trần ngọc duy',
                    sdt: '0989485398',
                    money: '0',
                    address: 'số 17 ngõ 109 hoàng ngân thanh xuân',
                    date: '23/07/2017',
                    shiper: 'Thànhdc',
                    note: 'thu tiền'
                }, {
                    codeBill: '0002',
                    customer: 'Trần ngọc duy',
                    sdt: '0989485398',
                    money: '0',
                    address: 'số 17 ngõ 109 hoàng ngân thanh xuân',
                    date: '23/07/2017',
                    shiper: 'Thànhdc',
                    note: 'thu tiền'
                }, {
                    codeBill: '0003',
                    customer: 'Trần ngọc duy',
                    sdt: '0989485398',
                    money: '1,000,000',
                    address: 'số 17 ngõ 109 hoàng ngân thanh xuân',
                    date: '23/07/2017',
                    shiper: 'Thànhdc',
                    note: 'thu tiền'
                }, {
                    codeBill: '0004',
                    customer: 'Trần ngọc duy',
                    sdt: '0989485398',
                    money: '0',
                    address: 'số 17 ngõ 109 hoàng ngân thanh xuân',
                    date: '23/07/2017',
                    shiper: 'Thànhdc',
                    note: 'thu tiền'
                }, {
                    codeBill: '0005',
                    customer: 'Trần ngọc duy',
                    sdt: '0989485398',
                    money: '0',
                    address: 'số 17 ngõ 109 hoàng ngân thanh xuân',
                    date: '23/07/2017',
                    shiper: 'Thànhdc',
                    note: 'thu tiền'
                }, {
                    codeBill: '0006',
                    customer: 'Trần ngọc duy',
                    sdt: '0989485398',
                    money: '0',
                    address: 'số 17 ngõ 109 hoàng ngân thanh xuân',
                    date: '23/07/2017',
                    shiper: 'Thànhdc',
                    note: 'thu tiền'
                }, {
                    codeBill: '0007',
                    customer: 'Trần ngọc duy',
                    sdt: '0989485398',
                    money: '0',
                    address: 'số 17 ngõ 109 hoàng ngân thanh xuân',
                    date: '23/07/2017',
                    shiper: 'Thànhdc',
                    note: 'thu tiền'
                }, {
                    codeBill: '0008',
                    customer: 'Trần ngọc duy',
                    sdt: '0989485398',
                    money: '0',
                    address: 'số 17 ngõ 109 hoàng ngân thanh xuân',
                    date: '23/07/2017',
                    shiper: 'Thànhdc',
                    note: 'thu tiền'
                }, {
                    codeBill: '0009',
                    customer: 'Trần ngọc duy',
                    sdt: '0989485398',
                    money: '0',
                    address: 'số 17 ngõ 109 hoàng ngân thanh xuân',
                    date: '23/07/2017',
                    shiper: 'Thànhdc',
                    note: 'thu tiền'
                }, {
                    codeBill: '0010',
                    customer: 'Trần ngọc duy',
                    sdt: '0989485398',
                    money: '0',
                    address: 'số 17 ngõ 109 hoàng ngân thanh xuân',
                    date: '23/07/2017',
                    shiper: 'Thànhdc',
                    note: 'thu tiền'
                }, {
                    codeBill: '0011',
                    customer: 'Trần ngọc duy',
                    sdt: '0989485398',
                    money: '0',
                    address: 'số 17 ngõ 109 hoàng ngân thanh xuân',
                    date: '23/07/2017',
                    shiper: 'Thànhdc',
                    note: 'thu tiền'
                }],
            });
        });
        // function
        function userFormatter(data) {
            return data.length;
        }
        function reservationFormatter(value, row, index) {
            return [
                '<a class="edit" href="javascript:void(0)" title="mã rỉevation">',
                '' + row.codeBill + '',
                '</a>  ',
            ].join('');
        }

        window.reservationEvents = {
            'click .edit': function (e, value, row, index) {
                //window.location = '/UserManger.aspx?paramId=' + row.id;
                alert('Sự kiện chuyển màn hình');
            },
            'click .remove': function (e, value, row, index) {
                $('#table').bootstrapTable('remove', {
                    field: 'id',
                    values: [row.id]
                });
            }
        };



    </script>
    <div style ="margin-left:10px;margin-right:10px">
         <table id="table" 
      data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-page-list="[10, 25, 50, 100, ALL]" 
        ></table>
    </div>
    </asp:Content>


