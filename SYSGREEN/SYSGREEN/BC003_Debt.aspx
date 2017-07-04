<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="BC003_Debt.aspx.cs" Inherits="SYSGREEN.BC003_Debt" %>

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
            //                id
            //obj.TypeCustomer = objectData.ID;
            //obj.customer = objectData.ID;
            // obj.phoneNumber = objectData.ID;
            //obj.address = objectData.ID;
            //obj.dayRemaining = objectData.ID;
            // obj.userCreatez = objectData.ID;
            //obj.time = objectData.ID;
            //obj.collect = objectData.ID;
            // obj.total = objectData.ID;
            //obj.missing = objectData.ID;

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
                    field: 'id',
                    title: 'Mã reservation',
                    align: 'center',
                    valign: 'middle',
                    events: reservationEvents,
                    formatter: reservationFormatter
                }, {
                    field: 'TypeCustomer',
                    title: 'Loại Khach',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: true,
                }, {
                    field: 'customer',
                    title: 'Khách đặt',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: true,
                }, {
                    field: 'phoneNumber',
                    title: 'SĐT',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    //editable: true,

                }, {
                    field: 'address',
                    title: 'Quận',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    // editable: true,
                }, {
                    field: 'dayRemaining',
                    title: 'Số ngày còn giao',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: false
                }, {
                    field: 'userCreate',
                    title: 'User tạo',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: false
                }, {
                    field: 'time',
                    title: 'Time',
                    align: 'center',
                    valign: 'middle',
                    // sortable: true,
                    //editable: false
                }, {
                    field: 'collect',
                    title: 'Thu',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: false
                }, {
                    field: 'total',
                    title: 'Tổng',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: false
                }, {
                    field: 'missing',
                    title: 'Thiếu',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: false
                }],
                data: [{
                    id : '1',
                    TypeCustomer : 'Vip',
                    customer : 'Đặng công thành',
                    phoneNumber : '0989485398',
                    address : 'Thanh xuân',
                    dayRemaining : '10',
                    userCreate : 'duytn',
                    time : '20/07/2017',
                    collect : '1,000,000',
                    total : '10,000,000',
                    missing: '9,000,000'
                }, {
                    id: '1',
                    TypeCustomer: 'Vip',
                    customer: 'Đặng công thành',
                    phoneNumber: '0989485398',
                    address: 'Thanh xuân',
                    dayRemaining: '10',
                    userCreate: 'duytn',
                    time: '20/07/2017',
                    collect: '1,000,000',
                    total: '10,000,000',
                    missing: '9,000,000'
                }, {
                    id: '1',
                    TypeCustomer: 'Vip',
                    customer: 'Đặng công thành',
                    phoneNumber: '0989485398',
                    address: 'Thanh xuân',
                    dayRemaining: '10',
                    userCreate: 'duytn',
                    time: '20/07/2017',
                    collect: '1,000,000',
                    total: '10,000,000',
                    missing: '9,000,000'
                }, {
                    id: '1',
                    TypeCustomer: 'Vip',
                    customer: 'Đặng công thành',
                    phoneNumber: '0989485398',
                    address: 'Thanh xuân',
                    dayRemaining: '10',
                    userCreate: 'duytn',
                    time: '20/07/2017',
                    collect: '1,000,000',
                    total: '10,000,000',
                    missing: '9,000,000'
                }, {
                    id: '1',
                    TypeCustomer: 'Vip',
                    customer: 'Đặng công thành',
                    phoneNumber: '0989485398',
                    address: 'Thanh xuân',
                    dayRemaining: '10',
                    userCreate: 'duytn',
                    time: '20/07/2017',
                    collect: '1,000,000',
                    total: '10,000,000',
                    missing: '9,000,000'
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
                '' + row.id + '',
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
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-1"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_beginDate" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_EndDate" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_TypeCustomer" />
                  
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_TypeBill" />
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-default" id="btSearch">Tìm kiếm</button>
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-default" id="btPrint">In</button>
                </div>
            </div> 
        </div> 
        </div>
    <div style ="margin-left:10px;margin-right:10px;">
         <table id="table" 
       data-pagination="true"
        data-page-list="[10, 25, 50, 100, ALL]" 
        ></table>
    </div>
      <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-4"></label>
                <label for="sel1" class="col-md-2">Thu</label>
                <label for="sel1" class="col-md-2">Tồng</label>
                <label for="sel1" class="col-md-2">Thiếu</label>
            </div> 
        </div> 
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-1">Tổng</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_thu" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_tong" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_thieu" readOnly = 'true' />
                </div>
            </div> 
        </div> 
    
    </asp:Content>

