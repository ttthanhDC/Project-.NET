﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KD003_DiscountInvoice.aspx.cs" Inherits="SYSGREEN.KD003_DiscountInvoice" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px" id ="div_LoTrinh">
         <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ngayMua"placeholder="Ngày mua" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ngayKetThuc"placeholder="Ngày kết thúc" />
                </div>
               <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_promoCode"placeholder="Promo code" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_promoProduct"placeholder="Promo product" />
                </div>
                 <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearh">Tìm kiếm</button>
                </div>
                 <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btIn">In</button>
                </div>
            </div> 
    </div>
</div>
    <div style ="margin-left:20px;margin-right:20px" id ="div_Table1">
        <table id="table1"></table>
    </div>
   
<script>
    // Bootstrap Table
    $(function () {
        var itemData = [];
        getDataTable1(itemData);
        eventSearch1();
    });

    $('#btTKLoTrinh').on('click', function (e) {
        eventSearch();
    });
    var eventSearch1 = function () {
        var data = [{
            stt: '1',
            ma: 'PX-20082018',
            name: 'Trần ngọc duy',
            date: '20/08/2018',
            loaiKhach: 'Khách gói',
            sdt: '0989485398 ',
            email: 'duytn@123',
            quan: 'Ba đình ',
            tongTieu: '300,000,000 ',
            ghiChu: 'duytn ',
        }, {
            stt: '2',
            ma: 'PX-20082018',
            name: 'Trần ngọc duy',
            date: '20/08/2018',
            loaiKhach: 'Khách gói',
            sdt: '0989485398 ',
            email: 'duytn@123',
            quan: 'Thanh xuân',
            tongTieu: '200,000,000 ',
            ghiChu: 'duytn ',
        }]
        data = data;
        var $table1 = $('#table1');
        $table1.bootstrapTable('load', data);
    };

    $('#btIn').on('click', function (e) {
        alert('IN');
    });


    // getdata table lộ trình
    var getDataTable1 = function (itemData) {
        $('#table1').bootstrapTable({
            columns: [
                {
                    field: 'stt',
                    title: 'STT',
                    align: 'center',
                    valign: 'middle',

                }, {
                    field: 'ma',
                    title: 'Mã khách',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    events: operateEvents,
                    formatter: operateFormatter
                }, {
                    field: 'name',
                    title: 'Họ tên khách',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                }, {
                    field: 'loaiKhach',
                    title: 'Loại khách',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                }, {
                    field: 'sdt',
                    title: 'SĐT',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                }, {
                    field: 'email',
                    title: 'Email',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                }, {
                    field: 'quan',
                    title: 'Quận',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                }, {
                    field: 'tongTieu',
                    title: 'Tổng tiêu',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                }, {
                    field: 'ghiChu',
                    title: 'Ghi chú',
                    align: 'center',
                    valign: 'middle',
                }],

            data: itemData
        });
    };
    function operateFormatter(value, row, index) {
        return [
            '<a class="view" href="javascript:void(0)" title="link">',
            value,
            '</a>  '
        ].join('');
    }

    window.operateEvents = {
        'click .view': function (e, value, row, index) {
            window.location = '/KD002_HistoryBuy.aspx?paramId= 0';
        }
    };
</script>
    </asp:Content>







