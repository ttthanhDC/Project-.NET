<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeFile="C008_Product.aspx.cs" Inherits="SYSGREEN.C008_Product" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
<div style ="margin-left:30px;margin-right:30px">
    <table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-page-list="[10, 25, 50, 100, ALL]" 
></table>
</div>

    <div style ="height:40px"></div>
    <div style ="text-align:center;display: table;margin: 0 auto;">
         <button type="button" class="btn btn-primary" id="btnAdd">Thêm</button>
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
            url: "Configuation/HandlerSysProduct.ashx",
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
                        obj.branch = objectData.ORG_ID;
                        obj.orgName = objectData.OrgName;
                        obj.codeProduct = objectData.Product_Code;
                        obj.nameProduct = objectData.Product_Name;
                        obj.unitProduct = objectData.Product_Unit;
                        obj.priceProduct = objectData.Product_Amount;
                        arr.push(obj);
                    }
                }
                data = arr;

                $('#table').bootstrapTable({
                    columns: [{
                        field: 'orgName',
                        title: 'Cơ sở',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'codeProduct',
                        title: 'Code',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'nameProduct',
                        title: 'Tên ',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'unitProduct',
                        title: 'Thể tích',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'priceProduct',
                        title: 'Giá',
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
    });
    $('#btnAdd').on('click', function (e) {
        window.location = '/C008_Detail.aspx?';
    });
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
            window.location = '/C008_Detail.aspx?paramId=' + row.id;
            //alert('You click like action, row: ' + JSON.stringify(row));
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
                url: "Configuation/HandlerSysProduct.ashx",
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
                    alert('Xóa thất bại');
                }
            });
        }
    };
</script>
    </asp:Content>

