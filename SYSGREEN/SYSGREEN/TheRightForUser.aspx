<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"  CodeBehind="TheRightForUser.aspx.cs" Inherits="SYSGREEN.TheRightForUser" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
<div style ="margin-left:30px;margin-right:30px">
<table id="table" 
        data-search="true" 
        data-show-refresh="true" 
></table>
</div>
    <div style ="height:40px"></div>
    <div style ="text-align:center;display: table;margin: 0 auto;">
        <input type="submit" class="btn btn-info" value="Phân quyền">
    </div>
<script>
    // Bootstrap Table
    $(function () {

        $('#table').bootstrapTable({
            columns: [{
                field: 'stt',
                title: 'Stt',
                align: 'center',
                valign: 'middle',
               // sortable: true,
                //editable: true,
            }, {
                field: '_function',
                title: 'Function',
                align: 'center',
                valign: 'middle',
                //sortable: true,
                // editable: true,

            }, {
                field: '_view',
                title: 'View ',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value) {
                        return '<input type="checkbox" value="" checked></label>';
                    } else {
                        return '<input type="checkbox" value=""></label>';
                    }
                }
            }, {
                field: '_add',
                title: 'add',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value) {
                        return '<input type="checkbox" value="" checked></label>';
                    } else {
                        return '<input type="checkbox" value=""></label>';
                    }
                }
            }, {
                field: '_edit',
                title: 'Edit',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value) {
                        return '<input type="checkbox" value="" checked></label>';
                    } else {
                        return '<input type="checkbox" value=""></label>';
                    }
                }
            }, {
                field: '_delete',
                title: 'Delete',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if(value){
                        return '<input type="checkbox" value="" checked></label>';
                    } else {
                        return '<input type="checkbox" value=""></label>';
                    }
                    
                }
            }],



            data: [{
                stt: '1',
                _function: 'funtion 1',
                _view: true,
                _add: false,
                _edit: true,
                _delete: false
            }]
        });

    });
</script>
    </asp:Content>


