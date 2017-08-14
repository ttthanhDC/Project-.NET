<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S005_ReportedRoute.aspx.cs" Inherits="SYSGREEN.S005_ReportedRoute" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   <div style ="margin-left:20px;margin-right:20px">
       <button type="button" class="btn btn-primary" id="btback">Quay lại</button>
       <table id="table"></table>
   </div> 
    <script>
        $(function () {
            // load data 
            var datatable = [];
            getDataTable(datatable);

            window.idParam = getQueryVariable("paramId");
            //alert("Data" + window.idParam);
            function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) {
                        return pair[1];
                    }
                }
            }
            // get data by id
            var data = [];
            var formDataListUser = new FormData();
           // formDataListUser.append('type', 'getALLDataByMaLoTrinh');
            //var json = { 'IdLotrinh': 0 };
           // var MaLT = $('#txt_maLoTrinh').val();
            // formDataListUser.append('MaLotrinh', MaLT);
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
                            obj.id = objectData.ID_NHD;
                            obj.idKH = objectData.IdKH;
                            obj.ID_PTCHD = objectData.ID_PTCHD;

                            obj.codeBill = objectData.MaReservation;
                            var data_ngay = objectData.Ngay;
                            var z = "";
                            if (data_ngay) {
                                var x = data_ngay.substr(0, 10);
                                var y = x.split("-");
                                var y1 = y[0];
                                var y2 = y[1];
                                var y3 = y[2];
                                z = y2 + "/" + y3 + "/" + y1;
                            }
                            obj.date = z;
                            obj.customer = objectData.TenKH_HD || "";
                            obj.sdt = objectData.SoDienThoai || "";
                            var add1 = objectData.DiaChi || "";
                            var add2 = objectData.TenQuan || "";
                            var add3 = add1 + " " + add2;
                            obj.address = add3 || "";
                            obj.money = objectData.SoTienThu;
                            obj.note = objectData.GhiChu;
                            obj.shiper = objectData.shipName || "";
                            arr.push(obj);
                        }
                    }
                    data = arr;
                    var $tableSearch = $('#table');
                    $tableSearch.bootstrapTable('load', data);
                    //getDataTable(data);
                },
                error: function (err) {
                }
            });

        });
        $('#btback').on('click', function (e) {
            window.location = '/S002_Route.aspx?paramId= 0';
        });
        // getdata table 
        var getDataTable = function (itemData) {
            $('#table').bootstrapTable({
                columns: [{
                    field: 'codeBill',
                    title: 'Mã đơn',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        return '<label style = "color: blue;">' + value + '</label>';
                    }
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
                    title: 'Lộ trình',
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
                    title: 'Shiper',
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
                data: itemData
            });
        };
    </script>
    
    </asp:Content>


