<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="BC004_RevenueFormSource.aspx.cs" Inherits="SYSGREEN.c" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
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
    
    <script>
        $(function () {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getvBaoCao02');
            var json = { 'ID': 0 };
            formDataListUser.append('data', JSON.stringify(json));
            formDataListUser.append('Ngay', "");
            $.ajax({
                url: "Configuation/HandlerBaoCao.ashx",
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
                            obj.customer = true;
                            obj.reason = objectData.SoTien;
                            obj.user = objectData.MaNganHang;

                            obj.user = objectData.GhiChu;
                            var data_ngay = objectData.Ngay;
                            var z = "";
                            if (data_ngay) {
                                var x = data_ngay.substr(0, 10);
                                var y = x.split("-");
                                var y1 = y[0];
                                var y2 = y[1];
                                var y3 = y[2];
                                z = y3 + "/" + y2 + "/" + y1;
                            }
                            obj.time = z;
                            obj.total = objectData.NoiDungChi;
                        }
                    }
                    data = arr;
                    getDataTable(data);
                },
                error: function (err) {

                }
            });
            
        });
        var getDataTable = function (itemData) {

        };

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
    
    </asp:Content>

