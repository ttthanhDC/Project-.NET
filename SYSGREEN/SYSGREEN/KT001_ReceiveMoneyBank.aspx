<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KT001_ReceiveMoneyBank.aspx.cs" Inherits="SYSGREEN.KT001_ReceiveMoneyBank" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
 <div class="main-content-inner" style ="margin-left:30px;margin-right:30px" id ="div_LoTrinh">
         <div class="form-horizontal">
            <div class="form-group">
                <label for="sel1" class="col-md-8"></label>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_date"placeholder="ngày" />
                </div>
                  <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
                
            </div> 
        </div> 
    </div>
   <div style ="margin-left:20px;margin-right:20px">
        <table id="table"></table>
   </div>
   
<script>
    // Bootstrap Table
    $(function () {
        var data = [];
        var formData = new FormData();
       // var id = parseInt(row.id + "");
        var json = { 'ID': "0" };
        jQuery.ajaxSetup({ async: true });
        formData.append('type', 'viewManHinhThuCK');
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
                    var idCheck = 0;
                    var check = false;
                    var check2 = false;
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        if (!check && !check2) {
                            idCheck = objectData.ID_PTCHD;
                            obj.id = objectData.ID_PTCHD;
                            obj.idKT = objectData.IdKeToan;// TODO 
                            obj.IdNgayHD = objectData.IdNgayHD;
                            obj.ID_NHD = objectData.ID_NHD;


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
                            obj.name = objectData.TenKH_HD || "";
                            //obj.money = objectData.TongTienGoi || "";
                            if (objectData.TongTienGoi) {
                                obj.money = (objectData.TongTienGoi + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            } else {
                                obj.money = "";
                            }
                            obj.bank = objectData.MaNganHang || 0;
                            obj.code = objectData.MaGiaoDich || "";
                            obj.staus = objectData.TinhTrang || 0;
                            obj.note = objectData.GhiChu;
                            arr.push(obj);
                            check = true;
                            check2 = false;
                        } else {
                            if (idCheck === objectData.ID_PTCHD) {
                                
                            } else {
                                check2 = true;
                                idCheck = objectData.ID_PTCHD;
                                obj.id = objectData.ID_PTCHD;
                                obj.idKT = objectData.IdKeToan;// TODO
                                obj.IdNgayHD = objectData.IdNgayHD;
                                obj.ID_NHD = objectData.ID_NHD;
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
                                obj.name = objectData.TenKH_HD || "";
                                if (objectData.TongTienGoi) {
                                    obj.money = (objectData.TongTienGoi + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                } else {
                                    obj.money = "";
                                }

                                obj.bank = objectData.MaNganHang || 0;
                                obj.code = objectData.MaGiaoDich || "";
                                obj.staus = objectData.TinhTrang || 0;
                                obj.note = objectData.GhiChu;
                                arr.push(obj);
                                check = false;
                            }
                        }
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
    // search
    $('#btSearch').on('click', function (e) {
        var data = [];
        var formData = new FormData();
        // var id = parseInt(row.id + "");
        var json = { 'ID': "0" };
        jQuery.ajaxSetup({ async: true });
        formData.append('type', 'viewManHinhThuCK');
        formData.append('data', json);
        formData.append('Ngay', $('#txt_date').val());
        $.ajax({
            url: "Configuation/HandlerKeToan.ashx",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (result) {
                var arr = [];
                if (result === "0") {

                } else {
                    var jsonData = result;
                    if (jsonData && jsonData.length > 0) {
                        var idCheck = 0;
                        var check = false;
                        var check2 = false;
                        for (var i = 0; i < jsonData.length ; i++) {
                            var objectData = jsonData[i];
                            var obj = {};
                            if (!check && !check2) {
                                idCheck = objectData.ID_PTCHD;
                                obj.id = objectData.ID_PTCHD;
                                obj.idKT = objectData.IdKeToan;// TODO
                                obj.IdNgayHD = objectData.IdNgayHD;
                                obj.ID_NHD = objectData.ID_NHD;
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
                                obj.name = objectData.TenKH_HD || "";
                                if (objectData.TongTienGoi) {
                                    obj.money = (objectData.TongTienGoi + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                } else {
                                    obj.money = "";
                                }

                                obj.bank = objectData.MaNganHang || 0;
                                obj.code = objectData.MaGiaoDich || "";
                                obj.staus = objectData.TinhTrang || 0;
                                obj.note = objectData.GhiChu;
                                arr.push(obj);
                                check = true;
                                check2 = false;
                            } else {
                                if (idCheck === objectData.ID_PTCHD) {

                                } else {
                                    check2 = true;
                                    idCheck = objectData.ID_PTCHD;
                                    obj.id = objectData.ID_PTCHD;
                                    obj.idKT = objectData.IdKeToan;// TODO
                                    obj.IdNgayHD = objectData.IdNgayHD;
                                    obj.ID_NHD = objectData.ID_NHD;
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
                                    obj.name = objectData.TenKH_HD || "";
                                    if (objectData.TongTienGoi) {
                                        obj.money = (objectData.TongTienGoi + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                    } else {
                                        obj.money = "";
                                    }

                                    obj.bank = objectData.MaNganHang || 0;
                                    obj.code = objectData.MaGiaoDich || "";
                                    obj.staus = objectData.TinhTrang || 0;
                                    obj.note = objectData.GhiChu;
                                    arr.push(obj);
                                    check = false;
                                }
                            }
                        }

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

    });
    // load all
    var loadAllDataTable = function () {
        var data = [];
        var formData = new FormData();
        // var id = parseInt(row.id + "");
        var json = { 'ID': "0" };
        jQuery.ajaxSetup({ async: true });
        formData.append('type', 'viewManHinhThuCK');
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
                    var idCheck = 0;
                    var check = false;
                    var check2 = false;
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        if (!check && !check2) {
                            idCheck = objectData.ID_PTCHD;
                            obj.id = objectData.ID_PTCHD;
                            obj.idKT = objectData.IdKeToan;// TODO
                            obj.IdNgayHD = objectData.IdNgayHD;
                            obj.ID_NHD = objectData.ID_NHD;
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
                            obj.name = objectData.TenKH_HD || "";
                            if (objectData.TongTienGoi) {
                                obj.money = (objectData.TongTienGoi + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            } else {
                                obj.money = "";
                            }

                            obj.bank = objectData.MaNganHang || 0;
                            obj.code = objectData.MaGiaoDich || "";
                            obj.staus = objectData.TinhTrang || 0;
                            obj.note = objectData.GhiChu;
                            arr.push(obj);
                            check = true;
                            check2 = false;
                        } else {
                            if (idCheck === objectData.ID_PTCHD) {

                            } else {
                                check2 = true;
                                idCheck = objectData.ID_PTCHD;
                                obj.id = objectData.ID_PTCHD;
                                obj.idKT = objectData.IdKeToan;// TODO
                                obj.IdNgayHD = objectData.IdNgayHD;
                                obj.ID_NHD = objectData.ID_NHD;
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
                                obj.name = objectData.TenKH_HD || "";
                                if (objectData.TongTienGoi) {
                                    obj.money = (objectData.TongTienGoi + "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                } else {
                                    obj.money = "";
                                }

                                obj.bank = objectData.MaNganHang || 0;
                                obj.code = objectData.MaGiaoDich || "";
                                obj.staus = objectData.TinhTrang || 0;
                                obj.note = objectData.GhiChu;
                                arr.push(obj);
                                check = false;
                            }
                        }
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
                field: 'name',
                title: 'Tên khách hàng',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'money',
                title: 'Số tiền',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'bank',
                title: 'Ngân hàng',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value === 1) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 selected = true>VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 2) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2 selected = true>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 3) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3 selected = true>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 4) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4 selected = true>VP</option><option value = 5>VPDN</option></select>'
                    } else if (value === 5) {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0></option><option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4 >VP</option><option value = 5 selected = true>VPDN</option></select>'
                    } else {
                        return '<select class="select1" id="NH' + index + '"> <option value = 0 selected = true></option> <option value = 1 >VCB</option><option value = 2>BIDV</option><option value = 3>TCB</option><option value = 4>VP</option><option value = 5>VPDN</option></select>'
                    }
                }
            }, {
                field: 'code',
                title: 'Mã giao dịch',
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
            if(row.idKT){
                eventUpdate("id",row, index);
            } else {
                var formData = new FormData();
                //var id = parseInt(row.id + "");
                var json = { 'ID': 0 };
                jQuery.ajaxSetup({ async: true });
                formData.append('type', 'InsertKeToanReturnId');
                var date = "";
                if (row.date) {
                    var y = row.date.split("/");
                    var y1 = y[0];
                    var y2 = y[1];
                    var y3 = y[2];
                    date = y2 + "/" + y1 + "/" + y3;
                }
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
        formData.append('type', 'InsertChiTietThuReturnId');
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
       
        formData.append('MaGiaoDich', row.code);
       
        formData.append('LoaiThu', "0");
        formData.append('GhiChu', row.note);
        formData.append('IdKeToan', id_KT);
        formData.append('IdNgayHD', row.ID_NHD);
        var lst1 = $('#table select.select1 option:selected');
        var lst2 = $('#table select.select2 option:selected');
        formData.append('MaNganHang', lst1[index].value);
        formData.append('TinhTrang', lst2[index].value);
        
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

