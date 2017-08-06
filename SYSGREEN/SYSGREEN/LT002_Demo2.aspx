<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"CodeBehind="LT002_Demo2.aspx.cs" Inherits="SYSGREEN.LT002_Demo2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
<div style ="height:10px"></div>
     <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
        <div class="form-horizontal">
            <div class="form-group">
                 <label for="sel1" class="col-md-5"></label>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btThemGoi">Thêm gói</button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btThemNgay">Thêm ngày</button>
                </div>
            </div> 
        </div> 
        
    </div>
<div style="margin-left : 30px; margin-right : 30px">
    <table id="table1" 
    ></table>
</div> 
<div class="form-horizontal">
            <div class="form-group">
                <label for="sel1" class="col-md-2"></label>
                <div class="col-md-2">
                    <label>Tổng số tiền HD</label>
                    <input type="text" class="form-control" name="title" id="txt_tientong"  readonly ="true"/>
                </div>
                <div class="col-md-2">
                    <label>Tổng số tiền đã thu </label>
                    <input type="text" class="form-control" name="title" id="txt_tiendathu" placeholder="Đến ngày" readonly ="true"/>
                </div>
                <div class="col-md-2">
                    <label>Tổng số tiền còn lại</label>
                    <input type="text" class="form-control" name="title" id="txt_tienconlai" placeholder="Từ ngày" readonly ="true"/>
                </div>
                
            </div> 
        </div> 
