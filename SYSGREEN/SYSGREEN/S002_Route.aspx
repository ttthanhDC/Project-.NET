<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S002_Route.aspx.cs" Inherits="SYSGREEN.S002_Route" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px" id ="div_LoTrinh">
         <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ngayTT" placeholder="Ngày"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_IDLoTinh" placeholder="ID lộ trình" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_shipNameTT" placeholder="Ship name"/>
                </div>
                 <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ShipNumberTT"placeholder="Shiper number" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ttLoTrinh"placeholder="Trạng thái Lộ trình" />
                </div>
                  <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="btTKLoTrinh">Tìm kiếm lộ trình</button>
                </div>
                
            </div> 
        </div> 
    </div>
    <div style ="margin-left:20px;margin-right:20px" id ="div_TableLoTrinh">
        <div style ="width: 100%;text-align:right"><button type="button" class="btn btn-primary" id="btLuu">lưu data</button></div>
        <table id="tableLoTrinh"></table>
        <div style ="width: 100%;text-align:center;margin-top:20px"><button type="button" class="btn btn-primary" id="btTaoLoTrinh">Tạo lộ trình</button></div>
    </div>
   
<script>
    // Bootstrap Table
    $(function () {
        var itemData = [];
        getDataTableLoTrinh(itemData);
    });
  
    $('#btTKLoTrinh').on('click', function (e) {
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

                        obj.codeLT = objectData.MaReservation;
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
                        obj.shipName = objectData.TenQuan || "";
                        obj.shipNo = objectData.TrangThaiNHD || "";
                        obj.user = objectData.TenKH_HD || "";
                        if (objectData.TenKH_HD === "Chưa xử lý") {
                            obj.status = 1;
                        } else if (objectData.TenKH_HD === "Đang xử lý") {
                            obj.status = 2;
                        } else if (objectData.TenKH_HD === "Hoàn thành") {
                            obj.status = 3;
                        } else {
                            obj.status = 0;
                        }
                        arr.push(obj);
                    }
                }
                data = arr;
                getDataTableLoTrinh(data);
            },
            error: function (err) {
            }
        });
    });
    $('#btTaoLoTrinh').on('click', function (e) {
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
                var maLT = result;
                // chuyển màn hình tạo data cho mã lộ trình
                window.location = '/S001_ListShiper.aspx?paramId=' + maLT;
            },
            error: function (err) {
            }
        });
    });
    

    // getdata table lộ trình
    var getDataTableLoTrinh = function (itemData) {
        $('#tableLoTrinh').bootstrapTable({
            columns: [{
                field: 'codeLT',
                title: 'Mã lộ trình',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<label style = "color: blue;">' + value + '</label>';
                }
            }, {
                field: 'shipName',
                title: 'Ship Name',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'shipNo',
                title: 'Ship Number',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'date',
                title: 'Ngày tạo lộ trình',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'user',
                title: 'User tạo lộ trình',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'status',
                title: 'Trạng thái',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value === 1) {
                        return '<select class="select1" id="Bill' + index + '"> <option value = 0></option><option value = 1 selected = true>Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option></select>'
                    } else if (value === 2) {
                        return '<select class="select1" id="Bill' + index + '"> <option value = 0></option><option value = 1>Chưa xử lý</option><option value = 2  selected = true>Đang xử lý</option><option value = 3>Hoàn thành</option></select>'
                    } else if (value === 3) {
                        return '<select class="select1" id="Bill' + index + '"> <option value = 0></option><option value = 1>Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3  selected = true>Hoàn thành</option></select>'
                    } else {
                        return '<select class="select1" id="Bill' + index + '"> <option value = 0  selected = true></option><option value = 1>Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option></select>'
                    }
                }
            }, {
                field: 'operate',
                title: 'Thao tác',
                align: 'center',
                valign: 'middle',
                events: operateEvents,
                formatter: operateFormatter
            }],

            data: itemData
        });
    };
   
    // function
    function userFormatter(data) {
        return data.length;
    }
    function operateFormatter(value, row, index) {
        return [
            '<a class="chiTiet" href="javascript:void(0)" title="Chi Tiết">',
            'Chi tiết',
            '</a>  ', '|',
            '<a class="remove" href="javascript:void(0)" title="Xoá">',
            'Xóa',
            '</a>',
        ].join('');
    }

    window.operateEvents = {
        'click .chiTiet': function (e, value, row, index) {
            window.location = '/S001_ListShiper.aspx?paramId=' + row.id;
            //alert('You click like action, row: ' + JSON.stringify(row));
        },
        'click .remove': function (e, value, row, index) {
            var formData = new FormData();
            var id = parseInt(row.id + "");
            var json = { 'ID': id };
            jQuery.ajaxSetup({ async: true });
            formData.append('type', 'delete');
            formData.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerSysUser.ashx",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function (result) {
                    $('#table').bootstrapTable('remove', {
                        field: 'id',
                        values: [row.id]
                    });
                },
                error: function (err) {
                    $('#table').bootstrapTable('remove', {
                        field: 'id',
                        values: [row.id]
                    });
                }
            });
        }
    };
</script>
    </asp:Content>



