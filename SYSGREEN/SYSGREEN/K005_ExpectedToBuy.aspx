<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"  CodeBehind="K005_ExpectedToBuy.aspx.cs" Inherits="SYSGREEN.K005_ExpectedToBuy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px" id ="div_LoTrinh">
         <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_phieuNhap"placeholder="Phiếu nhập" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_date"placeholder="Ngày" />
                </div>
                   <div class="col-md-2">
                    <div class="form-group">
                          <select class="form-control" id="cbKho">
                              <option value ="1"> Tất cả cơ sở</option>
                              <option value ="2"> Cơ sở A</option>
                                <option value ="2"> Cơ sở B</option>
                          </select>
                        </div>
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
            phieuNhap: 'PX-20082018',
            coSo: 'Cơ sở A',
            date: '20/08/2018',
            nguoiDeXuat: 'Duytn4',
            toi: 'Đã mua ',
            ghiChu: 'duytn ',
        }, {
            stt: '2',
            phieuNhap: 'PX-20082018',
            coSo: 'Cơ sở B',
            date: '20/08/2018',
            nguoiDeXuat: 'ThanhDC7',
            toi: 'Đã mua ',
            ghiChu: 'duytn ',
        }]
        data = data;
        var $table1 = $('#table1');
        $table1.bootstrapTable('load', data);
    };

    $('#btAdd').on('click', function (e) {
        window.location = '/K005_Detail.aspx?paramId= ADD';
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
                    field: 'phieuNhap',
                    title: 'Phiếu xuất',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'Cơ sở',
                    title: 'coSo',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'date',
                    title: 'Thời gian',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'nguoiDeXuat',
                    title: 'Người đề xuất',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'toi',
                    title: 'Tới',
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
            window.location = '/K005_Detail.aspx?paramId=' + row.id;
        }
    };
</script>
    </asp:Content>






