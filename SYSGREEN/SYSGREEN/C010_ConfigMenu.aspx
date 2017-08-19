<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeFile="C010_ConfigMenu.aspx.cs" Inherits="SYSGREEN.C010_ConfigMenu" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-right:20px;margin-left:20px">
          <div class="form-horizontal">
            
              <label for="sel1" class="col-md-1"> Sản phẩm</label>
               <div class="col-md-2">
                    <div class="form-group">
                          <select class="form-control" id="cbSanPham">
                          </select>
                        </div>
                </div>
              <label for="sel1" class="col-md-1"> Thứ</label>
               <div class="col-md-2">
                    <div class="form-group">
                          <select class="form-control" id="cbThu">
                              <option value ="0"></option>
                              <option value ="1"> Thứ hai</option>
                               <option value ="2"> Thứ ba</option>
                               <option value ="3"> Thứ tư</option>
                               <option value ="4"> Thứ năm</option>
                               <option value ="5"> Thứ sáu</option>
                               <option value ="6"> Thứ bẩy</option>
                               <option value ="7"> Chủ nhật</option>
                          </select>
                        </div>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btAdd">Thêm</button>
                </div>
            </div> 
    </div>
    <div style ="margin-right:20px;margin-left:20px;margin-top:20px">
    <table id="table"></table>
   </div>
<script>
    // Bootstrap Table
    $(function () {
        var data = [];
        loadDataTable()
        getAllData();

        // Load Data user
        var formDataShip = new FormData();
        formDataShip.append('type', 'getData');
        var json = { 'ID': 0 };
        formDataShip.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerSysProduct.ashx",
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
                        obj.name = objectData.Product_Code;
                        obj.link = objectData.ID;
                        obj.sub = null;
                        arr.push(obj);
                    }
                }
                var data = { menu: arr };
                var $menu = $("#cbSanPham");
                $.each(data.menu, function () {
                    $menu.append(
                        getShip(this)
                    );
                });
            },
            error: function (err) {

            }
        });
        // select box shiper  
        var getShip = function (itemData) {
            var item = $("<option value='" + itemData.link + "'>")
                .append(itemData.name);
            return item;
        };


    });
    $('#btAdd').on('click', function (e) {
        if ($('#cbThu').val() === "0") {
            alert("Vui lòng chọn thứ.");
        } else {
            alert("action save.");
        }
    });
    var getAllData = function () {
        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'getData');
        var json = { 'ID': 0 };
        formDataListUser.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerSysRole.ashx",
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
                        obj.stt = i + 1;
                        obj.id = objectData.ID;
                        obj.name = objectData.RoleName;
                        //obj.dateCreate = objectData.Create_Date;
                        var data_ngay = objectData.Create_Date;
                        var z = "";
                        if (data_ngay) {
                            var x = data_ngay.substr(0, 10);
                            var y = x.split("-");
                            var y1 = y[0];
                            var y2 = y[1];
                            var y3 = y[2];
                            z = y3 + "/" + y2 + "/" + y1;
                        }
                        obj.dateCreate = z;
                        obj.Des = objectData.Create_User;
                        arr.push(obj);
                    }
                }
                data = arr;
                var $tableSearch = $('#table');
                $tableSearch.bootstrapTable('load', data);
            },
            error: function (err) {

            }
        });
    };
    var loadDataTable = function (data) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'stt',
                title: 'STT',
                align: 'center',
                valign: 'middle',
                //sortable: true,
                ///editable: true,
            }, {
                field: 'thu',
                title: 'Thứ',
                align: 'center',
                valign: 'middle',
                // sortable: true,
                // editable: true,

            }, {
                field: 'mon',
                title: 'Món',
                align: 'center',
                valign: 'middle',
                //sortable: true,
            }, {
                field: 'operate',
                title: 'Thao tác',
                align: 'center',
                valign: 'middle',
                events: operateEvents,
                formatter: operateFormatter
            }],
            data: data
        });
    };
    // function

    $('#btSave').on('click', function (e) {
        if ($('#txt_GroupName').val() === "") {
            alert("Vui lòng nhập Group name");
        } else {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'insert');
            var json = { 'ID': 0, 'RoleName': $('#txt_GroupName').val(), 'Create_User': $('#txt_des').val() };

            formDataListUser.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerSysRole.ashx",
                type: "POST",
                data: formDataListUser,
                contentType: false,
                processData: false,
                success: function (result) {
                    getAllData();
                    $('#txt_GroupName').val("");
                    $('#txt_des').val("");
                },
                error: function (err) {

                }
            });
        }
    });
    function userFormatter(data) {
        return data.length;
    }
    function operateFormatter(value, row, index) {
        return [
            '<a class="right" href="javascript:void(0)" title="Phân quyền">',
            'Thêm user',
            '</a>', '|',
            '<a class="remove" href="javascript:void(0)" title="Xoá">',
            'Xóa',
            '</a>',

        ].join('');
    }

    window.operateEvents = {
        'click .right': function (e, value, row, index) {
            window.location = '/C002_GroupUser.aspx?id=' + row.id;
        },
        'click .remove': function (e, value, row, index) {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'delete');
            var json = { 'ID': row.id };

            formDataListUser.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerSysRole.ashx",
                type: "POST",
                data: formDataListUser,
                contentType: false,
                processData: false,
                success: function (result) {
                    alert('Xóa thành công');
                    getAllData();
                },
                error: function (err) {

                }
            });
        }
    };

</script>
    </asp:Content>

