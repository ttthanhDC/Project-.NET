<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheRightForUser.aspx.cs" Inherits="SYSGREEN.TheRightForUser" %>

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeFile="C008_Product.aspx.cs" Inherits="SYSGREEN.C008_Product" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
<table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-show-toggle="true" data-show-columns="true" 
        data-show-pagination-switch="true"
        data-page-list="[10, 25, 50, 100, ALL]" 
        data-show-footer="false" 
></table>
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
                field: 'view',
                title: 'View ',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<input type="checkbox" value=""></label>';
                }
            }, {
                field: 'add',
                title: 'add',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<input type="checkbox" value=""></label>';
                }
            }, {
                field: 'edit',
                title: 'Edit',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<input type="checkbox" value=""></label>';
                }
            }, {
                field: 'delete',
                title: 'Delete',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<input type="checkbox" value=""></label>';
                }
            }],



            data: [{
                stt: 'HO',
                _function: 'P001',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P002',
                nameProduct: 'Sữa hạt điều cốt đậu đen',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P003',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P004',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P005',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P006',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P007',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P008',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P009',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P010',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P011',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P012',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P013',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P014',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }]
        });

    });
</script>
    </asp:Content>


