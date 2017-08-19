<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="C001_ListUser.aspx.cs" Inherits="SYSGREEN.C001_ListUser" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div style ="margin-left:30px;margin-right:30px">
        <button type="button" class="btn btn-primary" id="btnAdd">Thêm</button>
        <table id="table"></table>
    </div>
     
 <script>
        $(function () {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getData');
            var json = { 'ID': 0};
            formDataListUser.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerSysUser.ashx",
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
                            obj.id = objectData.ID;
                            obj.email = objectData.Email;
                            obj.department = objectData.DeptId;
                            obj.local = objectData.OrgId;
                            var Date_Start = objectData.Create_Date;
                            var a = "";
                            if (Date_Start) {
                                var x = Date_Start.substr(0, 10);
                                var y = x.split("-");
                                var y1 = y[0];
                                var y2 = y[1];
                                var y3 = y[2];
                                a = y3 + "/" + y2 + "/" + y1;
                            }
                            obj.dateCreate = a;
                            obj.user = objectData.UserName;
                            arr.push(obj);
                        }
                    }
                    data = arr;
                    $('#table').bootstrapTable({
                        columns: [{
                            field: 'id',
                            title: 'Id',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'email',
                            title: 'Email',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'department',
                            title: 'Bộ phận',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'local',
                            title: 'Cơ sở',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'dateCreate',
                            title: 'Ngày tạo',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'user',
                            title: 'User',
                            align: 'center',
                            valign: 'middle',
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
                },
                error: function (err) {

                }
            });
           // format table
            
        });
        // function
        function userFormatter(data) {
            return data.length;
        }
        function operateFormatter(value, row, index) {
            return [
                '<a class="edit" href="javascript:void(0)" title="Sửa">',
                'Sửa',
                '</a>  ', '|',
                '<a class="remove" href="javascript:void(0)" title="Xoá">',
                'Xóa',
                '</a>',
            ].join('');
        }

        window.operateEvents = {
            'click .edit': function (e, value, row, index) {
                window.location = '/C001_Detail.aspx?paramId='+ row.id;
                //alert('You click like action, row: ' + JSON.stringify(row));
            },
            'click .remove': function (e, value, row, index) {
                var formData = new FormData();
                var id = parseInt(row.id + "");
                //formData.append('data', "{Dept_Name:'abc',Dept_Description:'mieuta','Create_User':'thanhdc7'}");
                var json = { 'ID': id};
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
        $('#btnAdd').on('click', function (e) {
            window.location = '/UserManger.aspx?';
        });


    </script>
    
    </asp:Content>
