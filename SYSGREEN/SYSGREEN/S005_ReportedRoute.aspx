<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S005_ReportedRoute.aspx.cs" Inherits="SYSGREEN.S005_ReportedRoute" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <script>
        $(function () {
            // load data 
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getALLData');
            var json = { 'ID': 0 };
            formDataListUser.append('data', JSON.stringify(json));
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

                            obj.codeBill = objectData.MaReservation || "";
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
                            obj.customer = objectData.TenKH_HD || "";
                            obj.sdt = objectData.SoDienThoai || "";
                            var add1 = objectData.DiaChi || "";
                            var add2 = objectData.TenQuan || "";
                            var add3 = add1 + " " + add2;
                            obj.address = add3 || "";
                            obj.money = objectData.Create_User;// chua có
                            obj.shiper = objectData.shipName || "";
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
    <div style ="margin-left:10px;margin-right:10px">
         <table id="table" 
      data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-page-list="[10, 25, 50, 100, ALL]" 
        ></table>
    </div>
    </asp:Content>


