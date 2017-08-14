<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S004_ReportedOver.aspx.cs" Inherits="SYSGREEN.S004_ReportedOver" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
     <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-7"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_date" placeholder="Ngày bắt đầu" />
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-default" id="btSearch">Tìm kiếm</button>
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-default" id="btPrint">In</button>
                </div>
            </div> 
        </div> 
         <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-7"> Báo cáo theo ca</label>
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
                <label for="sel1" class="col-md-2">Tổng</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_tong" readOnly = 'true' />
                </div>
            </div> 
        </div> 
    
    <script>
        $(function () {
            // load data by id
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getALLDataByIdLoTrinh');
            //var json = { 'IdLotrinh': 0 };
            formDataListUser.append('IdLotrinh', window.idParam);
            $.ajax({
                url: "Configuation/Handler1Test.ashx",
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
                            obj.idLT = objectData.ID_NHD;
                            obj.shipname = objectData.HinhThucThanhToan;
                            obj.user = objectData.GhiChu;
                            obj.money = objectData.SoTienThu || "";
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
                            obj.date = z;
                            // userName
                            arr.push(obj);
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
            $('#table').bootstrapTable({
                columns: [{
                    field: 'idLT',
                    title: 'Mã Lộ trình',
                    align: 'center',
                    valign: 'middle',
                    events: reservationEvents,
                    formatter: reservationFormatter
                }, {
                    field: 'shipname',
                    title: 'Ship name',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'date',
                    title: 'Ngày tạo',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'money',
                    title: 'Tiền',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'user',
                    title: 'User quản lý',
                    align: 'center',
                    valign: 'middle',
                }],
                data: itemData
            });
        };
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
