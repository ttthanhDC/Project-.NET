<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S006_ListShiper.aspx.cs" Inherits="SYSGREEN.S006_ListShiper" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner">
          <div class="form-horizontal">
            <div class="form-group">
                 <label for="sel1" class="col-md-8"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_name" placeholder="Ship name"/>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
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
                        obj.shipNo = objectData.NUMBER || "";
                        obj.shipName = objectData.NAME || "";
                        obj.adress = objectData.DiaChi || "";
                        obj.date = objectData.NgayTao || "";
                        obj.desc = objectData.DESCRIPTION || "";
                        obj.id = objectData.SHIPER_ID;
                        obj.phone = objectData.SoDienThoai || "";
                        arr.push(obj);
                    }
                }
                data = arr;
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
                        field: 'operate',
                        title: 'Thêm mới',
                        align: 'center',
                        valign: 'middle',
                        events: operateEventsAdd,
                        formatter: operateFormatterAdd
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

                    data: data
                });
            },
            error: function (err) {
            }
        });
    });
    // 
    $('#btSearch').on('click', function (e) {
        alert("search");
    });

    // function
    function userFormatter(data) {
        return data.length;
    }
    function operateFormatterAdd(value, row, index) {
        return [
            '<a class="add" href="javascript:void(0)" title="Thêm mới">',
            'Thêm mới',
            '</a>  '
        ].join('');
    }

    window.operateEventsAdd = {
        'click .add': function (e, value, row, index) {
            window.location = '/S007_ManagerShiper.aspx?id=' + "Add";
        }
    };
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
            window.location = '/S007_ManagerShiper.aspx?id=' + row.id + '&shipNo=' + row.shipNo + '&shipName=' + row.shipName + '&adress=' + row.adress + '&date=' + row.date + '&desc=' + row.desc + '&phone=' + row.phone;
            
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




