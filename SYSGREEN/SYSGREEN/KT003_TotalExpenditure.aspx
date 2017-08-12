<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KT003_TotalExpenditure.aspx.cs" Inherits="SYSGREEN.KT003_TotalExpenditure" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">

    <div style ="margin-left:20px;margin-right:20px">
        <button type="button" class="btn btn-primary" id="btAdd">Thêm mới</button>
        <table id="table"></table>
    </div>
   
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
                        obj.permission = objectData.RoleName;
                        obj.money = objectData.Create_Date;
                        obj.accountFor = objectData.Create_User;
                        obj.note = objectData.Create_User;
                        arr.push(obj);
                    }
                }
                data = arr;
                getDataTable(data);
            },
            error: function (err) {

            }
        });
    });
    var getDataTable = function (itemData) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'date',
                title: 'Ngày',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'spentFor',
                title: 'Nọi dung chi',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'money',
                title: 'Số tiền',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'accountFor',
                title: 'Tài khoản chi',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'note',
                title: 'Ghi chúc',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'operater',
                title: 'Ghi chúc',
                align: 'center',
                valign: 'middle',
                events: operateEvents,
                formatter: operateFormatter
            }],
        });
    };
    $('#btAdd').on('click', function (e) {
        window.location = '/KT003_Detail.aspx?id=' + "Add";
    });
    // function
    function operateFormatter(value, row, index) {
        return [
            '<a class="edit" href="javascript:void(0)" title="Sửa">',
            'Sửa',
            '</a>  '
        ].join('');
    }

    window.operateEvents = {
        'click .edit': function (e, value, row, index) {
            window.location = '/KT003_Detail.aspx?id=' + row.id;

        }
    };
</script>
    </asp:Content>


