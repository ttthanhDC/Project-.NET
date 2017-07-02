<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="C002_Right.aspx.cs" Inherits="SYSGREEN.C002_Right" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
<!-- The form which is used to populate the item data -->
<div id="userForm"  class="form-horizontal" style="display: none;">
    <div class="form-group">
        <label class="col-xs-3 control-label">ID</label>
        <div class="col-xs-3">
            <input type="text" class="form-control" name="id" disabled="disabled" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-xs-3 control-label">Full name</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="name" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-xs-3 control-label">Email</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="email" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-xs-3 control-label">Website</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="website" />
        </div>
    </div>

    <div class="form-group">
        <div class="col-xs-5 col-xs-offset-3">
            <button type="submit" class="btn btn-default">Save</button>
        </div>
    </div>
</div>

    <table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-show-toggle="true" data-show-columns="true" 
        data-show-pagination-switch="true"
        data-page-list="[10, 25, 50, 100, ALL]" 
        data-show-footer="false" 
        ></table>
    <div class="modal fade" id="modalTable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 1200px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Modal table</h4>
                    </div>
                    <div class="modal-body">
                        <table id="tablePopup" 
                            data-id-field="undefined"
                            data-unique-id="undefined"
                            data-show-refresh="true">
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
   </div><!-- /.modal -->
<script>
    // Bootstrap Table
    $(function () {
        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'getData');
        var json = { 'ID': 0};
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
                        obj.department = objectData.RoleName;
                        obj.dateCreate = objectData.Create_Date;
                        obj.user = objectData.Create_User;
                        arr.push(obj);
                    }
                }
                data = arr;
                
                $('#table').bootstrapTable({
                    columns: [{
                        field: 'id',
                        title: 'ID',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        ///editable: true,
                    }, {
                        field: 'department',
                        title: 'Bộ phận',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        // editable: true,

                    }, {
                        field: 'dateCreate',
                        title: 'Ngày tạo',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        //  editable: true,
                    }, {
                        field: 'user',
                        title: 'User',
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
                   data : data
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
            var $table = $('#tablePopup');
            initTablePopup();
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
    function initTablePopup() {
        var $table = $('#tablePopup');
        $('#tablePopup').bootstrapTable({
            columns: [{
                field: 'stt',
                title: 'Stt',
                align: 'center',
                valign: 'middle',
                sortable: true,
                //editable: true,
            }, {
                field: '_function',
                title: 'Function',
                align: 'center',
                valign: 'middle',
                sortable: true,
                // editable: true,

            }, {
                field: '_view',
                title: 'View ',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<input type="checkbox" value=""></label>';
                }
            }, {
                field: '_add',
                title: 'add',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<input type="checkbox" value=""></label>';
                }
            }, {
                field: '_edit',
                title: 'Edit',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<input type="checkbox" value=""></label>';
                }
            }, {
                field: '_delete',
                title: 'Delete',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<input type="checkbox" value=""></label>';
                }
            }],
            data: [{
                stt: '1',
                _function: 'function 1',
                _view: true,
                _add: false,
                _edit: true,
                _delete: false
            }, {
                stt: '2',
                _function: 'function 2',
                _view: true,
                _add: false,
                _edit: true,
                _delete: false
            }]
        });
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

