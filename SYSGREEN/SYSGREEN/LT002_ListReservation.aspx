<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="LT002_ListReservation.aspx.cs" Inherits="SYSGREEN.LT002_ListReservation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
 <div style ="text-align:center">
    <div class="form-horizontal">
        <div class="form-group">
           <label for="sel1" class="col-md-1">Tìm kiếm</label>
            <div class="col-md-2">
                
            </div>
            <label for="sel1" class="col-md-1"></label>
            <div class="col-md-3">
                <input type="text" class="form-control" name="title" id="txtSearch" />
            </div>
            <label for="sel1" class="col-md-1"></label>
            <div class="col-md-2">
                 <button type="button" class="btn btn-primary" id="btnAdd">Tìm kiếm</button>
            </div>
        </div> 
    </div>  
 
</div>
<div style ="height:40px"></div>
<div style="margin-left : 30px; margin-right : 30px">
    <table id="table" 
        data-search="true" 
        data-show-refresh="true" 
    ></table>
</div>

    
<script>
    // Bootstrap Table
    $(function () {
        // onchage select box
        var formBill = new FormData();
        var bill = {'ID':0};
        formBill.append('type', 'getData');
        formBill.append('data', JSON.stringify(bill));
        $.ajax({
            url: "Configuation/HandlerInsertBill.ashx",
            type: "POST",
            data: formBill,
            contentType: false,
            processData: false,
            success: function (result) {
                $('#table').bootstrapTable({
                    columns: [{
                        field: 'stt',
                        title: 'STT',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'BillCode',
                        title: 'Mã hóa đơn',
                        align: 'center',
                        valign: 'middle',
                        style: 'font-weight: bold',
                        fontWeight: 'bold'

                    }, {
                        field: 'CustomerId',
                        title: 'Khách hàng',
                        align: 'center',
                        valign: 'middle',

                    }, {
                        field: 'SourceId',
                        title: 'Nguồn',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'DateTotal',
                        title: 'Số ngày còn lại',
                        align: 'center',
                        valign: 'middle',
                    },
                    {
                        field: 'TotalAmount',
                        title: 'Tổng tiền',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'TotalAmountCollected',
                        title: 'Tiền thu được',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'TotalAmountRemain',
                        title: 'Tiền còn lại',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'Status',
                        title: 'Trạng thái đơn',
                        align: 'center',
                        valign: 'middle'
                    }]
                });
                var jsonData = result;
                $('#table').bootstrapTable('load', jsonData);
            },
            error: function (err) {
                $('#table').bootstrapTable({
                    columns: [{
                        field: 'stt',
                        title: 'STT',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'BillCode',
                        title: 'Mã hóa đơn',
                        align: 'center',
                        valign: 'middle',
                        style: 'font-weight: bold',
                        fontWeight: 'bold'

                    }, {
                        field: 'CustomerId',
                        title: 'Khách hàng',
                        align: 'center',
                        valign: 'middle',

                    }, {
                        field: 'SourceId',
                        title: 'Nguồn',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'DateTotal',
                        title: 'Số ngày còn lại',
                        align: 'center',
                        valign: 'middle',
                    },
                    {
                        field: 'TotalAmount',
                        title: 'Tổng tiền',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'TotalAmountCollected',
                        title: 'Tiền thu được',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'TotalAmountRemain',
                        title: 'Tiền còn lại',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'Status',
                        title: 'Trạng thái đơn',
                        align: 'center',
                        valign: 'middle'
                    }]
                });
            }
        });
        
    });


</script>
    </asp:Content>


