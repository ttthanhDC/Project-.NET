﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="C002_Right.aspx.cs" Inherits="SYSGREEN.C002_Right" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
     <div class="main-content-inner" style ="margin-right:20px;margin-left:20px">
          <div class="form-horizontal">
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btAdd">Thêm mới</button>
                </div>
            </div> 
        <div class="form-horizontal" id ="Div_add" style="display:none">
             <label for="sel1" class="col-md-2">Group Name</label>
            <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_GroupName" />
                </div>
             <label for="sel1" class="col-md-1">Mô tả</label>
            <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_des" style="width:400px"/>
            </div>
             <label for="sel1" class="col-md-1"></label>
             <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSave">Lưu</button>
                </div>
        </div> 
        
    </div>
    <div style="height:30px"></div>
    <div style ="margin-right:20px;margin-left:20px;margin-top:20px">
    <table id="table"></table>
   </div>
<script>
    // Bootstrap Table
    $(function () {
        var data = [];
        loadDataTable()
        getAllData();
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
                field: 'name',
                title: 'Group name',
                align: 'center',
                valign: 'middle',
                // sortable: true,
                // editable: true,

            }, {
                field: 'dateCreate',
                title: 'Ngày tạo',
                align: 'center',
                valign: 'middle',
                //sortable: true,
                //  editable: true,
            }, {
                field: 'Des',
                title: 'Mô tả',
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
            data : data
        });
    };
    // function
    $('#btAdd').on('click', function (e) {
        if ($('#Div_add')[0].style.display === "none") {
            $('#Div_add')[0].style.display = "block";
        } else {
            $('#Div_add')[0].style.display = "none";
        }
       
    });
    $('#btSave').on('click', function (e) {
        if($('#txt_GroupName').val()=== ""){
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

