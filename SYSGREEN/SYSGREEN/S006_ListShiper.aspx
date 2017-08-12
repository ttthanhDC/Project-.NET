<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S006_ListShiper.aspx.cs" Inherits="SYSGREEN.S006_ListShiper" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner">
          <div class="form-horizontal">
            <div class="form-group">
                 <label for="sel1" class="col-md-8"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_name" placeholder="Ship name"/>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
                 <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btAdd">Thêm</button>
                </div>
            </div> 
        </div> 
    </div>
    <div style ="margin-left:20px;margin-right:20px" id ="div_ListShip">
        <table id="table"></table>
    </div>
   
<script>
    // Bootstrap Table
    $(function () {
       
        // loadData
        var data = [];
        var formDataShip = new FormData();
        formDataShip.append('type', 'getAllShiper');
        var json = { 'ID': 0 };
        formDataShip.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/Handler1Test.ashx",
            type: "POST",
            data: formDataShip,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.id = objectData.SHIPER_ID;
                        if (objectData.NUMBER) {
                            obj.shipNo = objectData.NUMBER
                        } else {
                            if (obj.id <10) {
                                obj.shipNo = "S00" + obj.id;
                            } else {
                                obj.shipNo = "S0" + obj.id;
                            }
                        }
                       // obj.shipNo = objectData.NUMBER || "";
                        obj.shipName = objectData.NAME || "";
                        obj.adress = objectData.DiaChi || "";
                        //obj.date = objectData.NgayTao || "";
                        obj.desc = objectData.DESCRIPTION || "";
                       
                        obj.phone = objectData.SoDienThoai || "";
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
    // 
    $('#btSearch').on('click', function (e) {
        var formDataSave = new FormData();
        formDataSave.append('type', 'getDataShipper');
        var json = { 'ID': 0 };
        formDataSave.append('data', JSON.stringify(json)); 
        formDataSave.append('Shipe_ID', "");
        formDataSave.append('NAME', $('#txt_name').val());
        $.ajax({
            url: "Configuation/HandlerShipper.ashx",
            type: "POST",
            data: formDataSave,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.id = objectData.SHIPER_ID;
                        if (objectData.NUMBER) {
                            obj.shipNo = objectData.NUMBER
                        } else {
                            if (obj.id < 10) {
                                obj.shipNo = "S00" + obj.id;
                            } else {
                                obj.shipNo = "S0" + obj.id;
                            }
                        }
                        // obj.shipNo = objectData.NUMBER || "";
                        obj.shipName = objectData.NAME || "";
                        obj.adress = objectData.DiaChi || "";
                        //obj.date = objectData.NgayTao || "";
                        obj.desc = objectData.DESCRIPTION || "";

                        obj.phone = objectData.SoDienThoai || "";
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
    $('#btAdd').on('click', function (e) {
        window.location = '/S007_ManagerShiper.aspx?id=' + "Add";
    });
    // load table
    var getDataTable = function (itemData) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'shipNo',
                title: 'Ship Number',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'shipName',
                title: 'Ship Name',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'adress',
                title: 'Địa chỉ',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'phone',
                title: 'SĐT',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'date',
                title: 'Ngày tạo',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'desc',
                title: 'Mô tả',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'operate1',
                title: 'Sửa',
                align: 'center',
                valign: 'middle',
                events: operateEventsEdit,
                formatter: operateFormatterEdit
            }, {
                field: 'operate2',
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
    // opera1
    function operateFormatterEdit(value, row, index) {
        return [
            '<a class="edit" href="javascript:void(0)" title="Sửa">',
            'Sửa',
            '</a>  '
        ].join('');
    }

    window.operateEventsEdit = {
        'click .edit': function (e, value, row, index) {
            window.location = '/S007_ManagerShiper.aspx?id=' + row.id;
            
        }
    };
    // 2
    function operateFormatter(value, row, index) {
        return [
            '<a class="remove" href="javascript:void(0)" title="Xoá">',
            'Xóa',
            '</a>',
        ].join('');
    }

    window.operateEvents = {
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

</script>
    </asp:Content>




