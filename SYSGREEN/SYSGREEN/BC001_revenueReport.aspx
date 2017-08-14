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
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btPrint">In</button>
                </div>
            </div> 
        </div> 
        </div>
    <div style ="margin-left:10px;margin-right:10px">
         <table id="table" 
        ></table>
    </div>
    <div style ="height:20px"></div>
    <div class="form-horizontal">
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
                <label for="sel1" class="col-md-2">Tổng</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_tong" readOnly = 'true' />
                </div>
            </div> 
        </div> 
    
    <script>
        $(function () {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getvBaoCao01');
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
                    var tienMat = 0;
                    var chuyenKhoan = 0;
                    var total = 0;
                    if (jsonData && jsonData.length > 0) {
                        for (var i = 0; i < jsonData.length ; i++) {
                            var objectData = jsonData[i];
                            var obj = {};
                            if (objectData.Name) {
                                obj.id = objectData.MaHD +"-"+ objectData.Name;
                            } else {
                                obj.id = objectData.MaHD + "-Đơn lẻ";
                            }
                            obj.IDGoi = objectData.IDGoi;
                            obj.ID_HD = objectData.ID_HD;
                            obj.ID_PCTHD = objectData.ID_PCTHD;
                            obj.customer = objectData.CustomerName || "";
                            obj.address = objectData.TenQuan || "";
                            obj.typePay = objectData.HinhThucThanhToan || "";
                            if (obj.typePay === "Chuyển khoản") {
                                chuyenKhoan = chuyenKhoan + objectData.TongTien;
                            } else if (obj.typePay === "Tiền mặt") {
                                tienMat = tienMat + objectData.TongTien;
                            }
                            obj.user = objectData.NguoiTao || "";
                            var data_ngay = objectData.NgayTao;
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
                            obj.total = objectData.TongTien || "";
                            arr.push(obj);
                        }
                    }
                    total = tienMat + chuyenKhoan;
                    $('#txt_TienMat').val(tienMat);
                    $('#txt_chuyenKhoan').val(chuyenKhoan);
                    $('#txt_tong').val(total);
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
                data: itemData
            });
        };
        // function 
        $('#btSearch').on('click', function (e) {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getvBaoCao01');
            var json = { 'ID': 0 };
            formDataListUser.append('data', JSON.stringify(json));
            formDataListUser.append('Ngay', $('#txt_date').val());
            $.ajax({
                url: "Configuation/HandlerBaoCao.ashx",
                type: "POST",
                data: formDataListUser,
                contentType: false,
                processData: false,
                success: function (result) {
                    var arr = [];
                    if (result === "0") {

                    } else {
                        var jsonData = result;
                        
                        var tienMat = 0;
                        var chuyenKhoan = 0;
                        var total = 0;
                        if (jsonData && jsonData.length > 0) {
                            for (var i = 0; i < jsonData.length ; i++) {
                                var objectData = jsonData[i];
                                var obj = {};
                                if (objectData.Name) {
                                    obj.id = objectData.MaHD + "-" + objectData.Name;
                                } else {
                                    obj.id = objectData.MaHD + "-Đơn lẻ";
                                }
                                obj.IDGoi = objectData.IDGoi;
                                obj.ID_HD = objectData.ID_HD;
                                obj.ID_PCTHD = objectData.ID_PCTHD;
                                obj.customer = objectData.CustomerName || "";
                                obj.address = objectData.TenQuan || "";
                                obj.typePay = objectData.HinhThucThanhToan || "";
                                if (obj.typePay === "Chuyển khoản") {
                                    chuyenKhoan = chuyenKhoan + objectData.TongTien;
                                } else if (obj.typePay === "Tiền mặt") {
                                    tienMat = tienMat + objectData.TongTien;
                                }
                                obj.user = objectData.NguoiTao || "";
                                var data_ngay = objectData.NgayTao;
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
                                obj.total = objectData.TongTien || "";
                                arr.push(obj);
                            }
                        }
                    }
                    
                    total = tienMat + chuyenKhoan;
                    $('#txt_TienMat').val(tienMat);
                    $('#txt_chuyenKhoan').val(chuyenKhoan);
                    $('#txt_tong').val(total);
                    data = arr;
                    var $table = $('#table');
                    $table.bootstrapTable('load', data);
                },
                error: function (err) {

                }
            });
        });
           
        $('#btPrint').on('click', function (e) {
            alert("IN")
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
