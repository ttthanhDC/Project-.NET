<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="BC005_StatisticalFormShiper.aspx.cs" Inherits="SYSGREEN.BC005_StatisticalFormShiper" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
     <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
               
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_dept" placeholder="Cơ sở" />
                </div>
                <div class="col-md-2">
                    <input type="date" class="form-control" name="title" id="txt_beginDate" placeholder ="Ngày bắt đầu"  />
                </div>
                <div class="col-md-2">
                    <input type="date" class="form-control" name="title" id="txt_EndDate" placeholder= "Ngày kết thúc" />
                </div>
                <div class="col-md-1">
                    <input type="text" class="form-control" name="title" id="txt_shiperCode" placeholder="Mã shiper" />
                  
                </div>
                  <div class="col-md-2"> 
                    <input type="text" class="form-control" name="title" id="txt_NameShiper" placeholder="Tên Shiper"  />
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
         <table id="table" 
       data-pagination="true"
        data-page-list="[10, 25, 50, 100, ALL]" 
        ></table>
    </div>
      <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-4"></label>
                <label for="sel1" class="col-md-2">Nhận</label>
                <label for="sel1" class="col-md-2">Đi</label>
                <label for="sel1" class="col-md-2">Trả về</label>
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
    <script>
        $(function () {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getvBaoCao05');
            var json = { 'ID': 0 };
            formDataListUser.append('data', JSON.stringify(json));
            formDataListUser.append('tuNgay', "");
            formDataListUser.append('denNgay', "");
            formDataListUser.append('shipperName', "");

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
                            obj.isShiper = true;
                            obj.name = objectData.SoTien;
                            obj.take = objectData.MaNganHang;

                            obj.go = objectData.GhiChu;
                            obj._return = z;
                            obj.noney = objectData.NoiDungChi;
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
                    field: 'id',
                    title: 'Mã chuyến đi',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'isShiper',
                    title: 'Mã shiper',
                    align: 'center',
                    valign: 'middle',
                    events: reservationEvents,
                    formatter: reservationFormatter

                }, {
                    field: 'name',
                    title: 'Họ tên',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'take',
                    title: 'Nhận',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'go',
                    title: 'Đi',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: '_return',
                    title: 'Trả về',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'noney',
                    title: 'Số tiền thu được',
                    align: 'center',
                    valign: 'middle',
                }],
                data : itemData
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


