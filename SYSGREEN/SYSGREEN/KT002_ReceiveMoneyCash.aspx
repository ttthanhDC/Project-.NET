<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KT002_ReceiveMoneyCash.aspx.cs" Inherits="SYSGREEN.KT002_ReceiveMoneyCash" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">

   <div style ="margin-left:10%;margin-right:10%">
        <table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-page-list="[10, 25, 50, 100, ALL]" 
        ></table>
   </div>
   
<script>
    // Bootstrap Table
    $(function () {
        var data = [];
        var formData = new FormData();
        // var id = parseInt(row.id + "");
        var json = { 'ID': "0" };
        jQuery.ajaxSetup({ async: true });
        formData.append('type', 'viewManHinhThuTM');
        formData.append('data', json);
        formData.append('Ngay', "");
        $.ajax({
            url: "Configuation/HandlerKeToan.ashx",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        //var id_check = 0;
                        obj.idGoi = objectData.ID_HD;
                        obj.permission = true;
                        var data_ngay = objectData.Ngay;
                        var z = "";
                        if (data_ngay) {
                            var x = data_ngay.substr(0, 10);
                            var y = x.split("-");
                            var y1 = y[0];
                            var y2 = y[1];
                            var y3 = y[2];
                            z = y3 + "/" + y2 + "/" + y1;
                        }
                        obj.date = z;
                        obj.money = objectData.TongTienGoi || "";
                        obj.staus = objectData.TinhTrang || 0;
                        obj.note = objectData.GhiChu;
                        arr.push(obj);
                    }
                }
                data = arr;
                getDataTable(data);

            },
            error: function (err) {
                eventSearch();
            }
        });

       
    });
    var getDataTable = function (itemData) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'date',
                title: 'Ngày',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value) {
                        return '<label style = "color: blue;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'money',
                title: 'Số tiền',
                align: 'center',
                valign: 'middle',
                editable: true,
            }, {
                field: 'staus',
                title: 'Tình trạng',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.permission) {
                        if (value === 1) {
                            return '<select class="form-control" id=TT' + index + '> ' +
                            '<option value = 0 > </option>' +
                            '<option value = 1 selected = true >Đã nhận tiền</option>' +
                            '<option value = 2 >Chưa nhận tiền</option></select>'
                        } else if (value === 2) {
                            return '<select class="form-control" id=TT' + index + '> ' +
                             '<option value = 0 > </option>' +
                             '<option value = 1 >Đã nhận tiền</option>' +
                             '<option value = 2 selected = true>Chưa nhận tiền</option></select>'
                        } else {
                            return '<select class="form-control" id=TT' + index + '> ' +
                            '<option value = 0 selected = true> </option>' +
                            '<option value = 1 >Đã nhận tiền</option>' +
                            '<option value = 2 >Chưa nhận tiền</option></select>'
                        }
                    } else {
                        return "";
                    }
                }
            }, {
                field: 'note',
                title: 'Ghi chú',
                align: 'center',
                valign: 'middle',
                editable: true,
                //sortable: true,
            }, {
                field: 'operate',
                title: 'Lưu',
                align: 'center',
                valign: 'middle',
                events: operateEvents,
                formatter: operateFormatter
            }],
        });
    };
    function operateFormatter(value, row, index) {
        return [
            '<a class="save" href="javascript:void(0)" title="Lưu">',
            'Lưu data',
            '</a>',
        ].join('');
    }

    window.operateEvents = {
        'click .save': function (e, value, row, index) {
            var formData = new FormData();
            var id = parseInt(row.id + "");
            var json = { 'ID': id };
            jQuery.ajaxSetup({ async: true });
            formData.append('type', 'DeleteTrinhShipper');
            formData.append('IdLotrinh', id);
            $.ajax({
                url: "Configuation/HandlerShipper.ashx",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function (result) {
                    eventSearch();
                },
                error: function (err) {
                    eventSearch();
                }
            });
        }
    };
</script>
    </asp:Content>


