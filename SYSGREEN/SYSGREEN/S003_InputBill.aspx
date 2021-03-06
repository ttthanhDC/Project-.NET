﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S003_InputBill.aspx.cs" Inherits="SYSGREEN.S003_InputBill" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
     <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btback">Quay lại</button>
                   
                </div>
            </div> 
        </div> 
    </div>
   <div style ="margin-left:20px;margin-right:20px">
       <table id="table"></table>
       <div style ="text-align:right; margin-top:20px"><button type="button" class="btn btn-primary" id="btSave">Lưu data</button></div>
   </div> 
   
<script>
    // Bootstrap Table
    $(function () {
        var data = [];
        getDataTable(data);

        window.idParam = getQueryVariable("paramId");
        //alert("Data" + window.idParam);
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) {
                    return pair[1];
                }
            }
        }
        // load data by id
        var data = [];
        var formDataListUser = new FormData();
        // formDataListUser.append('type', 'getALLDataByMaLoTrinh');
        //var json = { 'IdLotrinh': 0 };
        // var MaLT = $('#txt_maLoTrinh').val();
        //formDataListUser.append('MaLotrinh', MaLT);
        formDataListUser.append('type', 'getALLDataByIdLoTrinh');
        //var json = { 'IdLotrinh': 0 };
        formDataListUser.append('IdLotrinh', window.idParam);
        $.ajax({
            url: "Configuation/Handler1Test.ashx",
            type: "POST",
            data: formDataListUser,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.id = objectData.ID_NHD;
                        obj.idKH = objectData.IdKH;
                        obj.ID_PTCHD = objectData.ID_PTCHD;

                        obj.code = objectData.MaReservation;
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
                        //obj.status = objectData.TrangThaiNHD || "";
                        obj.name = objectData.TenKH_HD || "";
                        obj.phone = objectData.SoDienThoai || "";
                        obj.district = objectData.TenQuan || "";
                        obj.address = objectData.DiaChi || "";
                        obj.money = objectData.TongTien;
                        // obj.money = objectData.Create_User || "";// chua có

                        if (jsonData[i].TrangThaiNHD == "Chưa xử lý") {
                            obj.status = 1;
                        } else if (jsonData[i].TrangThaiNHD == "Đang xử lý") {
                            obj.status = 2;
                        } else if (jsonData[i].TrangThaiNHD == "Hoàn thành") {
                            obj.status = 3;
                        } else if (jsonData[i].TrangThaiNHD == "Hủy") {
                            obj.status = 4;
                        }
                        // hình thúc thanh toán
                        if (jsonData[i].HinhThucThanhToan == "Tiền mặt") {
                            obj.httt = 1;
                        } else if (jsonData[i].HinhThucThanhToan == "Chuyển khoản") {
                            obj.httt = 2;
                        } else {
                            obj.httt = 1;
                        }


                        //obj.httt = objectData.HinhThucThanhToan;
                        obj.note = objectData.GhiChu;
                        obj.moneyPay = objectData.SoTienThu || "";

                        // userName
                        arr.push(obj);
                    }
                }
                data = arr;
                var $tableSearch = $('#table');
                $tableSearch.bootstrapTable('load', data);
                //getDataTable(data);
            },
            error: function (err) {
            }
        });
    });
    // button search
    $('#btback').on('click', function (e) {
        window.location = '/S002_Route.aspx?paramId= 0';
    });
    // button save
    $('#btSave').on('click', function (e) {
        var datatable = $('#table').bootstrapTable('getData');
        var select1 = $('#table select.select1 option:selected');
        var select2 = $('#table select.select2 option:selected');
        for (var i = 0; i < datatable.length ; i++) {
            datatable[i].status = select1[i].text;
            datatable[i].httt = select2[i].text;
        }
        var formDataListData = new FormData();
        formDataListData.append('type', 'saveS003InputBill');
        formDataListData.append('data', JSON.stringify(datatable));
        $.ajax({
            url: "Configuation/Handler1Test.ashx",
            type: "POST",
            data: formDataListData,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                if (jsonData) {
                    alert("Lưu data thành công");
                } else {
                    alert("Lưu data không thành công");
                }
            },
            error: function (err) {
            }
        });
    });
    var getDataTable = function (itemData) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'code',
                title: 'Mã đơn',
                align: 'center',
                valign: 'middle',
                events: codeReserEvents,
                formatter: codeReserFormatter
            }, {
                field: 'name',
                title: 'Họ và tên',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'date',
                title: 'Ngày',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'phone',
                title: 'SĐT',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'address',
                title: 'Địa chỉ',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'money',
                title: 'Tiền',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'status',
                title: 'Trạng thái',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value === 1) {
                        return '<select class="select1" id="Bill' + index + '"><option value = 1 selected = true>Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Hủy</option></select>'
                    } else if (value === 2) {
                        return '<select class="select1" id="Bill' + index + '"><option value = 1>Chưa xử lý</option><option value = 2 selected = true>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Hủy</option></select>'
                    } else if (value === 3) {
                        return '<select class="select1" id="Bill' + index + '"><option value = 1>Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3 selected = true>Hoàn thành</option><option value = 4>Hủy</option></select>'
                    } else if (value === 4) {
                        return '<select class="select1" id="Bill' + index + '"><option value = 1>Chưa xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4 selected = true>Hủy</option></select>'
                    }
                }
            }, {
                field: 'httt',
                title: 'Hình thức thanh toán',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value === 1) {
                        return '<select class="select2" id="STT' + index + '"><option value = 1 selected = true>Tiền mặt</option><option value = 2>Chuyển khoản</option></select>'
                    } else {
                        return '<select class="select2" id="STT' + index + '"><option value = 1>Tiền mặt</option><option value = 2 selected = true>Chuyển khoản</option></select>'
                    }
                }
            }, {
                field: 'moneyPay',
                title: 'Số TĐTT',
                align: 'center',
                valign: 'middle',
                editable: true
            }, {
                field: 'note',
                title: 'Ghi chú',
                align: 'center',
                valign: 'middle',
                editable: true
            }],

            data: itemData
        });
    };
    // function
    function userFormatter(data) {
        return data.length;
    }
    function operateFormatter(value, row, index) {
        return [
            '<a class="right" href="javascript:void(0)" title="nợ ?">',
            'Nợ ?',
            '</a>',

        ].join('');
    }

    window.operateEvents = {
        'click .right': function (e, value, row, index) {
            //window.location = '/TheRightForUser.aspx?paramId=' + row.id;
            alert('Đơn thanh toán chuyển khoản nhưng vẫn còn nợ tiền ');
        }
    };
    function codeReserFormatter(value, row, index) {
        return [
        '<a class="next" href="javascript:void(0)" title="chi tiết" >',
        '' + value + ''
        ].join('');
    }

    window.codeReserEvents = {
        'click .next': function (e, value, row, index) {
            window.location = '/LT002_Demo3.aspx?idKHParam=' + row.idKH + '&idNgayHoaDonParam=' + row.id + '&idLoTrinh=' + window.idParam;
            //alert('You click like action, row: ' + JSON.stringify(row));
        }
    };
</script>
    </asp:Content>