<div class="modal fade" id="modalTableKH" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 1200px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Thông tin khách hàng</h4>
                    </div>
                    <div class="modal-body">
                        <div id="dvHidden">
                        </div>
                    <div class="form-horizontal">
                    <div class="form-group">
                        <label for="sel1" class="col-md-4">Mã khách hàng</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="title" id="txtMaKH" disabled ="disabled"/>
                        </div>
                         <label for="sel1" class="col-md-2"></label>
                        <div class="col-md-2">
                                
                        </div>
                    </div> 
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="sel1" class="col-md-4">Họ và tên</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="title" id="txtHoTen" disabled ="disabled"/>
                            </div>
                            <label for="sel1" class="col-md-2"></label>
                            <div class="col-md-2">
                                
                            </div>
                        </div> 
                    </div>
                        <div class="form-horizontal">
                        <div class="form-group">
                            <label for="sel1" class="col-md-4">Ngày sinh</label>
                            <div class="col-md-4">
                                <input type="text" placeholder="dd/mm/yyyy" data-date-format='dd/mm/yyyy' class="form-control" name="title" id="txtNgaySinh" disabled ="disabled"/>
                            </div>
                              <label for="sel1" class="col-md-2"></label>
                            <div class="col-md-2">
                                
                            </div>
                        </div> 
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="sel1" class="col-md-4">Số điện thoại</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="title" id="txtSoDienThoai" disabled ="disabled"/>
                            </div>
                             <label for="sel1" class="col-md-2"></label>
                            <div class="col-md-2">
                                
                            </div>
                        </div> 
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="sel1" class="col-md-4">Email</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="title" id="txtEmailCustomer" disabled ="disabled"/>
                            </div>
                             <label for="sel1" class="col-md-2"></label>
                            <div class="col-md-2">
                                
                            </div>
                        </div> 
                    </div>
                        <div class="form-horizontal">
                        <div class="form-group">
                            <label for="sel1" class="col-md-4">Địa chỉ</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="title" id="txtDiaChiCustomer" disabled ="disabled"/>
                            </div>
                            <label for="sel1" class="col-md-2"></label>
                            <div class="col-md-2">
                                
                            </div>
                        </div> 
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="sel1" class="col-md-4">Quận</label>
                            <div class="col-md-4">
                               <input type="text" class="form-control" name="title" id="txtQuan" disabled ="disabled"/>
                            </div>
                             <label for="sel1" class="col-md-2"></label>
                            <div class="col-md-2">
                                
                            </div>
                        </div> 
                    </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnClose">Đóng</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    // Bootstrap Table
    $(function () {
        window.idParam = 0;
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) {
                    return pair[1];
                }
            }
            //alert('Query Variable ' + variable + ' not found');
        };
        loadContent();
        function loadContent() {

            loadDataHoaDon();
        };
        function loadDataHoaDon() {
            var formatDateTime = function (value) {
                if (value && value != "") {
                    var date = new Date(value);
                    var d = date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate();
                    var m = (date.getMonth() + 1) < 10 ? ('0' + (date.getMonth() + 1)) : (date.getMonth() + 1);
                    var y = date.getFullYear();
                    return d + '/' + m + '/' + y;
                } else {
                    return ''
                }
            };
            var idParam = getQueryVariable("paramId");
            window.idParam = idParam;
            var formSource = new FormData();
            var json = { 'type': 0 };
            formSource.append('type', 'getvHoaDonStep2');
            formSource.append('data', JSON.stringify(json));
            formSource.append('ID', idParam);
            $.ajax({
                url: "Configuation/HandlerInsertBill.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    // table
                    $('#table1').bootstrapTable({
                        columns: [{
                            field: 'codeReser',
                            title: 'Số reservation',
                            align: 'center',
                            valign: 'middle',
                            events: codeReserEvents,
                            formatter: codeReserFormatter
                        }, {
                            field: 'name',
                            title: 'Họ tên',
                            align: 'center',
                            valign: 'middle',
                            events: operateEventsKH,
                            formatter: operateFormatterKH
                            //editable: true,
                        },
                        /*
                        {
                            field: 'sdt',
                            title: 'Số điện thoại',
                            align: 'center',
                            valign: 'middle',
                            editable: true,

                        }, {
                            field: 'district',
                            title: 'Quận',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        }, {
                            field: 'address',
                            title: 'Địa chỉ',
                            align: 'center',
                            valign: 'middle',
                            editable: true,
                        },
                        */
                        {
                            field: 'status',
                            title: 'Trạng thái',
                            align: 'center',
                            valign: 'middle',
                            /*
                            formatter: function (value, row, index) {
                                if (value === 1) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 selected = true>Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 2) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ xử lý</option><option value = 2 selected = true>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 3) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3 selected = true>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 4) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1>Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4 selected = true>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 5) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5 selected = true>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                } else if (value === 6) {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0></option><option value = 1 >Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6 selected = true>Đang chuyển</option></select>'
                                } else {
                                    return '<select class="form-control" id="Bill' + index + '"> <option value = 0> selected = true</option><option value = 1 >Chờ xử lý</option><option value = 2>Đang xử lý</option><option value = 3>Hoàn thành</option><option value = 4>Chờ giao lại</option><option value = 5>Hủy</option><option value = 6>Đang chuyển</option></select>'
                                }
                            }*/
                        }, {
                            field: 'typeBill',
                            title: 'Loại Đơn',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'date',
                            title: 'Ngày',
                            align: 'center',
                            valign: 'middle',
                           // editable: true,
                        }, {
                            field: 'money',
                            title: 'Tiền',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'sotiendathu',
                            title: 'Số tiền đã thu',
                            align: 'center',
                            valign: 'middle',
                            //editable: true,
                        },{
                            field: 'sotienconlai',
                            title: 'Số tiền còn lại',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            field: 'shipper',
                            title: 'Shipper',
                            align: 'center',
                            valign: 'middle'
                        },
                        
                        {
                            field: 'ghichu',
                            title: 'Ghi chú',
                            align: 'center',
                            valign: 'middle',
                            //editable: true,
                        },
                        /*
                        {
                            field: 'operate',
                            title: 'In đơn',
                            align: 'center',
                            valign: 'middle',
                            events: operateEvents,
                            formatter: operateFormatter
                        }, */{
                            field: 'operate',
                            title: 'Bill',
                            align: 'center',
                            valign: 'middle',
                            events:operateEventsTachBill,
                            formatter: operateFormatterTachBill
                        }]
                    });
                    //Load Data Grid
                    var data = [];
                    var loaiGoi = -1;
                    var loaiGoiTemp = -1;
                    var tabIndex = -1;
                    var check = false;
                    var totalTienConLai = 0;
                    var totaTienThu = 0;
                    var totalTong = 0;
                    for (var i = 0 ; i < jsonData.length ; i++) {
                        var index = i +1;
                        var obj = {
                            id: index,
                            IDHD: jsonData[i].IDHD,
                            IdCTHD: jsonData[i].IdCTHD,
                            IdPCTHD: jsonData[i].IdCTHD,
                            IdNgayHD: jsonData[i].IdNgayHD,
                            idKH : jsonData[i].IdKH,
                            codeReser: '',
                            name: jsonData[i].TenKH,
                            sdt: jsonData[i].SoDienThoai,
                            district: jsonData[i].TenQuan,
                            address: jsonData[i].DiaChi,
                            status: -1,
                            typeBill: '',
                            date: formatDateTime(jsonData[i].NgayHD),
                            money: '',
                            IdNgayHD: jsonData[i].IdNgayHD,
                            IdHoaDon: idParam,
                            sotiendathu: '0',
                            sotienconlai: '0',
                            shipper: jsonData[i].tenShipper,
                            ghichu: jsonData[i].GhiChu,
                        };
                        
                        var codeRever = 'HD' + (jsonData[i].ID < 10 ? '0' + jsonData[i].ID : jsonData[i].ID) + "-" + (jsonData[i].tabIndex < 10 ? '0' + jsonData[i].tabIndex : jsonData[i].tabIndex) ;
                        obj.codeReser = codeRever;
                        // Trạng thái
                        obj.status = jsonData[i].TrangThai;
                        /*
                        if (jsonData[i].TrangThai == "Chờ xử lý") {
                            obj.status = 1;
                        }else if (jsonData[i].TrangThai == "Đang xử lý") {
                            obj.status = 2;
                        }else if (jsonData[i].TrangThai == "Hoàn thành") {
                            obj.status = 3;
                        }else if (jsonData[i].TrangThai == "Chờ giao lại") {
                            obj.status = 4;
                        }else if (jsonData[i].TrangThai == "Hủy") {
                            obj.status = 5;
                        } else if (jsonData[i].TrangThai == "Đang chuyển") {
                            obj.status = 6;
                        } else if (jsonData[i].TrangThai == "") {
                            obj.status = 0;
                        }*/
                        // Type BIll
                        

                        loaiGoiTemp = jsonData[i].Loai;
                        if (i == 0) {
                            totalTong = jsonData[i].TongTien;
                            if (jsonData[i].TrangThai != "Hoàn thành") {
                                $("#txt_tientong").val(jsonData[i].TongTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                                $("#txt_tienconlai").val(jsonData[i].TongTienConNo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                                $("#txt_tiendathu").val(jsonData[i].TongTienThuDuoc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                                obj.money = jsonData[i].TongTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                obj.sotiendathu = '0';
                                totaTienThu += 0;
                                obj.sotienconlai = jsonData[i].TongTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");;
                                totalTienConLai += jsonData[i].TongTien;
                            } else {
                                $("#txt_tientong").val(jsonData[i].TongTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                                $("#txt_tienconlai").val(jsonData[i].TongTienConNo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                                $("#txt_tiendathu").val(jsonData[i].TongTienThuDuoc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                                obj.money = jsonData[i].TongTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                obj.sotiendathu = jsonData[i].SoTienThuNgay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                totaTienThu += jsonData[i].SoTienThuNgay;
                                var tienconlai = jsonData[i].TongTien - jsonData[i].SoTienThuNgay;
                                obj.sotienconlai = tienconlai.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                totalTienConLai += tienconlai;
                            }
                            if (jsonData[i].Loai == 1) {
                                obj.typeBill = jsonData[i].TenGoi;
                            } else if (jsonData[i].Loai == 2) {
                                obj.typeBill = "Đơn lẻ";
                            }
                            loaiGoi = jsonData[i].Loai;
                            tabIndex = jsonData[i].tabIndex;
                        }
                        else{
                            if (jsonData[i].Loai == loaiGoi && check) {
                                // Không làm gì
                            } else {
                                if (jsonData[i].Loai != loaiGoi) {
                                    //obj.money = jsonData[i].ThanhTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                    if (jsonData[i].Loai == 1) {
                                        obj.typeBill = jsonData[i].TenGoi;
                                    } else if (jsonData[i].Loai == 2) {
                                        obj.typeBill = "Đơn lẻ";
                                    }
                                    loaiGoi = jsonData[i].Loai;
                                }
                                if (jsonData[i].Loai == loaiGoi && jsonData[i].tabIndex != tabIndex) {
                                    if (jsonData[i].Loai == 1) {
                                        obj.typeBill = jsonData[i].TenGoi;
                                    } else if (jsonData[i].Loai == 2) {
                                        obj.typeBill = "Đơn lẻ";
                                    }
                                    //obj.money = jsonData[i].ThanhTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                    tabIndex = jsonData[i].tabIndex;
                                }
                                if (jsonData[i].TrangThai == "Hoàn thành") {
                                    if (totalTienConLai > 0) {
                                        obj.money = totalTienConLai.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                        obj.sotiendathu = jsonData[i].SoTienThuNgay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                        totaTienThu += jsonData[i].SoTienThuNgay;
                                        var tienconlai = totalTienConLai - jsonData[i].SoTienThuNgay;
                                        obj.sotienconlai = tienconlai.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                        totalTienConLai = tienconlai;
                                    }
                                   
                                } else if (jsonData[i - 1].TrangThai == "Hoàn thành" && jsonData[i].TrangThai != "Hoàn thành") {
                                    if (totalTienConLai > 0) {
                                        obj.sotiendathu = '0';
                                        totaTienThu += 0;
                                        obj.sotienconlai = totalTienConLai.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                        obj.money = totalTienConLai.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                    }
                                    //totalTienConLai += tienconlai;
                                }
                            }
                        }

                        
                        
                        //Đang chuyển
                        data.push(obj);
                    }
                    $("#txt_tientong").val(totalTong.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    $("#txt_tiendathu").val(totaTienThu.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    var tcl = totalTong - totaTienThu;
                    $("#txt_tienconlai").val(tcl.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    $('#table1').bootstrapTable('load', data);

                },
                error: function (err) {

                }
            });


        };

        $('#table1').on('editable-save.bs.table', function (e, field, row, old, $el) {
            var $els = $('#table1').find('.editable');
            next = $els.index($el) + 1;
            if (field == "sotiendathu") {
                var sotiendathu = row.sotiendathu.toString().split('.').join('').split(',').join('');
                var sotientong = row.money.toString().split('.').join('').split(',').join('');
                row.sotienconlai = sotientong - sotiendathu;
                row.sotiendathu = row.sotiendathu.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                row.sotienconlai = row.sotienconlai.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                $('#table1').bootstrapTable('updateRow', { index: row.id - 1, row: row });
                var data = $('#table1').bootstrapTable('getData');
                var sotienthuduoc = 0;
                var sotienconlai = 0;
                for(var i = 0; i < data.length ; i++){
                    sotienthuduoc+= parseInt(data[i].sotiendathu.toString().split('.').join('').split(',').join(''));
                    sotienconlai += parseInt(data[i].sotienconlai.toString().split('.').join('').split(',').join(''));
                }
                $("#txt_tienconlai").val(sotienconlai.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#txt_tiendathu").val(sotienthuduoc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

                //disableEditableTable();
            }
            if (field == "ghichu") {
                $('#table1').bootstrapTable('updateRow', { index: row.id - 1, row: row });
            }
        });




    });


    function operateFormatterTachBill(value, row, index) {
        if (row.typeBill != '') {
            return [
           '<a class="product" href="javascript:void(0)" title="In Hóa đơn">',
           'Tách Bill'
                ].join('');
        } else {
            return '';
        }
       
        
    }

    function operateFormatter(value, row, index) {
        return [
        '<a class="linkIn" href="javascript:void(0)" title="In Hóa đơn">',
        'Print'
        ].join('');
    }

    function operateFormatterKH(value, row, index) {
        return [
        '<a class="linkInKH" href="javascript:void(0)" title="Xem thông tin khách hàng">',
        '' + value + ''
        ].join('');
    }

    window.operateEvents = {
        'click .linkIn': function (e, value, row, index) {
            // window.location = '/UserManger.aspx?paramId=' + row.id;
            alert('Action In');
        }
    };

    window.operateEventsTachBill = {
        'click .product': function (e, value, row, index) {
            // window.location = '/UserManger.aspx?paramId=' + row.id;
            alert('TachBill');
        }
    };
    window.operateEventsKH = {
        'click .linkInKH': function (e, value, row, index) {
            // window.location = '/UserManger.aspx?paramId=' + row.id;
            var formatDateTime = function (value) {
                if (value && value != "") {
                    var date = new Date(value);
                    var d = date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate();
                    var m = (date.getMonth() + 1) < 10 ? ('0' + (date.getMonth() + 1)) : (date.getMonth() + 1);
                    var y = date.getFullYear();
                    return d + '/' + m + '/' + y;
                } else {
                    return ''
                }
            };
            var formSource = new FormData();
            var json = { 'type': 0 };
            formSource.append('type', 'getCustomerById');
            formSource.append('data', JSON.stringify(json));
            formSource.append('makh', row.idKH);
            $.ajax({
                url: "Configuation/HandlerSysCustomer.ashx",
                type: "POST",
                data: formSource,
                contentType: false,
                processData: false,
                success: function (result) {
                    $('#modalTableKH').modal('show');
                    var jsonData = result;
                    var arr = [];
                    if (jsonData && jsonData.length > 0) {
                        var objectData = jsonData[0];
                        $('#txtMaKH').val("KH" + (objectData.ID < 10 ? ('0' + objectData.ID.toString()) : objectData.ID.toString()));
                        $('#txtHoTen').val(objectData.CustomerName);
                        $('#txtNgaySinh').val(formatDateTime(objectData.BirthDay));
                        $('#txtSoDienThoai').val(objectData.PhoneNumber);
                        document.getElementById('txtEmailCustomer').value = objectData.Email;
                        document.getElementById('txtDiaChiCustomer').value = objectData.Address;
                        $('#txtQuan').val(row.district);
                    }
                }, error: function (err) {
                    $('#modalTableKH').modal('show');
                }
            });
            
        }
    };
    // action thêm gói
    $('#btThemGoi').on('click', function (e) {
        window.location = '/LT002_ThemGoi.aspx?idKHParam= ' + window.idParam;
    });
    // action thêm ngày
    $('#btThemNgay').on('click', function (e) {
        window.location = '/LT002_ThemNgay.aspx?idKHParam= ' + window.idParam;
    });
    function codeReserFormatter(value, row, index) {
        return [
        '<a class="next" href="javascript:void(0)" title="chi tiết" >',
        '' + value + ''
        ].join('');
    }

    window.codeReserEvents = {
        'click .next': function (e, value, row, index) {
            window.location = '/LT002_Demo3.aspx?idKHParam=' + row.idKH + '&idNgayHoaDonParam=' + row.IdNgayHD;
            //alert('You click like action, row: ' + JSON.stringify(row));
        }
    };

    /*
    $('#btSave').on('click', function () {
        var formSource = new FormData();
        //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT
        var json = $('#table1').bootstrapTable('getData');
        var x = $('#table1 select option:selected');
        for (var i = 0; i < json.length ; i++) {
            json[i].status = x[i].text;
        }

        var json = {
            'HD': { 'id': window.idParam, 'sotienthu': $("#txt_tiendathu").val(), 'sotienconlai': $("#txt_tienconlai").val() },
            'NHD': json
        };
        formSource.append('type', 'updateStatusVHoaDonStep2');
        formSource.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerInsertBill.ashx",
            type: "POST",
            data: formSource,
            contentType: false,
            processData: false,
            success: function (result) {
                alert("Cập nhật trạng thái hóa đơn thành công");
                //Load Data Grid
                var jsonData = result;
                var data = [];
                var loaiGoi = -1;
                var tabIndex = -1;
                var check = false;
                for (var i = 0 ; i < jsonData.length ; i++) {
                    var index = i + 1;
                    var obj = {
                        id: index,
                        IDHD: jsonData[i].IDHD,
                        IdNgayHD: jsonData[i].IdNgayHD,
                        idKH : jsonData[i].IdKH,
                        codeReser: '',
                        name: jsonData[i].TenKH,
                        sdt: jsonData[i].SoDienThoai,
                        district: jsonData[i].TenQuan,
                        address: jsonData[i].DiaChi,
                        status: -1,
                        typeBill: -1,
                        date: jsonData[i].NgayHD,
                        money: '',
                        IdNgayHD: jsonData[i].IdNgayHD,
                        IdHoaDon: idParam,
                        sotiendathu: '0',
                        sotienconlai: '0',
                        shipper: jsonData[i].tenShipper,
                        ghichu: jsonData[i].GhiChu,
                    };

                    var codeRever = 'HD' + (jsonData[i].ID < 10 ? '0' + jsonData[i].ID : jsonData[i].ID) + "-" + (jsonData[i].tabIndex < 10 ? '0' + jsonData[i].tabIndex : jsonData[i].tabIndex);
                    obj.codeReser = codeRever;
                    // Trạng thái
                    if (jsonData[i].TrangThai == "Chờ xử lý") {
                        obj.status = 1;
                    } else if (jsonData[i].TrangThai == "Đang xử lý") {
                        obj.status = 2;
                    } else if (jsonData[i].TrangThai == "Hoàn thành") {
                        obj.status = 3;
                    } else if (jsonData[i].TrangThai == "Chờ giao lại") {
                        obj.status = 4;
                    } else if (jsonData[i].TrangThai == "Hủy") {
                        obj.status = 5;
                    } else if (jsonData[i].TrangThai == "Đang chuyển") {
                        obj.status = 6;
                    } else if (jsonData[i].TrangThai == "") {
                        obj.status = 0;
                    }
                    // Type BIll
                    if (jsonData[i].Loai == 1) {
                        obj.typeBill = "Đơn gói";
                    } else if (jsonData[i].Loai == 2) {
                        obj.typeBill = "Đơn lẻ";
                    }


                    if (i == 0 && jsonData[i].TrangThai != "Hoàn thành") {
                        $("#txt_tientong").val(jsonData[i].TongTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                        $("#txt_tienconlai").val(jsonData[i].TongTienConNo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                        $("#txt_tiendathu").val(jsonData[i].TongTienThuDuoc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                        obj.sotiendathu = jsonData[i].TongTienThuDuoc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        obj.sotienconlai = jsonData[i].TongTienConNo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        obj.money = jsonData[i].ThanhTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    } else if (i == 0 && jsonData[i].TrangThai == "Hoàn thành") {
                        $("#txt_tientong").val(jsonData[i].TongTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                        $("#txt_tienconlai").val(jsonData[i].TongTienConNo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                        $("#txt_tiendathu").val(jsonData[i].TongTienThuDuoc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                        obj.sotiendathu = jsonData[i].SoTienThuNgay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        obj.sotienconlai = jsonData[i].SoTienConLai.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        obj.money = jsonData[i].TongTienNgay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    }
                    else if (i > 0) {
                        if (jsonData[i].TrangThai == "Hoàn thành") {
                            obj.sotiendathu = jsonData[i].SoTienThuNgay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            obj.sotienconlai = jsonData[i].SoTienConLai.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            obj.money = jsonData[i].TongTienNgay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        } else if (jsonData[i - 1].TrangThai == "Hoàn thành" && jsonData[i].TrangThai != "Hoàn thành") {
                            obj.sotiendathu = '0';
                            obj.sotienconlai = '0';
                            obj.money = jsonData[i - 1].SoTienConLai.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        }
                    }
                    if (jsonData[i].Loai == loaiGoi && check) {
                        // Không làm gì
                    } else {
                        if (jsonData[i].Loai != loaiGoi) {
                            obj.money = jsonData[i].ThanhTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            loaiGoi = jsonData[i].Loai;
                        }
                        if (jsonData[i].Loai == loaiGoi && jsonData[i].tabIndex != tabIndex) {
                            obj.money = jsonData[i].ThanhTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            tabIndex = jsonData[i].tabIndex;
                        }
                    }
                    //Đang chuyển
                    data.push(obj);
                }

                $('#table1').bootstrapTable('load', data);
            },
            error: function (err) {

            }
        });
    });
    */
</script>
    </asp:Content>




