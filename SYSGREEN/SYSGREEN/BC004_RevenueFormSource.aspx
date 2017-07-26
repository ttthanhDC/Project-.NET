<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="BC004_RevenueFormSource.aspx.cs" Inherits="SYSGREEN.c" %>

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
            
        });
        // function
        //function userFormatter(data) {
        //    return data.length;
        //}
        //function reservationFormatter(value, row, index) {
        //    return [
        //        '<a class="edit" href="javascript:void(0)" title="mã rỉevation">',
        //        '' + row.id + '',
        //        '</a>  ',
        //    ].join('');
        //}

        //window.reservationEvents = {
        //    'click .edit': function (e, value, row, index) {
        //        //window.location = '/UserManger.aspx?paramId=' + row.id;
        //        alert('Sự kiện chuyển màn hình');
        //    },
        //    'click .remove': function (e, value, row, index) {
        //        $('#table').bootstrapTable('remove', {
        //            field: 'id',
        //            values: [row.id]
        //        });
        //    }
        //};

        // Build the chart
        Highcharts.chart('container', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Browser market shares January, 2015 to May, 2015'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [{
                    name: 'Microsoft Internet Explorer',
                    y: 56.33
                }, {
                    name: 'Chrome',
                    y: 24.03,
                    sliced: true,
                    selected: true
                }, {
                    name: 'Firefox',
                    y: 10.38
                }, {
                    name: 'Safari',
                    y: 4.77
                }, {
                    name: 'Opera',
                    y: 0.91
                }, {
                    name: 'Proprietary or Undetectable',
                    y: 0.2
                }]
            }]
         });
    </script>
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-5"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_beginDate" placeholder="Ngày bắt đầu"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_EndDate" placeholder="Ngày kết thúc" />
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-default" id="btSearch">Xem</button>
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-default" id="btPrint">In</button>
                </div>
            </div> 
        </div> 
        </div>
    <div style ="margin-left:10px;margin-right:10px;">
       Show biểu đồ
    </div>
      <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-1">Nguồn</label>
                <label for="sel1" class="col-md-2">Số lượng đơn</label>
                <label for="sel1" class="col-md-2">Số lượng ship</label>
                <label for="sel1" class="col-md-2">Dự kiến thu</label>
            </div> 
        </div> 
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-1">Khách cũ</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_kc_soDon" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_kc_soShip" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_kc_duKien" readOnly = 'true' />
                </div>
            </div> 
        </div> 
     <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-1">Facebook</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_fb_soDon" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_fb_soShip" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_fb_duKien" readOnly = 'true' />
                </div>
            </div> 
        </div> 
     <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-1">Website</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_WS_soDon" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_WS_soShip" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_WS_duKien" readOnly = 'true' />
                </div>
            </div> 
        </div> 
     <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-1">Tổng</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_T_soDon" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_T_soShip" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_T_duKien" readOnly = 'true' />
                </div>
            </div> 
        </div> 
    
    </asp:Content>

