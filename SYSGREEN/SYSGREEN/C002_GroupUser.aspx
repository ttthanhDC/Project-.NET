<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="C002_GroupUser.aspx.cs" Inherits="SYSGREEN.C002_GroupUser" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-right:20px;margin-left:20px">
          <div class="form-horizontal">
              <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btBack">Quay lại</button>
                </div>
              <label for="sel1" class="col-md-2"></label>
               <div class="col-md-2">
                    <div class="form-group">
                          <select class="form-control" id="cbUser">
                          </select>
                        </div>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btAdd">Thêm Use</button>
                </div>
            </div> 
    </div>
    <div style ="margin-right:20px;margin-left:20px">
    <table id="table"></table>
   </div>
<script>
    // Bootstrap Table
    $(function () {
        var data = [];
        loadDataTable()
       
        window.id = 0;
        window.id = getQueryVariable("id");
        //alert("Data" + window.idParam);
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
        //
        var formDataShip = new FormData();
        formDataShip.append('type', 'getData');
        var json = { 'ID': 0 };
        formDataShip.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerSysUser.ashx",
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
                        obj.name = objectData.UserName;
                        obj.link = objectData.ID;
                        obj.sub = null;
                        arr.push(obj);
                    }
                }
                var data = { menu: arr };
                var $menu = $("#cbUser");
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
        //
        getAllData();
    });
    var getAllData = function () {
        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'getUserInGroup');
        formDataListUser.append('roleId', window.id);
        $.ajax({
            url: "Configuation/HandlerPermissionServices.ashx",
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
                        obj.userID = objectData.USER_ID;
                        obj.id = objectData.ID;
                        obj.user = objectData.UserName;
                        
                        obj.email = objectData.Email;
                        obj.coSo = objectData.OrgName;
                        obj.phongBan = objectData.DeptName;
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
                        obj.dateCreate =z;
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
                field: 'user',
                title: 'User name',
                align: 'center',
                valign: 'middle',
                // sortable: true,
                // editable: true,
            }, {
                field: 'email',
                title: 'Email',
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
                field: 'coSo',
                title: 'Cơ sở',
                align: 'center',
                valign: 'middle',
                //sortable: true,
            }, {
                field: 'phongBan',
                title: 'Phòng ban',
                align: 'center',
                valign: 'middle',
                //sortable: true,
            }, {
                field: 'operate',
                title: 'Xóa',
                align: 'center',
                valign: 'middle',
                events: operateEvents,
                formatter: operateFormatter
            }],
            data: data
        });
    };
    // function
    $('#btBack').on('click', function (e) {
        window.location = '/C002_Right.aspx?paramId= 0';
    });
    $('#btAdd').on('click', function (e) {
        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'addUserToGroupReturnId');
        formDataListUser.append('roleId',window.id); 
        formDataListUser.append('UserId', $('#cbUser').val());
        $.ajax({
            url: "Configuation/HandlerPermissionServices.ashx",
            type: "POST",
            data: formDataListUser,
            contentType: false,
            processData: false,
            success: function (result) {
                getAllData();

            },
            error: function (err) {

            }
        });
    });
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
        'click .remove': function (e, value, row, index) {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'removeUserInGroup');
            formDataListUser.append('roleId', window.id);
            formDataListUser.append('UserId', row.userID);
            $.ajax({
                url: "Configuation/HandlerPermissionServices.ashx",
                type: "POST",
                data: formDataListUser,
                contentType: false,
                processData: false,
                success: function (result) {
                    getAllData();

                },
                error: function (err) {

                }
            });
        }
    };
</script>
    </asp:Content>

