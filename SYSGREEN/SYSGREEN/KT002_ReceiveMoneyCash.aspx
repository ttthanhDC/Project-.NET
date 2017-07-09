<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KT002_ReceiveMoneyCash.aspx.cs" Inherits="SYSGREEN.KT002_ReceiveMoneyCash" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">

    <table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-page-list="[10, 25, 50, 100, ALL]" 
        ></table>
   
<script>
    // Bootstrap Table
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
                        obj.id = objectData.ID;
                        obj.date = objectData.RoleName;
                        obj.status = objectData.Create_Date;
                        obj.dateCreate = objectData.Create_Date;
                        obj.note = objectData.Create_User;
                        arr.push(obj);
                    }
                }
                data = arr;

                $('#table').bootstrapTable({
                    columns: [{
                        field: 'date',
                        title: 'Ngày',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        ///editable: true,
                    }, {
                        field: 'money',
                        title: 'Số tiền',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        // editable: true,

                    }, {
                        field: 'status',
                        title: 'Trạng thái',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        //  editable: true,
                    }, {
                        field: 'note',
                        title: 'Ghi chú',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,

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
            '<a class="right" href="javascript:void(0)" title="Phân quyền">',
            'Phân quyền',
            '</a>', '|',
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
            window.location = '/TheRightForUser.aspx?paramId=' + row.id;
        },
        'click .edit': function (e, value, row, index) {
            // alert('You click like action, row: ' + JSON.stringify(row));
            window.location = '/UserManger.aspx?paramId=' + row.id;
        },
        'click .remove': function (e, value, row, index) {
            $('#table').bootstrapTable('remove', {
                field: 'id',
                values: [row.id]
            });
        }
    };

    function updateCell(caller) {
        var $table = $('#tablePopup');
    }
    window.typeBillEvents = {
        'click .product': function (e, value, row, index) {
            var $table = $('#tablePopup');
            initTablePopup();
        }
    };
</script>
    </asp:Content>


