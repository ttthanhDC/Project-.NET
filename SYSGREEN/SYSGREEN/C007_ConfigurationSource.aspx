<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="C007_ConfigurationSource.aspx.cs" Inherits="SYSGREEN.C007_ConfigurationSource" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div style="margin-right:30px;margin-left:30px">
        <table id="table" 
        data-search="true" 
        ></table>
    </div>

     
    <script>
        $(function () {
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
                            obj.stt = i+1;
                            obj.id = objectData.ID;
                            obj.department = objectData.RoleName;
                            obj.dateCreate = objectData.Create_Date;
                            obj.user = objectData.Create_User;
                            arr.push(obj);
                        }
                    }
                    data = arr;

                    $('#table').bootstrapTable({
                        columns: [{
                            field: 'stt',
                            title: 'STT',
                            align: 'center',
                            valign: 'middle',
                            // sortable: true,
                            // editable: true,
                        }, {
                            field: 'nguon',
                            title: 'Tên nguồn',
                            align: 'center',
                            valign: 'middle',
                            // sortable: true,
                            // editable: true,

                        }, {
                            field: 'dateCreate',
                            title: 'Ngày tạo',
                            align: 'center',
                            valign: 'middle',
                            // sortable: true,
                            //editable: true,
                        }, {
                            field: 'user',
                            title: 'User',
                            align: 'center',
                            valign: 'middle',
                            // sortable: true,
                   
                            //  footerFormatter: userFormatter
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
            'click .right': function (e, value, row, index) {
                alert('You click like action, row: ' + JSON.stringify(row));
            },
            'click .edit': function (e, value, row, index) {
                alert('You click like action, row: ' + JSON.stringify(row));
            },
            'click .remove': function (e, value, row, index) {
                $('#table').bootstrapTable('remove', {
                    field: 'id',
                    values: [row.id]
                });
            }
        };

    </script>
   
    </asp:Content>

