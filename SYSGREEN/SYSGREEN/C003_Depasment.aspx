<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="C003_Depasment.aspx.cs" Inherits="SYSGREEN.C003_Depasment" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <script>
        $(function () {
            $('#table').bootstrapTable({
                columns: [{
                    field: 'id',
                    title: 'ID',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    //editable: true,
                }, {
                    field: 'department',
                    title: 'Bộ phận',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    //editable: true,

                }, {
                    field: 'dateCreate',
                    title: 'Ngày tạo',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    //editable: true,
                }, {
                    field: 'user',
                    title: 'User',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    
                    //footerFormatter: userFormatter
                }, {
                    field: 'operate',
                    title: 'Thao tác',
                    align: 'center',
                    valign: 'middle',
                    events: operateEvents,
                    formatter: operateFormatter
                }],



                data: [{
                    id: 1,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 2,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 3,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 4,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 5,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 6,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 7,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 8,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 9,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 10,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 11,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 12,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 13,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 14,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }]
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
                $('#table').bootstrapTable('remove', {
                    field: 'id',
                    values: [row.id]
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

