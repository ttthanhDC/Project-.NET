﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S002_Route.aspx.cs" Inherits="SYSGREEN.S002_Route" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px" id ="div_LoTrinh">
         <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-2">
                    
                </div>
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
                    <input type="text" class="form-control" name="title" id="txt_ttLoTrinh"placeholder="Trạng thái Lộ trình" />
                </div>
                  <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="btTKLoTrinh">Tìm kiếm lộ trình</button>
                </div>
                
            </div> 
        </div> 
    </div>
    <div style ="margin-left:20px;margin-right:20px" id ="div_TableLoTrinh">
         <div style ="width: 100%;text-align:right"><button type="button" class="btn btn-primary" id="btTaoLoTrinh">Tạo lộ trình</button></div>
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
        //var ShipNumber = $('#txt_ShipNumberTT').val();
        var TrangThai = $('#txt_ttLoTrinh').val();

        formDatasearch.append('NgayLotrinh', NgayLotrinh);
        formDatasearch.append('MaLoTrinh', MaLoTrinh);
        formDatasearch.append('ShipName', ShipName);
        formDatasearch.append('ShipNumber', "");
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
                if (jsonData === "0") {

                }else if (jsonData && jsonData.length > 0) {
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
                            obj.status = 1;
                        }
                        obj.ShipID = objectData.ShipID || "";
                        obj.MaLoTrinh = objectData.MaLoTrinh || "";
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
                var y = maLT.split(",")
                var x = parseInt(y[0]);
                window.location = '/S001_ListShiper.aspx?paramId=' + x + '&MaLoTrinh=' + y[1];
            },
            error: function (err) {
            }
        });
    });
   /* $('#btLuu').on('click', function (e) {
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
    });*/

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
                field: 'operate3',
                title: 'Lưu lộ trình',
                align: 'center',
                valign: 'middle',
                events: operateEventsSave,
                formatter: operateFormatterSave
            }, {
                field: 'operate4',
                title: 'Sửa',
                align: 'center',
                valign: 'middle',
                events: operateEventsEdit,
                formatter: operateFormatterEdit
            }, {
                field: 'operate',
                title: 'Xóa',
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
            '<a class="remove" href="javascript:void(0)" title="Xoá">',
            'Xóa',
            '</a>',
        ].join('');
    }

    window.operateEvents = {
        
       
        // delete
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
    // operater 3
    function operateFormatterSave(value, row, index) {
        return [
           '<a class="save" href="javascript:void(0)" title="Lưu data">',
            'Lưu lộ trình',
            '</a>  ', 
            
        ].join('');
    }

    window.operateEventsSave = {
        // save 
        'click .save': function (e, value, row, index) {
            var formDataSave = new FormData();
            formDataSave.append('type', 'UpdateLoTrinhShipper');
            var lst = $('#tableLoTrinh select.select1 option:selected');
            var listIdLoTrinh = [];
            var listStatus = [];
            listStatus.push(lst[index].text);
            listIdLoTrinh.push(row.id);
            var json = {
                'listStatus': listStatus,
                'listIdLoTrinh': listIdLoTrinh,
            };
            formDataSave.append('data', JSON.stringify(json));
            if (listStatus.push(lst[index].text) === "Hoàn thành") {
                alert("Lộ trình đang ở trạng thái hoàn thành. Vui lòng ko chuyển trạng thái.");
            }
            $.ajax({
                url: "Configuation/HandlerShipper.ashx",
                type: "POST",
                data: formDataSave,
                contentType: false,
                processData: false,
                success: function (result) {
                    if (result === 1 || result === "1") {
                        alert("Lưu thành công.");
                    } else if (result === 2 || result === "2") {
                        alert(" Lưu thông tin không thành công trạng thái đang xử lý. Có ngày hóa đơn đang không ở trạng thái Chưa sử lý");
                    } else if (result === 3 || result === "3") {
                        alert("Lưu thông tin không thành công trạng thái hoàn thành.. Có ngày hóa đơn đang không ở trạng thái Hoàn thành");
                    } else if (result === 4 || result === "4") {
                        alert("Lưu thông tin không thành công trạng thái Đang xử lý về Chưa xử lý.");
                    }

                    // 1 : Lưu thành công
                    // 2 : Lưu thông tin không thành công trạng thái đang xử lý
                    // 3 : Lưu thông tin không thành công trạng thái hoàn thành
                    // 4  : Lưu thông tin không thành công trạng thái Đang xử lý về Chưa xử lý 
                },
                error: function (err) {
                }
            });
        },
    };
    // operater 4
    function operateFormatterEdit(value, row, index) {
        return [
           '<a class="chiTiet" href="javascript:void(0)" title="Chi Tiết">',
            'Sửa',
            '</a>  ', 
        ].join('');
    }

    window.operateEventsEdit = {
        'click .chiTiet': function (e, value, row, index) {
            window.location = '/S001_ListShiper.aspx?paramId=' + row.id + '&MaLoTrinh=' + row.MaLoTrinh;
            //alert('You click like action, row: ' + JSON.stringify(row));
        },
    };
</script>
    </asp:Content>



