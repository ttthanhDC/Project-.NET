<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="C003_Depasment.aspx.cs" Inherits="SYSGREEN.C003_Depasment" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <script>
        $(function () {
            var data = [];
            var formDataDeparment = new FormData();
            formDataDeparment.append('type', 'getData');
            var json = { 'ID': 0 };
            formDataDeparment.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerDeptObject.ashx",
                type: "POST",
                data: formDataDeparment,
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
                            obj.department = objectData.Dept_Name;
                            obj.dateCreate = objectData.Create_Date;
                            obj.user = objectData.Create_User;
                            arr.push(obj);
                        }
                    }
                    data = arr;

                    // format table
                    $('#table').bootstrapTable({
                        columns: [{
                            field: 'id',
                            title: 'ID',
                            align: 'center',
                            valign: 'middle',
                            //sortable: true,
                            //editable: true,
                        }, {
                            field: 'department',
                            title: 'Bộ phận',
                            align: 'center',
                            valign: 'middle',
                            //sortable: true,
                            //editable: true,

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
                    
                            //footerFormatter: userFormatter
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
            'click .edit': function (e, value, row, index) {
                alert('You click like action, row: ' + JSON.stringify(row));
            },
            'click .remove': function (e, value, row, index) {
                var formData = new FormData();
                var id = parseInt(row.id + "");
                //formData.append('data', "{Dept_Name:'abc',Dept_Description:'mieuta','Create_User':'thanhdc7'}");
                var json = { 'ID': id };
                jQuery.ajaxSetup({ async: true });
                formData.append('type', 'delete');
                formData.append('data', JSON.stringify(json));
                $.ajax({
                    url: "Configuation/HandlerDeptObject.ashx",
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

    </script>
    <table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-show-toggle="true" data-show-columns="true" 
        data-show-pagination-switch="true"
        data-page-list="[10, 25, 50, 100, ALL]" 
        data-show-footer="false" 
        ></table>
    </asp:Content>

