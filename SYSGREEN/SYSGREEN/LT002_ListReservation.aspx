<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="LT002_ListReservation.aspx.cs" Inherits="SYSGREEN.LT002_ListReservation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
<table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-page-list="[10, 25, 50, 100, ALL]" 
        data-show-footer="false" 
></table>
    <div style ="height:40px"></div>
    <div style ="text-align:center;display: table;margin: 0 auto;">
        <input type="submit" class="btn btn-info" value="Thêm">
    </div>
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
                branch: 'HO',
                codeProduct: 'P001',
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


