﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KT002_ReceiveMoneyCash.aspx.cs" Inherits="SYSGREEN.KT002_ReceiveMoneyCash" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">

   <div style ="margin-left:10%;margin-right:10%">
       <button type="button" class="btn btn-primary" id="btAdd">Thêm</button>
        <table id="table" 
       
        data-search="true" 
       
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
                        obj.idKT = objectData.IdKeToan;// TODO 
                        obj.IdNgayHD = objectData.IdNgayHD;
                        obj.ID = objectData.ID;
                        obj.MaChotCa = objectData.MaCa;
                        obj.permission = true;
                        if (objectData.Ngay) {
                            var data_ngay = objectData.Ngay;
                        } else {
                            var data_ngay = objectData.NgayChot;
                        }
                       // var data_ngay = objectData.NgayChot;
                        var z = "";
                        var a = "";
                        if (data_ngay) {
                            var x = data_ngay.substr(0, 10);
                            var y = x.split("-");
                            var y1 = y[0];
                            var y2 = y[1];
                            var y3 = y[2];
                            z = y3 + "/" + y2 + "/" + y1;
                            a = y3 + "" + y2 + "" + y1;
                        }
                        if (objectData.MaCa) {
                            obj.MaChotCa2 = "CHOTCA-" + a;
                        } else {
                            obj.MaChotCa2 = "";
                        }
                        
                       // obj.MaChotCa = objectData.MaCa;
                        obj.permission = true;
                        obj.date = z;
                        if (objectData.SoTien) {
                            //obj.money = objectData.SoTien;
                            if (objectData.SoTien) {
                                obj.money = (objectData.SoTien + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            } else {
                                obj.money = "";
                            }
                        } else {
                            // obj.money = objectData.TongTienGoi;
                            if (objectData.TienThuDuoc) {
                                obj.money = (objectData.TienThuDuoc + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            } else {
                                obj.money = "";
                            }
                        }
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
    $('#btAdd').on('click', function (e) {
        window.location = '/KT002_Detail.aspx?id=' + "Add";
    });
    // load all
    var loadAllDataTable = function () {
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
                        obj.idKT = objectData.IdKeToan;// TODO 
                        obj.IdNgayHD = objectData.IdNgayHD;
                        obj.ID = objectData.ID;
                        obj.MaChotCa = objectData.MaCa;
                        obj.permission = true;
                        if (objectData.Ngay) {
                            var data_ngay = objectData.Ngay;
                        } else {
                            var data_ngay = objectData.NgayChot;
                        }
                        //var data_ngay = objectData.NgayChot;
                        var z = "";
                        var a = "";
                        if (data_ngay) {
                            var x = data_ngay.substr(0, 10);
                            var y = x.split("-");
                            var y1 = y[0];
                            var y2 = y[1];
                            var y3 = y[2];
                            z = y3 + "/" + y2 + "/" + y1;
                            a = y3 + "" + y2 + "" + y1;
                        }
                        if (objectData.MaCa) {
                            obj.MaChotCa2 = "CHOTCA-" + a;
                        } else {
                            obj.MaChotCa2 = "";
                        }
                        obj.permission = true;
                        obj.date = z;
                        if (objectData.SoTien) {
                            //obj.money = objectData.SoTien;
                            if (objectData.SoTien) {
                                obj.money = (objectData.SoTien + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            } else {
                                obj.money = "";
                            }
                        } else {
                            // obj.money = objectData.TongTienGoi;
                            if (objectData.TienThuDuoc) {
                                obj.money = (objectData.TienThuDuoc + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            } else {
                                obj.money = "";
                            }
                        }
                        obj.staus = objectData.TinhTrang || 0;
                        obj.note = objectData.GhiChu;
                        arr.push(obj);

                    }
                }
                data = arr;
                var $table = $('#table');
                $table.bootstrapTable('load', data);

            },
            error: function (err) {
                eventSearch();
            }
        });
    };
    var getDataTable = function (itemData) {
        $('#table').bootstrapTable({
            columns: [{
                field: 'MaChotCa2',
                title: 'Mã chốt ca',
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
                            return '<select class="select2" id=TT' + index + '> ' +
                            '<option value = 0 > </option>' +
                            '<option value = 1 selected = true >Đã nhận tiền</option>' +
                            '<option value = 2 >Chưa nhận tiền</option></select>'
                        } else if (value === 2) {
                            return '<select class="select2" id=TT' + index + '> ' +
                             '<option value = 0 > </option>' +
                             '<option value = 1 >Đã nhận tiền</option>' +
                             '<option value = 2 selected = true>Chưa nhận tiền</option></select>'
                        } else {
                            return '<select class="select2" id=TT' + index + '> ' +
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
            data: itemData
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
            if (row.idKT) {
                eventUpdate("id", row, index);
            } else {
                var formData = new FormData();
                //var id = parseInt(row.id + "");
                var json = { 'ID': 0 };
                var date = "";
                if (row.date) {
                    var y = row.date.split("/");
                    var y1 = y[0];
                    var y2 = y[1];
                    var y3 = y[2];
                    date = y2 + "/" + y1 + "/" + y3;
                }
                jQuery.ajaxSetup({ async: true });
                formData.append('type', 'InsertKeToanReturnId');
                formData.append('Ngay', date);
                formData.append('data', JSON.stringify(json));
                $.ajax({
                    url: "Configuation/HandlerKeToan.ashx",
                    type: "POST",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        eventUpdate(result, row, index);
                    },
                    error: function (err) {

                    }
                });
            }
        }
    };
    var eventUpdate = function (id, row, index) {
        var formData = new FormData();
        if (row.idKT) {
            id_KT = row.idKT;
        } else {
            id_KT = id;
        }
        //var id = parseInt(row.id + "");
        var json = { 'ID': 0 };
        jQuery.ajaxSetup({ async: true });
        formData.append('type', 'InsertChiTietThuTMReturnId');
        formData.append('data', JSON.stringify(json));
        var date = "";
        if (row.date) {
            var y = row.date.split("/");
            var y1 = y[0];
            var y2 = y[1];
            var y3 = y[2];
            date = y2 + "/" + y1 + "/" + y3;
        }
        formData.append('Ngay', date);
        formData.append('SoTien', row.money);
        formData.append('MaGiaoDich', "");
        formData.append('LoaiThu', "1");
        formData.append('GhiChu', row.note);
        formData.append('IdKeToan', "0");
        formData.append('IdNgayHD', row.IdNgayHD ? row.IdNgayHD : row.MaCa);
        var lst2 = $('#table select.select2 option:selected');
        formData.append('MaNganHang', '6');
        formData.append('TinhTrang', lst2[index].value);
        formData.append('ID', row.ID);

        $.ajax({
            url: "Configuation/HandlerKeToan.ashx",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (result) {
                alert("Lưu thành công");
                loadAllDataTable();
            },
            error: function (err) {
            }
        });
    };
</script>
    </asp:Content>


