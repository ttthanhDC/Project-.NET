<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="K002_ToTalByDate.aspx.cs" Inherits="SYSGREEN.K002_ToTalByDate" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px" id ="div_LoTrinh">
         <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-5">
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_todate"placeholder="Từ ngày" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_fromdate"placeholder="Đến ngày" />
                </div>
                  <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearh">Tìm kiếm</button>
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
            ngay: '20/08/2018',
            SoLuong1: '50',
            SoLuong2: '250',
            SoLuong3: '150',
            theTich: '10500',
        }, {
            stt: '1',
            ngay: '21/08/2018',
            SoLuong1: '50',
            SoLuong2: '250',
            SoLuong3: '150',
            theTich: '10500',
        }]
        data = data;
        var $table1 = $('#table1');
        $table1.bootstrapTable('load', data);
    };
    
    $('#btTaoLoTrinh').on('click', function (e) {

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
                    field: 'ngay',
                    title: 'Ngày',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'SoLuong1',
                    title: 'Số lượng (Chai 325 ml)',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'SoLuong2',
                    title: 'Số lượng (Chai 500 ml)',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'SoLuong3',
                    title: 'Số lượng (Chai 1000 ml)',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'theTich',
                    title: 'Thể tích (ml)',
                    align: 'center',
                    valign: 'middle',
                }],

            data: itemData
        });
    };


</script>
    </asp:Content>




