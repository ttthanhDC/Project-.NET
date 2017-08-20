﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeFile="C010_ConfigMenu.aspx.cs" Inherits="SYSGREEN.C010_ConfigMenu" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <script src="Scripts/Validator/bootstrap-select.js"></script>

    <div class="main-content-inner" style ="margin-right:20px;margin-left:20px">
        <div class="form-horizontal">
            <button type="button" class="btn btn-primary" id="btnBack">Quay lại</button>
        </div>
        <div style ="margin-right:20px;margin-left:20px;margin-top:20px"></div>
        <div class="form-horizontal">
            
              <label for="sel1" class="col-md-2"> Sản phẩm</label>
               <div class="col-md-3">
                    <div class="form-group">
                          <select class="chosen-select form-control" data-placeholder="Lựa chọn sản phẩm..." id="cbSanPham">
                          </select> 
                    </div>
                </div>
              <label for="sel1" class="col-md-2"> Thứ</label>
               <div class="col-md-3">
                    <div class="form-group">
                          <input type="text" class="form-control" name="title" id="txt_thu" disabled ="disabled"/>
                        </div>
                </div>
                <div class="col-md-2">
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
        var strThu = ["Chủ nhật", "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy"];
        $("#txt_thu").val(strThu[parseInt(getQueryVariable("id"))]);
        window.Code = getQueryVariable("id");
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
        function initTable() {
            $('#table').bootstrapTable({
                columns: [{
                    field: 'stt',
                    title: 'STT',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    ///editable: true,
                }, {
                    field: 'ProductName',
                    title: 'Sản phẩm trong ngày',
                    align: 'center',
                    valign: 'middle',
                    // sortable: true,
                    // editable: true,

                },
                   {
                       field: 'operate',
                       title: 'Thao tác',
                       align: 'center',
                       valign: 'middle',
                       events: operateEvents,
                       formatter: operateFormatter
                   }],
                data: [
                ]
            });
        };
        loadSP();
        initTable();
        loadDataTable();
        // Load Data user
        function loadSP() {
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
                            obj.ProductName = objectData.Product_Name;
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
                    $('.chosen-select').chosen({ allow_single_deselect: true });
                },
                error: function (err) {

                }
            });
            // select box shiper  
            var getShip = function (itemData) {
                var item = $("<option value='" + itemData.link + "'>").append(itemData.name + "-" + itemData.ProductName);
                return item;
            };
        };
        


    });

    function loadDataTable() {
        var formSource = new FormData();
        var json = { 'ID': 0 };
        formSource.append('type', 'getData');
        formSource.append('data', JSON.stringify(json));
        formSource.append('Code', window.Code);
        $.ajax({
            url: "Configuation/HandlerSysMenu.ashx",
            type: "POST",
            data: formSource,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var obj = {
                            'stt': 0, 'ProductId': 0, 'Code': 0
                        };
                        obj.stt = i + 1;
                        obj.ProductId = jsonData[i].PRODUCT_ID,
                        obj.ProductName = jsonData[i].Product_Name,
                        obj.Code = jsonData[i].Code,
                        arr.push(obj);
                    }
                }
                $('#table').bootstrapTable('load', arr);
            },
            error: function (err) {

            }
        });
    }


    $('#btnBack').on('click', function (e) {
        window.location = '/C010Menu.aspx';
    });


    $('#btAdd').on('click', function (e) {
        if ($('#cbSanPham').val() === "") {
            alert("Vui lòng nhập Sản phẩm");
        } else {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'insert');
            var json = { 'ID': 0};
            formDataListUser.append('ProductId', $('#cbSanPham').val());
            formDataListUser.append('Code', window.Code);
            formDataListUser.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerSysMenu.ashx",
                type: "POST",
                data: formDataListUser,
                contentType: false,
                processData: false,
                success: function (result) {
                    if (result == "-1") {
                        alert("Sản phẩm đã tồn tại trong menu ngày !")
                    } else {
                        loadDataTable();
                    }
                    
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
            '<a class="remove" href="javascript:void(0)" title="Xoá">',
            '<i class="glyphicon glyphicon-remove"></i>',
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
            var json = { 'ID': 0 };
            formDataListUser.append('data', JSON.stringify(json));
            formDataListUser.append('ProductId', row.ProductId);
            formDataListUser.append('Code', row.Code);
            $.ajax({
                url: "Configuation/HandlerSysMenu.ashx",
                type: "POST",
                data: formDataListUser,
                contentType: false,
                processData: false,
                success: function (result) {
                    alert('Xóa thành công');
                    loadDataTable();
                },
                error: function (err) {

                }
            });
        }
    };

</script>
    </asp:Content>

