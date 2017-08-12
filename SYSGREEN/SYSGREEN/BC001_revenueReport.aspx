<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="BC001_revenueReport.aspx.cs" Inherits="SYSGREEN.BC001_revenueReport" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
     <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-5"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_dept" placeholder="Phòng ban"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_date" placeholder="Ngày"/>
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
    <div style ="margin-left:10px;margin-right:10px">
         <table id="table" 
       data-pagination="true"
        data-page-list="[10, 25, 50, 100, ALL]" 
        ></table>
    </div>
    <div style ="height:20px"></div>
    <div class="form-horizontal">
        <div class="form-group">
            <label for="sel1" class="col-md-7"></label>
            <label for="sel1" class="col-md-2">Nội bộ</label>
            <div class="col-md-2">
                <input type="text" class="form-control" name="title" id="txt_noiBo" readOnly = 'true' />
            </div>
        </div> 
    </div> 
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-7"></label>
                <label for="sel1" class="col-md-2">Tiền mặt</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_TienMat" readOnly = 'true' />
                </div>
            </div> 
        </div> 
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-7"></label>
                <label for="sel1" class="col-md-2">Chuyển khoản</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_chuyenKhoan" readOnly = 'true' />
                </div>
            </div> 
        </div> 
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-7"></label>
                <label for="sel1" class="col-md-2">Nợ</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_no" readOnly = 'true' />
                </div>
            </div> 
        </div> 
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-7"></label>
                <label for="sel1" class="col-md-2">Tổng</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_tong" readOnly = 'true' />
                </div>
            </div> 
        </div> 
    
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
                    field: 'id',
                    title: 'Mã reservation',
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
                    field: 'bill',
                    title: 'Đơn',
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
                    field: 'typePay',
                    title: 'Hình thức thanh toán',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    // editable: true,
                }, {
                    field: 'user',
                    title: 'User',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: false
                }, {
                    field: 'time',
                    title: 'Time',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: false
                }, {
                    field: 'total',
                    title: 'Tổng',
                    align: 'center',
                    valign: 'middle',
                    // sortable: true,
                    //editable: false
                }],
                data: [{
                    id : '1',
                    customer:'Trần ngọc duy',
                    bill : 'Đơn 001. 002',
                    address: 'Hà đông',
                    typePay:'Tiền mặt',
                    user :'Lễ tân 1',
                    time : '14:00',
                    total: '3,000,000'
                },{
                    id : '2',
                    customer:'Trần ngọc duy',
                    bill : 'Đơn 001. 002',
                    address: 'Hà đông',
                    typePay:'Tiền mặt',
                    user :'Lễ tân 1',
                    time : '14:00',
                    total: '3,000,000'
                }, {
                    id: '3',
                    customer: 'Trần ngọc duy',
                    bill: 'Đơn 001. 002',
                    address: 'Hà đông',
                    typePay: 'Tiền mặt',
                    user: 'Lễ tân 1',
                    time: '14:00',
                    total: '3,000,000'
                }, {
                    id: '4',
                    customer: 'Trần ngọc duy',
                    bill: 'Đơn 001. 002',
                    address: 'Hà đông',
                    typePay: 'Tiền mặt',
                    user: 'Lễ tân 1',
                    time: '14:00',
                    total: '3,000,000'
                }, {
                    id: '5',
                    customer: 'Trần ngọc duy',
                    bill: 'Đơn 001. 002',
                    address: 'Hà đông',
                    typePay: 'Tiền mặt',
                    user: 'Lễ tân 2',
                    time: '14:00',
                    total: '3,000,000'
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
   
    </asp:Content>
