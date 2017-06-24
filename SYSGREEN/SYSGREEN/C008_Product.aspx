<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Menu.Master" CodeBehind="C008_Product.aspx.cs" Inherits="SYSGREEN.C008_Product" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
<table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-show-toggle="true" data-show-columns="true" 
        data-show-pagination-switch="true"
        data-page-list="[10, 25, 50, 100, ALL]" 
        data-show-footer="false" 
></table>

<script>
    // Bootstrap Table
    $(function () {

        $('#table').bootstrapTable({
            columns: [{
                field: 'branch',
                title: 'Cơ sở',
                align: 'center',
                valign: 'middle',
                sortable: true,
                editable: true,
            }, {
                field: 'codeProduct',
                title: 'Code',
                align: 'center',
                valign: 'middle',
                sortable: true,
                editable: true,

            }, {
                field: 'nameProduct',
                title: 'Tên ',
                align: 'center',
                valign: 'middle',
                sortable: true,
                editable: true,
            }, {
                field: 'unitProduct',
                title: 'Đơn vị',
                align: 'center',
                valign: 'middle',
                sortable: true,
                editable: true
            }, {
                field: 'priceProduct',
                title: 'Giá',
                align: 'center',
                valign: 'middle',
                sortable: true,
                editable: true
            }],



            data: [{
                branchd: 'HO',
                codeProduct: 'P001',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P002',
                nameProduct: 'Sữa hạt điều cốt đậu đen',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P003',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P004',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P005',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P006',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P007',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P008',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P009',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P010',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P011',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P012',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P013',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branchd: 'HO',
                codeProduct: 'P014',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }]
        });

    });
</script>
    </asp:Content>

