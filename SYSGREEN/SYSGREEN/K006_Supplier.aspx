<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="K006_Supplier.aspx.cs" Inherits="SYSGREEN.K002_Buy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px" id ="div_LoTrinh">
         <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-1">
                    <input type="text" class="form-control" name="title" id="txt_ma"placeholder="Mã" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ten"placeholder="Tên" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_sdt"placeholder="SĐT" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_tinh"placeholder="Tỉnh" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_loai"placeholder="Loại" />
                </div>  
                  <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearh">Tìm kiếm</button>
                </div>
                 <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btAdd">Thêm</button>
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
            ten: 'Cơ sở A',
            sdt: '20/08/2018',
            tinh: 'Duytn4',
            diaChi: 'Đã mua ',
            loai: 'Đã mua ',
            ghiChu: 'duytn ',
        }, {
            stt: '2',
            ma: 'PX-20082018',
            ten: 'Cơ sở A',
            sdt: '20/08/2018',
            tinh: 'Duytn4',
            diaChi: 'Đã mua ',
            loai: 'Đã mua ',
            ghiChu: 'duytn ',
        }]
        data = data;
        var $table1 = $('#table1');
        $table1.bootstrapTable('load', data);
    };

    $('#btAdd').on('click', function (e) {
        window.location = '/K006_Detail.aspx?paramId= ADD';
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
                    title: 'Mã',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'ten',
                    title: 'Tên',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'sdt',
                    title: 'SĐT',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'tinh',
                    title: 'Tỉnh',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'diaChi',
                    title: 'Địa chỉ',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'loai',
                    title: 'Loại',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'ghiChu',
                    title: 'Ghi chú',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'operate',
                    title: 'Xem',
                    align: 'center',
                    valign: 'middle',
                    events: operateEvents,
                    formatter: operateFormatter
                }, {
                    field: 'operate2',
                    title: 'Xóa',
                    align: 'center',
                    valign: 'middle',
                    events: operateEvents2,
                    formatter: operateFormatter2
                }],

            data: itemData
        });
    };

    function operateFormatter(value, row, index) {
        return [
            '<a class="view" href="javascript:void(0)" title="view">',
            'Xem',
            '</a>  '
        ].join('');
    }

    window.operateEvents = {
        'click .view': function (e, value, row, index) {
            window.location = '/K006_Detail.aspx?paramId=' + row.id;
        }
    };
    ///
    function operateFormatter2(value, row, index) {
        return [
            '<a class="edit" href="javascript:void(0)" title="xóa">',
            'Xóa',
            '</a>  '
        ].join('');
    }

    window.operateEvents2 = {
        'click .edit': function (e, value, row, index) {
            $('#table1').bootstrapTable('remove', {
                field: 'stt',
                values: [row.stt]
            });
            sortData();
        }
    };
    var sortData = function () {
        var datatable = $('#table1').bootstrapTable('getData');
        var x = datatable.length;
        if (x > 0) {
            for (var i = 0; i < datatable.length; i++) {
                datatable[i].stt = i + 1;
            }
        } else {
            datatable = [];
        }
        data = datatable;
        var $table1 = $('#table1');
        $table1.bootstrapTable('load', data);
    };
</script>
    </asp:Content>






