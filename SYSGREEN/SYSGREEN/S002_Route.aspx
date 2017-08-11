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
         <div style ="width: 100%;text-align:right"><button type="button" class="btn btn-primary" id="btTaoLoTrinh">Tạo lộ trình</button><button type="button" class="btn btn-primary" id="btLuu">lưu data</button></div>
        <table id="tableLoTrinh"></table>
       
    </div>
   
<script>
    // Bootstrap Table
    $(function () {
        var itemData = [];
        getDataTableLoTrinh(itemData);
    });
  
    $('#btTKLoTrinh').on('click', function (e) {
        eventSearch();
    });
    var eventSearch = function () {
        var data = [];
        var formDatasearch = new FormData();
        formDatasearch.append('type', 'ViewLoTrinhShipper');

        var NgayLotrinh = $('#txt_ngayTT').val();
        var MaLoTrinh = $('#txt_IDLoTinh').val();
        var ShipName = $('#txt_shipNameTT').val();
        var ShipNumber = $('#txt_ShipNumberTT').val();
        var TrangThai = $('#txt_ttLoTrinh').val();

        formDatasearch.append('NgayLotrinh', NgayLotrinh);
        formDatasearch.append('MaLoTrinh', MaLoTrinh);
        formDatasearch.append('ShipName', ShipName);
        formDatasearch.append('ShipNumber', ShipNumber);
        formDatasearch.append('TrangThai', TrangThai);
        var json = { 'ID': 0 };
        formDatasearch.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerShipper.ashx",
            type: "POST",
            data: formDatasearch,
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

                        obj.codeLT = objectData.MaLoTrinh;
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
                        obj.date = z;
                        obj.shipName = objectData.ShipperName || "";
                        obj.shipNo = objectData.ShipperNumber || "";
                        obj.user = objectData.NguoiTao || "";
                        if (objectData.TrangThai === "Chưa xử lý") {
                            obj.status = 1;
                        } else if (objectData.TrangThai === "Đang xử lý") {
                            obj.status = 2;
                        } else if (objectData.TrangThai === "Hoàn thành") {
                            obj.status = 3;
                        } else {
                            obj.status = 0;
                        }
                        obj.ShipID = objectData.ShipID || "";
                        arr.push(obj);
                    }
                }
                data = arr;
                var $table = $('#tableLoTrinh');
                $table.bootstrapTable('load', data);
            },
            error: function (err) {
            }
        });
    };
    $('#btTaoLoTrinh').on('click', function (e) {
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'InsertLoTrinhShipperReturnId');
        var json = { 'ID': 0 };
        formDataListUser.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerShipper.ashx",
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
    $('#btLuu').on('click', function (e) {
        var formDataSave = new FormData();
        formDataSave.append('type', 'UpdateLoTrinhShipper');
        var datatable = $('#tableLoTrinh').bootstrapTable('getData');
        var listIdLoTrinh = [];
        var listStatus = [];
        var lstTT = $('#tableLoTrinh select.select1 option:selected');
        if (datatable) {
            for (var i = 0; i < datatable.length; i++) {
                if (datatable[i].check && datatable[i].id) {
                    listIdLoTrinh.push(datatable[i].id);
                    listStatus.push(lstTT[i].text);
                }
            }
        }
       
        var json = {
            'listStatus': listStatus,
            'listIdLoTrinh': listIdLoTrinh,
        };
        formDataSave.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerShipper.ashx",
            type: "POST",
            data: formDataSave,
            contentType: false,
            processData: false,
            success: function (result) {
                var maLT = result;
                // chuyển màn hình tạo data cho mã lộ trình
                //window.location = '/S001_ListShiper.aspx?paramId=' + maLT;
            },
            error: function (err) {
            }
        });
    });

    // getdata table lộ trình
    var getDataTableLoTrinh = function (itemData) {
        $('#tableLoTrinh').bootstrapTable({
            columns: [{
                field: 'check',
                title: 'Tích',
                align: 'center',
                valign: 'middle',
                checkbox: true
            }, {
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
                field: 'operate1',
                title: 'Nhập liệu bill',
                align: 'center',
                valign: 'middle',
                events: operateEventsBill,
                formatter: operateFormatterBill
            }, {
                field: 'operate2',
                title: 'View lộ trình',
                align: 'center',
                valign: 'middle',
                events: operateEventsView,
                formatter: operateFormatterView
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
            'Sửa',
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
            formData.append('type', 'DeleteTrinhShipper');
            formData.append('IdLotrinh', id);
            $.ajax({
                url: "Configuation/HandlerShipper.ashx",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function (result) {
                    eventSearch();
                },
                error: function (err) {
                    eventSearch();
                }
            });
        }
    };
    // operater 1
    function operateFormatterBill(value, row, index) {
        return [
            '<a class="bill" href="javascript:void(0)" title="Nhập liệu bill">',
            'Nhập liệu bill',
            '</a>  '
        ].join('');
    }

    window.operateEventsBill = {
        'click .bill': function (e, value, row, index) {
            window.location = '/S003_InputBill.aspx?paramId=' + row.id;
            //alert('You click like action, row: ' + JSON.stringify(row));
        }
    };
    // operater 2
    function operateFormatterView(value, row, index) {
        return [
            '<a class="view" href="javascript:void(0)" title="view">',
            'View lộ trình',
            '</a>  '
        ].join('');
    }

    window.operateEventsView = {
        'click .view': function (e, value, row, index) {
            window.location = '/S005_ReportedRoute.aspx?paramId=' + row.id;
            //alert('You click like action, row: ' + JSON.stringify(row));
        }
    };
</script>
    </asp:Content>



