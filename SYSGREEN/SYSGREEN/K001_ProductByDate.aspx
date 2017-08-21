<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="K001_ProductByDate.aspx.cs" Inherits="SYSGREEN.K001_ProductByDate" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px" id ="div_LoTrinh">
         <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-7">
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_date"placeholder="Ngày" />
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
        <div style="height:30px"></div>
   <div style ="margin-left:20px;margin-right:20px" id ="div_Table2">
        <table id="table2"></table>
    </div>
   
<script>
    // Bootstrap Table
    $(function () {
        var itemData = [];
        getDataTable1(itemData);
        var itemData2 = [];
        getDataTable2(itemData2);
        eventSearch1();
        eventSearch2();
    });

    $('#btTKLoTrinh').on('click', function (e) {
        eventSearch();
    });



    var eventSearch1 = function () {
        var data = [];
        var formDatasearch = new FormData();
        formDatasearch.append('type', 'viewK001P1');

        var NgayLotrinh = $('#txt_date').val();
        if (NgayLotrinh !== "") {
            formDatasearch.append('Ngay', NgayLotrinh);
            var thu = convertDateToDay(formDatasearch);
            formDatasearch.append('thu', thu);
        } else {
            var d = new Date();
            var strDate = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
            formDatasearch.append('Ngay', strDate);
            var thu = convertDateToDay(strDate);
            formDatasearch.append('thu', thu);
        }
       
        $.ajax({
            url: "Configuation/HandlerKhoServices.ashx",
            type: "POST",
            data: formDatasearch,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};

                        obj.stt = i + 1;
                        obj.loaiSua = objectData.LoaiSua;
                        obj.duong = objectData.sugar;
                        obj.SoLuong = objectData.SoLuongChai;
                        obj.theTich = objectData.TheTich;
                        arr.push(obj);
                    }
                } 
                
                data = arr;
                var $table = $('#table1');
                $table.bootstrapTable('load', data);
            },
            error: function (err) {
            }
        });



       /* var data = [{
            stt: '1',
            loaiSua: 'Hạt điều',
            duong: '1',
            SoLuong: '50',
            theTich: '1500',
        }, {
            stt: '2',
            loaiSua: 'Hạt sen',
            duong: '0',
            SoLuong: '80',
            theTich: '2000',
        }]
        data = data;
        var $table1 = $('#table1');
        $table1.bootstrapTable('load', data);*/
    };
    var eventSearch2 = function () {
        var data = [];
        var formDatasearch = new FormData();
        formDatasearch.append('type', 'viewK001P2');

        var NgayLotrinh = $('#txt_date').val();
        if (NgayLotrinh !== "") {
            formDatasearch.append('Ngay', NgayLotrinh);
        } else {
            var d = new Date();
            var strDate = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
            formDatasearch.append('Ngay', strDate);
        }

        $.ajax({
            url: "Configuation/HandlerKhoServices.ashx",
            type: "POST",
            data: formDatasearch,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        
                        obj.stt = objectData.ID_NHD;
                        obj.id = objectData.ID_NHD;
                        obj.id = objectData.ID_NHD;
                        obj.id = objectData.ID_NHD;
                        obj.id = objectData.ID_NHD;
                    }
                }
                // data = arr;
                //var $table = $('#tableLoTrinh');
                //$table.bootstrapTable('load', data);
            },
            error: function (err) {
            }
        });
        /*var data = [{
            stt: '1',
            viSua: 'Hạt điều',
            theTich: '5000',
            theTichDuKien: '4500',
            conLai: '500',
        }, {
            stt: '2',
            viSua: 'Hạt sen',
            theTich: '5000',
            theTichDuKien: '4500',
            conLai: '500',
        }]
        data = data;
        var $table2 = $('#table2');
        $table2.bootstrapTable('load', data);*/
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
                    field: 'loaiSua',
                    title: 'Loại sữa',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'duong',
                    title: 'Đường',
                    align: 'center',
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        if (value === 1 || value === "1") {
                            return '<input type="checkbox" class="check"  checked="checked" />';
                        } else {
                            return '<input type="checkbox" class="check" />';
                        }
                    }
                }, {
                    field: 'SoLuong',
                    title: 'Số lượng (Chai)',
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
    var getDataTable2 = function (itemData) {
        $('#table2').bootstrapTable({
            columns: [
                {
                    field: 'stt',
                    title: 'STT',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'viSua',
                    title: 'Vị sữa',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'theTich',
                    title: 'Thể tích (ml)',
                    align: 'center',
                    valign: 'middle',
                    editable: true
                }, {
                    field: 'theTichDuKien',
                    title: 'Thể tích dự kiến (ml)',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'conLai',
                    title: 'Còn lại (ml)',
                    align: 'center',
                    valign: 'middle',
                }],

            data: itemData
        });
    };
    function convertDateToDay(num) {
        // var x = parseStringToDate(num);
        var x = num;
        x = x.split('/')[1] + "/" + x.split('/')[0] + "/" + x.split('/')[2];
        var date = new Date(x);
        var day = date.getDay();
        return day
    }

</script>
    </asp:Content>



