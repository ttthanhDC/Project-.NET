<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="LT002_Demo3.aspx.cs" Inherits="SYSGREEN.LT002_Demo3" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   
<div style ="height:40px"></div>
<div style="margin-left : 30px; margin-right : 30px">
    <table id="table" 
    ></table>
</div>

    
<script>
    // Bootstrap Table
    $(function () {

        loadContent();
        function loadContent() {
            loadDataHoaDon();
        };
        function loadDataHoaDon() {
            var formSource = new FormData();
            var json = { 'type': 0 };
            var makh = "";
            var mahd = "HD13";
            var tensp = "";
            formSource.append('type', 'getData');
            formSource.append('data', JSON.stringify(json));
            formSource.append('MaHD', mahd);
            formSource.append('TenKH', makh);
            formSource.append('TenSP', tensp);
            $.ajax({
                url: "Configuation/HandlerInsertBill.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    // table
                    $('#table').bootstrapTable({
                        columns: [{
                            field: 'stt',
                            title: 'STT',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'product',
                            title: 'Sản phẩm',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'soLuong',
                            title: 'Số lượng',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'Price',
                            title: 'Giá sản phẩm',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'sugar',
                            title: 'Sugar',
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
                            field: 'money',
                            title: 'Thành tiền',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'promotion',
                            title: 'Promotion code',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'total',
                            title: 'Total',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'note',
                            title: 'Ghi chú',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'operate',
                            title: 'Thao tác',
                            align: 'center',
                            valign: 'middle',
                            events: operateEvents,
                            formatter: operateFormatter
                        }],
                        data: [{
                            stt: '1',
                            product: 'SP001',
                            soLuong: '1',
                            Price: '35,000',
                            sugar: true,
                            money: '35,000',
                            promotion: 'KS001',
                            total: '32,500',
                            note: 'Sản phẩm 1'
                        }, {
                            stt: '2',
                            product: 'SP002',
                            soLuong: '1',
                            Price: '55,000',
                            sugar: false,
                            money: '55,000',
                            promotion: 'KS002',
                            total: '32,500',
                            note: 'Sản phẩm 1'
                        }, {
                            stt: '3',
                            product: 'SP001',
                            soLuong: '1',
                            Price: '35,000',
                            sugar: true,
                            money: '35,000',
                            promotion: 'KS003',
                            total: '32,500',
                            note: 'Sản phẩm 1'
                        }],
                    });
                },
                error: function (err) {

                }
            });
        };


    });

    function operateFormatter(value, row, index) {
        return [
        '<a class="linkIn" href="javascript:void(0)" title="xóa">',
        'Xóa'
        ].join('');
    }

    window.operateEvents = {
        'click .linkIn': function (e, value, row, index) {
            // window.location = '/UserManger.aspx?paramId=' + row.id;
            alert('Action Delete');
        }
    };
    

</script>
    </asp:Content>




