﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"  CodeBehind="TheRightForUser.aspx.cs" Inherits="SYSGREEN.TheRightForUser" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
<div style ="margin-left:30px;margin-right:30px">
<div class="form-horizontal">
              <div class="col-md-1">
                    
              </div>
              <label for="sel1" class="col-md-2"></label>
               <div class="col-md-2">
                    <div class="form-group">
                          <select class="form-control" id="cbRole">
                          </select>
                        </div>
                </div>
                <div class="col-md-1">
                   
                </div>
</div> 
<table id="table" 
        data-search="true" 
        data-show-refresh="true" 
></table>
</div>
    <div style ="height:40px"></div>
    <div style ="text-align:center;display: table;margin: 0 auto;">
         <button type="button" class="btn btn-primary" id="btAdd">Phân quyền </button>
    </div>
<script>
    // Bootstrap Table
    $(function () {

        loadContent();
        function loadContent() {
            initTable();
            LoadComboBoxRole();
        };
        function initTable() {
            $('#table').bootstrapTable({
                columns: [{
                    field: 'stt',
                    title: 'STT',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'Func_Name',
                    title: 'Tên màn hình',
                    align: 'left',
                    valign: 'middle',

                }, {
                    field: 'IsCreate',
                    title: 'Thêm mới',
                    align: 'center',
                    valign: 'middle',
                    checkbox: true,
                }, {
                    field: 'IsEdit',
                    title: 'Sửa',
                    align: 'center',
                    valign: 'middle',
                    checkbox: true,
                }, {
                    field: 'IsDelete',
                    title: 'Xóa',
                    align: 'center',
                    valign: 'middle',
                    checkbox: true,
                },
                 {
                     field: 'IsView',
                     title: 'Xem',
                     align: 'center',
                     valign: 'middle',
                     checkbox: true,
                 }]
               
            });
            $('#table input[type=checkbox]')[0].style.display = 'none';
            $('#table input[type=checkbox]')[0].parentElement.innerText = "Thêm";
            $('#table input[type=checkbox]')[0].style.display = 'none';
            $('#table input[type=checkbox]')[0].parentElement.innerText = "Sửa";
            $('#table input[type=checkbox]')[0].style.display = 'none';
            $('#table input[type=checkbox]')[0].parentElement.innerText = "Xóa";
            $('#table input[type=checkbox]')[0].style.display = 'none';
            $('#table input[type=checkbox]')[0].parentElement.innerText = "Xem";
        }
        function loadDataTable(roleID) {
            var formSource = new FormData();
            var json = { 'ID': 0 };
            formSource.append('type', 'getAllFunction');
            formSource.append('data', JSON.stringify(json));
            formSource.append('roleID', roleID);
            $.ajax({
                url: "Configuation/HandlerPermissionServices.ashx",
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
                                'ID': 0, 'FUNC_ID': 0, 'ROLE_ID': roleID, 'IsCreate': 0,
                                'IsEdit': 0, 'IsDelete': 0, 'IsView': 0, 'Func_Name': ''
                            };
                            if (jsonData[i].ROLE_ID) {
                                obj = jsonData[i];
                            } else {
                                obj.FUNC_ID = jsonData[i].FUNC_ID;
                                obj.Func_Name = jsonData[i].Func_Description;
                            }
                            obj.stt = i + 1;
                            arr.push(obj);
                        }
                    }
                    $('#table').bootstrapTable('load', arr);
                },
                error: function (err) {

                }
            });
        }
        function LoadComboBoxRole() {
            var formSource = new FormData();
            var json = { 'ID': 0 };
            formSource.append('type', 'getAllRole');
            formSource.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerPermissionServices.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    if (jsonData && jsonData.length > 0) {
                        for (var i = 0; i < jsonData.length ; i++) {
                            var objectData = jsonData[i];
                            var obj = {};
                            obj.name = objectData.RoleName;
                            obj.link = objectData.ID;
                            obj.sub = null;
                            arr.push(obj);
                        }
                    }
                    var data1 = { menu: arr };
                    var $menu = $("#cbRole");
                    $.each(data1.menu, function () {
                        $menu.append(getSource(this));
                    });
                    loadDataTable(jsonData[0].ID);
                },
                error: function (err) {

                }
            });
        };
        function getSource(itemData) {
            var item = $("<option value='" + itemData.link + "'>")
                .append(itemData.name);
            return item;
        };

        $('#cbRole').on('change', function () {
            loadDataTable(this.value);
        });
        
        $('#btAdd').on('click', function () {
            var lst = $('#table input[type=checkbox]');
            var data = $("#table").bootstrapTable('getData');
            for (var i = 0; i < data.length ; i++) {
                var indexCheck = i * 4;
                data[i].IsCreate = lst[indexCheck].checked ? 1 : 0;
                data[i].IsEdit = lst[indexCheck + 1].checked ? 1 : 0;
                data[i].IsDelete = lst[indexCheck + 2].checked ? 1 : 0;
                data[i].IsView = lst[indexCheck + 3].checked ? 1 : 0;
            }
            var formSource = new FormData();
            var json = { 'ID': 0 };
            formSource.append('type', 'addFuntionToGroupReturnId');
            formSource.append('data', JSON.stringify(data));
            $.ajax({
                url: "Configuation/HandlerPermissionServices.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    alert("Lưu thông tin thành công !");
                },
                error: function (err) {

                }
            });
        });
    });
</script>
    </asp:Content>


