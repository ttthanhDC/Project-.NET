$(function () {
    var maxTabs = 50, index = 1;
    var lstTable = [];
    var dataGlobal = [];
    window.dataGoi = [];
    window.dataGlobal = [];
    window.indexTab = 0;
    window.totalTienGoi = 0;
    window.indexGoi = -1;
    window.isMasterTab = 0;
    window.hidden = false;
    window.hiddenSingle = false;
    window.tenGoi = "";
    window.tienGoi = 0;
    window.TempTab = [{ 'txtHoTen': '', 'txtNgaySinh': '', 'txtSoDienThoai': '', 'txtEmailCustomer': '', 'txtDiaChiCustomer': '', 'cb_quan': '' }];
    /************************************************
    ******** Load Content Form
    ************************************************/
    loadContent();
    function loadContent() {
        loadIsMasterTab();
        //loadAutoMaHoaDon();
        FormatDate();
        LoadComboBoxNguon();
        LoadComboBoxQH();
        validateKhachHang();
        eventKhachHang();
        eventCheckBoxIsMaster();
        addHoaDon();
        indexTab = 0;
        updateComponent(0);
        loadGoiHD();
    };
    function eventCheckBoxIsMaster() {

        $('#chkCheckBox').change(function () {
            window.isMasterTab = $('#chkCheckBox').prop('checked') ? window.indexTab : -1;
        });
    };
    function loadIsMasterTab() {
        $("#chkCheckBox").attr('checked', true);
    };
    function FormatDate() {
        $('#txtNgaySinh').datepicker({
            dateFormat: 'dd/mm/yyyy'
        });
        $('#txtNgaySinh1').datepicker({
            dateFormat: 'dd/mm/yyyy'
        });
        $('#txtNgayGiaoHangLe').datepicker({
            dateFormat: 'dd/mm/yyyy'
        });

    };
    function loadGoiHD() {
        var formSource = new FormData();
        var json = { 'type': 0 };
        formSource.append('type', 'getGoiHD');
        formSource.append('data', JSON.stringify(json));
        $.ajax({
            url: "/InsertBill/getGoiHD",
            type: "POST",
            data: formSource,
            dataType: "json",
            contentType: false,
            processData: false,
            success: function (result) {
                window.dataGoi = result;
            },
            error: function (err) {

            }
        });
    }
    function loadAutoMaHoaDon() {
        var formSource = new FormData();
        var json = { 'type': 0 };
        formSource.append('type', 'getMaxIdHoaDon');
        formSource.append('data', JSON.stringify(json));
        $.ajax({
            url: "/InsertBill/getMaxIdHoaDon",
            type: "POST",
            data: formSource,
            contentType: false,
            processData: false,
            success: function (result) {
                var maxIdHoa = parseInt(result);
                var maHoaDon = "HD" + (maxIdHoa < 10 ? ('0' + maxIdHoa) : maxIdHoa);
                $('#txtMaHD').val(maHoaDon);
            },
            error: function (err) {

            }
        });
    }
    function loadDataHoaDon() {
        var formSource = new FormData();
        var json = { 'type': 0 };
        var makh = "";
        var mahd = "HD13";
        var tensp = "";
        formSource.append('type', 'getData');
        formSource.append('data', JSON.stringify(json));
        formSource.append('MaHD', mahd);
        formSource.append('TenKH', makh);
        formSource.append('TenSP', tensp);
        $.ajax({
            url: "/InsertBill/getData",
            type: "POST",
            data: formSource,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;

            },
            error: function (err) {

            }
        });
    };
    // validateKhachHang
    function validateKhachHang() {

    };
    // LoadComboBoxNguon
    function LoadComboBoxNguon() {
        var formSource = new FormData();
        var json = { 'ID': 0 };
        formSource.append('type', 'getData');
        formSource.append('data', JSON.stringify(json));
        $.ajax({
            url: "/SysSource/getData",
            type: "POST",
            data: formSource,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.name = objectData.Source_Name;
                        obj.link = objectData.ID;
                        obj.sub = null;
                        arr.push(obj);
                    }
                }
                var data1 = { menu: arr };
                var $menu = $("#cb_SourceType");
                $.each(data1.menu, function () {
                    $menu.append(getSource(this));
                });
            },
            error: function (err) {

            }
        });
    };
    // Get Source Quan Huyen
    function LoadComboBoxQH() {
        var formSource = new FormData();
        var json = { 'ID': 0 };
        formSource.append('type', 'getData');
        formSource.append('data', JSON.stringify(json));
        $.ajax({
            url: "/QuanHuyen/getData",
            type: "POST",
            data: formSource,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.name = objectData.TenQuan;
                        obj.link = objectData.MaQuan;
                        obj.sub = null;
                        arr.push(obj);
                    }
                }
                var data1 = { menu: arr };
                var $menu = $("#cb_quan");
                var $menu1 = $("#cb_quan1");
                $.each(data1.menu, function () {
                    $menu.append(getSource(this));
                    $menu1.append(getSource(this));
                });
            },
            error: function (err) {

            }
        });
    };
    // getSource
    function getSource(itemData) {
        var item = $("<option value='" + itemData.link + "'>")
            .append(itemData.name);
        return item;
    };
    // eventKhachHang
    function eventKhachHang() {
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

        // Onchange Customer
        $('#txtHoTen').on('change', function () {
            if (window.isMasterTab == 0) {
                if (window.TempTab.length > 0) {
                    window.TempTab[window.indexTab].txtHoTen = this.value;
                }
                $("#txtHoTen1").val(this.value);
            }
        });
        $('#txtNgaySinh').on('change', function () {
            if (window.isMasterTab == 0) {
                if (window.TempTab.length > 0) {
                    window.TempTab[window.indexTab].txtNgaySinh = this.value;
                }
                $("#txtNgaySinh1").val(this.value);
            }
        });
        $('#txtSoDienThoai').on('change', function () {
            if (window.isMasterTab == 0) {
                if (window.TempTab.length > 0) {
                    window.TempTab[window.indexTab].txtSoDienThoai = this.value;
                }
                $("#txtSoDienThoai1").val(this.value);
            }
        });
        $('#txtEmailCustomer').on('change', function () {
            if (window.isMasterTab == 0) {
                if (window.TempTab.length > 0) {
                    window.TempTab[window.indexTab].txtEmailCustomer = this.value;
                }
                $("#txtEmailCustomer1").val(this.value);
            }
        });
        $('#txtDiaChiCustomer').on('change', function () {
            if (window.isMasterTab == 0) {
                if (window.TempTab.length > 0) {
                    window.TempTab[window.indexTab].txtDiaChiCustomer = this.value;
                }
                $("#txtDiaChiCustomer1").val(this.value);
            }
        });
        $('#cb_quan').on('change', function () {
            if (window.isMasterTab == 0) {
                if (window.TempTab.length > 0) {
                    window.TempTab[window.indexTab].cb_quan = this.value;
                }
                $("#cb_quan1 option[value=" + this.value + "]").attr('selected', 'selected');
            }
        });

        $('#txtHoTen1').on('change', function () {
            if (window.TempTab.length > 0) {
                window.TempTab[window.indexTab].txtHoTen = this.value;
            }
        });
        $('#txtNgaySinh1').on('change', function () {
            if (window.TempTab.length > 0) {
                window.TempTab[window.indexTab].txtNgaySinh = this.value;
            }
        });
        $('#txtSoDienThoai1').on('change', function () {
            if (window.TempTab.length > 0) {
                window.TempTab[window.indexTab].txtSoDienThoai = this.value;
            }
        });
        $('#txtEmailCustomer1').on('change', function () {
            if (window.TempTab.length > 0) {
                window.TempTab[window.indexTab].txtEmailCustomer = this.value;
            }
        });
        $('#txtDiaChiCustomer1').on('change', function () {
            if (window.TempTab.length > 0) {
                window.TempTab[window.indexTab].txtDiaChiCustomer = this.value;
            }
        });
        $('#cb_quan1').on('change', function () {
            if (window.TempTab.length > 0) {
                window.TempTab[window.indexTab].cb_quan = this.value;
            }
        });
        $('#txtSoDienThoai').on('change', function () {
            var formCustomer = new FormData();
            var json = { 'PhoneNumber': this.value };
            formCustomer.append('type', 'getDataByPhoneNumber');
            formCustomer.append('data', JSON.stringify(json));
            $.ajax({
                url: "/SysCustomer/getDataByPhoneNumber",
                type: "POST",
                data: formCustomer,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    if (jsonData && jsonData.length > 0) {
                        var objectData = jsonData[0];
                        $('#txtMaKH').val("KH" + (objectData.ID < 10 ? ('0' + objectData.ID.toString()) : objectData.ID.toString()));
                        $('#txtHoTen').val(objectData.CustomerName);
                        $('#txtNgaySinh').val(formatDateTime(objectData.BirthDay));
                        document.getElementById('txtEmailCustomer').value = objectData.Email;
                        document.getElementById('txtDiaChiCustomer').value = objectData.Address;
                        $("#cb_quan option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');
                        if (window.isMasterTab == 0) {
                            if (window.TempTab.length > 0) {
                                window.TempTab[0].cb_quan = objectData.MaQuan;
                                window.TempTab[0].txtMaKH = $('#txtMaKH').val();
                                window.TempTab[0].txtHoTen = $('#txtHoTen').val();
                                window.TempTab[0].txtNgaySinh = $('#txtNgaySinh').val();
                                window.TempTab[0].txtEmailCustomer = $('#txtEmailCustomer').val();
                                window.TempTab[0].txtDiaChiCustomer = $('#txtDiaChiCustomer').val();
                            }
                            $("#txtMaKH1").val($('#txtMaKH').val());
                            $("#txtHoTen1").val($('#txtHoTen').val());
                            $("#txtNgaySinh1").val($('#txtNgaySinh').val());
                            $("#txtEmailCustomer1").val($('#txtEmailCustomer').val());
                            $("#txtDiaChiCustomer1").val($('#txtDiaChiCustomer').val());
                            $("#cb_quan1 option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');
                        }
                    }
                    /*
                else {
                    $('#txtMaKH').val('');
                    $('#txtHoTen').val('');
                    $('#txtNgaySinh').val('');
                    document.getElementById('txtEmailCustomer').value = '';
                    document.getElementById('txtDiaChiCustomer').value = '';
                }*/
                },
                error: function (err) {

                }
            });
        });
        $('#txtSoDienThoai1').on('change', function () {
            var formCustomer = new FormData();
            var json = { 'PhoneNumber': this.value };
            formCustomer.append('type', 'getDataByPhoneNumber');
            formCustomer.append('data', JSON.stringify(json));
            $.ajax({
                url: "/SysCustomer/getDataByPhoneNumber",
                type: "POST",
                data: formCustomer,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    if (jsonData && jsonData.length > 0) {
                        var objectData = jsonData[0];
                        $('#txtMaKH1').val("KH" + (objectData.ID < 10 ? ('0' + objectData.ID.toString()) : objectData.ID.toString()));
                        $('#txtHoTen1').val(objectData.CustomerName);
                        $('#txtNgaySinh1').val(formatDateTime(objectData.BirthDay));
                        document.getElementById('txtEmailCustomer1').value = objectData.Email;
                        document.getElementById('txtDiaChiCustomer1').value = objectData.Address;
                        $("#cb_quan1 option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');
                        window.TempTab[window.indexTab].cb_quan = objectData.MaQuan;
                        window.TempTab[window.indexTab].txtMaKH = $('#txtMaKH1').val();
                        window.TempTab[window.indexTab].txtHoTen = $('#txtHoTen1').val();
                        window.TempTab[window.indexTab].txtNgaySinh = $('#txtNgaySinh1').val();
                        window.TempTab[window.indexTab].txtEmailCustomer = $('#txtEmailCustomer1').val();
                        window.TempTab[window.indexTab].txtDiaChiCustomer = $('#txtDiaChiCustomer1').val();
                    }
                    /*
                else {
                    $('#txtMaKH1').val('');
                    $('#txtHoTen1').val('');
                    $('#txtNgaySinh1').val('');
                    document.getElementById('txtEmailCustomer1').value = '';
                    document.getElementById('txtDiaChiCustomer1').value = '';
                }*/
                },
                error: function (err) {

                }
            });
        });

        $('#txtEmailCustomer').on('change', function () {
            var formCustomer = new FormData();
            var json = { 'Email': this.value };
            formCustomer.append('type', 'getDataByEmail');
            formCustomer.append('data', JSON.stringify(json));
            $.ajax({
                url: "/SysCustomer/getDataByEmail",
                type: "POST",
                data: formCustomer,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    if (jsonData && jsonData.length > 0) {
                        var objectData = jsonData[0];
                        $('#txtMaKH').val("KH" + (objectData.ID < 10 ? ('0' + objectData.ID.toString()) : objectData.ID.toString()));
                        $('#txtHoTen').val(objectData.CustomerName);
                        $('#txtNgaySinh').val(formatDateTime(objectData.BirthDay));
                        document.getElementById('txtSoDienThoai').value = objectData.PhoneNumber;
                        document.getElementById('txtDiaChiCustomer').value = objectData.Address;
                        $("#cb_quan option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');
                        if (window.isMasterTab == 0) {
                            if (window.TempTab.length > 0) {
                                window.TempTab[0].cb_quan = objectData.MaQuan;
                                window.TempTab[0].txtMaKH = $('#txtMaKH').val();
                                window.TempTab[0].txtHoTen = $('#txtNgaySinh').val();
                                window.TempTab[0].txtNgaySinh = $('#txtEmailCustomer').val();
                                window.TempTab[0].txtDiaChiCustomer = $('#txtDiaChiCustomer').val();
                                window.TempTab[0].txtSoDienThoai = $('#txtSoDienThoai').val();
                            }
                            $("#txtMaKH1").val($('#txtMaKH').val());
                            $("#txtHoTen1").val($('#txtHoTen').val());
                            $("#txtNgaySinh1").val($('#txtNgaySinh').val());
                            $("#txtSoDienThoai1").val($('#txtSoDienThoai').val());
                            $("#txtDiaChiCustomer1").val($('#txtDiaChiCustomer').val());
                            $("#cb_quan1 option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');
                        }

                    } else {
                        /*
                        $('#txtMaKH').val('');
                        $('#txtHoTen').val('');
                        $('#txtNgaySinh').val('');
                        document.getElementById('txtSoDienThoai').value = '';
                        document.getElementById('txtDiaChiCustomer').value = '';*/
                    }
                },
                error: function (err) {

                }
            });
        });
        $('#txtEmailCustomer1').on('change', function () {
            var formCustomer = new FormData();
            var json = { 'Email': this.value };
            formCustomer.append('type', 'getDataByEmail');
            formCustomer.append('data', JSON.stringify(json));
            $.ajax({
                url: "/SysCustomer/getDataByEmail",
                type: "POST",
                data: formCustomer,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    if (jsonData && jsonData.length > 0) {
                        var objectData = jsonData[0];
                        $('#txtMaKH1').val("KH" + (objectData.ID < 10 ? ('0' + objectData.ID.toString()) : objectData.ID.toString()));
                        $('#txtHoTen1').val(objectData.CustomerName);
                        $('#txtNgaySinh1').val(formatDateTime(objectData.BirthDay));
                        document.getElementById('txtSoDienThoai1').value = objectData.PhoneNumber;
                        document.getElementById('txtDiaChiCustomer1').value = objectData.Address;
                        $("#cb_quan1 option[value=" + objectData.MaQuan + "]").attr('selected', 'selected');
                    } else {
                        /*
                        $('#txtMaKH1').val('');
                        $('#txtHoTen1').val('');
                        $('#txtNgaySinh1').val('');
                        document.getElementById('txtSoDienThoai1').value = '';
                        document.getElementById('txtDiaChiCustomer1').value = '';*/
                    }
                },
                error: function (err) {

                }
            });
        });
    };
    // Onchange Ship
    $('#txt_PhiShip').on('change', function () {
        $("#txt_PhiShip").val(formatterThousandDelimiter(this.value));
    });
    // event add Hoa Don
    function hiddenInfoKH() {
        $("#div_cb_OrderType2").css("display", "block");
        $("#lbLoaiGoi").css("display", "block");
        $("#div_PhiShip").css("display", "none");
        $("#lblPhiShip").css("display", "none");
    };
    function addHoaDon() {
        $('#btnAddBill').click(function (e) {
            e.preventDefault();
            index++;
            $('.tab-toggle').length !== maxTabs ||
                $('#tabs').append($.tmpl(dropTemp))
                .find('#drop').append($('.li-tab-toggle:last').removeClass('active'));

            $.tmpl(navTemp, { "device": index }).insertAfter('.li-tab-toggle:last');
            $.tmpl(tabTemp, { "device": index }).appendTo('.tab-content');
            $('.li-tab-toggle:last a').tab('show');
            lstTable.push({ 'lst': [] });
            x = document.getElementById('chkCheckBox');
            x.checked = false;
            window.TempTab.push({ 'txtHoTen': '', 'txtNgaySinh': '', 'txtSoDienThoai': '', 'txtEmailCustomer': '', 'txtDiaChiCustomer': '', 'cb_quan': '' });
            resetTab();
            updateTabs();
        });

        $(document).on('click', '.btnRmv', function (e) {
            var tabs = $('.li-tab-toggle').length,
                nav = $('.li-tab-toggle.active');

            nav.parent('#tabs').find('#drop li:first').insertBefore('#tabs .dropdown');
            tabs !== maxTabs + 1 || $('#drop li').insertBefore('#tabs .dropdown').siblings('.dropdown').remove();

            $('a', nav.is('li:last') ? nav.prev() : nav.next()).tab('show');
            nav.add($('a', nav).attr('href')).remove();
            lstTable.splice(lstTable.length - 1);

            updateTabs();
        });

        function updateTabs() {
            for (var i = 0; i < $('.tab-toggle').length; i++) {
                var index = i + 1;
                var strIndex = (index < 10 ? "00" + index : "0" + index);
                $('.tab-toggle:eq(' + i + ') .dev-nr, .tab-pane:eq(' + i + ') .dev-nr').text(strIndex);
                $('.tab-toggle:eq(' + i + ')').attr("id", i);
            }
            window.indexTab = $('.tab-toggle').length - 1;
            updateComponent($('.tab-toggle').length - 1);
        }

        $('#tabs').click('tabsselect', function (event, ui) {
            var index = event.toElement.id;
            if (index == "tabs" || index == "") {
                // Không làm gì hết !
            } else {
                $("#txtMaKH1").val(window.TempTab[parseInt(parseInt(index))].txtMaKH);
                $("#txtHoTen1").val(window.TempTab[parseInt(parseInt(index))].txtHoTen);
                $("#txtNgaySinh1").val(window.TempTab[parseInt(parseInt(index))].txtNgaySinh);
                $("#txtSoDienThoai1").val(window.TempTab[parseInt(parseInt(index))].txtSoDienThoai);
                $("#txtDiaChiCustomer1").val(window.TempTab[parseInt(parseInt(index))].txtDiaChiCustomer);
                $("#txtEmailCustomer1").val(window.TempTab[parseInt(parseInt(index))].txtEmailCustomer);
                $("#cb_quan1 option[value=" + window.TempTab[parseInt(parseInt(index))].cb_quan + "]").attr('selected', 'selected');
                x = document.getElementById('chkCheckBox');
                if (window.isMasterTab == index) {
                    x.checked = true;
                } else {
                    x.checked = false;
                }
                window.indexTab = parseInt(index);
                updateComponent(parseInt(index));
            }

        });


    };
    // format Money
    function formatterThousandDelimiter(num) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    // Check Khách hàng Tab có dữ liệu hay không
    function resetTab() {
        $("#txtMaKH1").val("");
        $("#txtHoTen1").val("");
        $("#txtNgaySinh1").val("");
        $("#txtSoDienThoai1").val("");
        $("#txtEmailCustomer1").val("");
        $("#txtDiaChiCustomer1").val("");
        $("#cb_OrderType option[value= -1]").attr('selected', 'selected');
        $("#cb_OrderType2 option[value= -1]").attr('selected', 'selected');
        $("#cb_PayType option[value= -1]").attr('selected', 'selected');
        $("#cb_hinhthucShip option[value= -1]").attr('selected', 'selected');
        $("#txt_PhiShip").val("");
        $('#txt_PhiShip').removeAttr('disabled');
    }
    /************************************************
    ******** Hóa đơn Grid
    ************************************************/
    // Init Component in 1 Tab
    function initComponent(index) {
        initGridChiTietDonHang();
        loadDataGridChiTietDonHang(index);
        loadDataCustomer();
        if (window.indexTab <= 0) {
            eventAddChiTietDonHang();
        }
    };
    // Init GridChiTietDonHang  in 1 Tab
    function initGridChiTietDonHang() {
        $('#table').bootstrapTable({
            columns: [
                {
                    field: 'fSTT',
                    title: 'STT',
                    align: 'center',
                    valign: 'middle',
                },
                {
                    field: 'fLoaiHinhDon',
                    title: 'Loại hình đơn',
                    align: 'center',
                    valign: 'middle',
                    events: window.typeBillEvents = {
                        'click .product': function (e, value, row, index) {
                            eventLinkPopup(e, value, row, index);
                        }
                    },
                    formatter: billFormatter
                },
                {
                    field: 'fLoaiGoi',
                    title: 'Loại gói',
                    align: 'center',
                    valign: 'middle',

                },
                {
                    field: 'fPhiShip',
                    title: 'Phí Ship',
                    align: 'center',
                    valign: 'middle',
                },
                {
                    field: 'fLoaiThanhToan',
                    title: 'Loại thanh toán',
                    align: 'center',
                    valign: 'middle',
                    fontWeight: 'bold'
                },
                {
                    field: 'fThanhTien',
                    title: 'Thành tiền',
                    align: 'center',
                    valign: 'middle',
                    editable: false,
                },
                {
                    field: 'fThaoTac',
                    title: 'Thao tác',
                    align: 'center',
                    valign: 'middle',
                    events: window.operateEvents = {
                        'click .remove': function (e, value, row, index) {
                            $('#table').bootstrapTable('remove', {
                                field: 'fSTT',
                                values: [row.fSTT]
                            });
                            var txtSoNgayConLai = $("#txtSoNgayConLai").val();
                            var soNgayGoi = row.soNgayGoi;
                            var total = Number(txtSoNgayConLai) - Number(soNgayGoi);
                            $("#txtSoNgayConLai").val(total);
                        }
                    },
                    formatter: operateFormatter

                }
            ],
            data: []
        });


    };
    // Format Field Grid
    function operateFormatter(value, row, index) {
        return [
             '<a class="remove" href="javascript:void(0)" title="Xoá">',
            '<i class="glyphicon glyphicon-remove"></i>',
            '</a>',
        ].join('');
    }
    // Format Field Grid
    function billFormatter(value, row, index) {
        return [
            '<a class="product" href="javascript:void(0)" title="Thông tin gói">',
                value,
            '</a>',
        ].join('');
    }
    // Update updateComponent
    function updateComponent(index) {
        initComponent(index);
    };
    function loadDataGridChiTietDonHang(index) {
        $table = $('#table');
        if (window.dataGlobal.length > 0) {
            var check = false;
            for (var i = 0 ; i < window.dataGlobal.length ; i++) {
                if (window.dataGlobal[i].tabIndex == window.indexTab) {
                    $table.bootstrapTable('load', window.dataGlobal[i].data);
                    check = true;
                    break;
                }
            }
            if (!check) {
                $table.bootstrapTable('load', []);
            }
        } else {
            $table.bootstrapTable('load', []);
        }
    };
    function loadDataCustomer() {
        if (window.dataGlobal.length > 0) {
            var check = false;
            var infoKH = null;
            for (var i = 0 ; i < window.dataGlobal.length ; i++) {
                if (window.dataGlobal[i].tabIndex == window.indexTab) {
                    //$table.bootstrapTable('load', window.dataGlobal[i].data);
                    check = true;
                    infoKH = window.dataGlobal[i].infoKH;
                    $('#txtMaKH1').val(infoKH.maKH);
                    $('#txtHoTen1').val(infoKH.hoTen);
                    $('#txtNgaySinh1').val(formatDateTime(infoKH.ngaySinh));
                    $('#txtSoDienThoai1').val(infoKH.soDienThoai)
                    document.getElementById('txtEmailCustomer1').value = infoKH.email;
                    document.getElementById('txtDiaChiCustomer1').value = infoKH.diaChi;
                    $("#cb_quan1 option[value=" + objectData.maquan + "]").attr('selected', 'selected');
                    $("#chkCheckBox").attr('checked', window.dataGlobal[i].isMaster);
                    break;
                }
            }

        } else {
            //$table.bootstrapTable('load', []);
        }
    };
    function eventAddChiTietDonHang(index) {
        //$("#div_PhiShip").css("dedplay", "none");
        // onchage select box
        $('#cb_OrderType').on('change', function () {
            if (this.value == "1") {
                $('#txt_PhiShip').attr('disabled', 'disabled');
                $('#txt_PhiShip').val("");
                $("#cb_OrderType2").removeAttr('disabled');
            } else {
                $("#cb_OrderType2 option[value=-1]").attr('selected', 'selected');
                $("#cb_OrderType2").attr("disabled", "disabled");
                $('#txt_PhiShip').removeAttr('disabled');
            }
        });
        $('#cb_hinhthucShip').on('change', function () {
            if (this.value == "Ship đi") {
                if ($('#cb_OrderType').val() != "1") {
                    $('#txt_PhiShip').removeAttr('disabled');
                }
            } else {
                $('#txt_PhiShip').val("0");
            }
        });


    };
    function parseStringToDate(value) {
        var x = value.substr(0, 10);
        var y = x.split("-");
        var y1 = y[0];
        var y2 = y[1];
        var y3 = y[2];
        z = y3 + "/" + y2 + "/" + y1;
        return z;
    };
    $('#btnAdd').on('click', function () {
        var $table = $('#table');
        //$table.bootstrapTable('insertRow', { index: 1, row: row });
        var obj = {};
        var check = true;
        if ($('#cb_OrderType').val() == -1) {
            bootbox.alert({
                message: "Vui lòng chọn loại hình đơn !",
                size: 'small'
            });
            check = false;
            return;
        }
        if ($('#cb_billType').val() != -1) {
            if ($('#cb_OrderType').val() == 1) {
                if ($('#cb_OrderType2').val() == -1) {
                    bootbox.alert({
                        message: "Vui lòng chọn loại gói !",
                        size: 'small'
                    });
                    check = false;
                    return;
                }
            } else if ($('#cb_OrderType').val() == 2) {
                if ($('#txt_PhiShip').val() == "") {
                    bootbox.alert({
                        message: "Vui lòng nhập phí ship !",
                        size: 'small'
                    });
                    check = false;
                    return;
                }
            }
        }
        if ($('#cb_PayType').val() == -1) {
            bootbox.alert({
                message: "Vui lòng chọn hình thức thanh toán !",
                size: 'small'
            });
            check = false;
            return;
        }
        if ($('#txtSoDienThoai1').val() == "") {
            bootbox.alert({
                message: "Bạn chưa nhập thông tin khách hàng cho đơn !",
                size: 'small'
            });
            check = false;
            return;
        }

        if (check) {
            var data = $table.bootstrapTable('getData');
            obj.fSTT = data.length + 1;
            obj.fLoaiHinhDon = $('#cb_OrderType :selected').text();
            obj.fLoaiHinhDonId = $('#cb_OrderType').val();
            obj.fHinhThucShip = $('#cb_hinhthucShip').val();
            if (obj.fLoaiHinhDonId == 1) {
                obj.fLoaiGoi = $('#cb_OrderType2 :selected').text();
                obj.fLoaiGoiId = $('#cb_OrderType2').val();
                obj.fPhiShip = "0";
                obj.fPromotionCode = "0";
                for (var k = 0; k < window.dataGoi.length ; k++) {
                    if (window.dataGoi[k].Name.trim() == obj.fLoaiGoi.trim()) {
                        obj.fThanhTien = window.dataGoi[k].Tien.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                        obj.IDGoi = window.dataGoi[k].ID;
                        window.tenGoi = window.dataGoi[k].Name;
                        window.tienGoi = window.dataGoi[k].Tien.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                        break;
                    }
                }
            } else {
                obj.fLoaiGoi = "....";
                obj.fLoaiGoiId = 1;
                obj.fPhiShip = $('#txt_PhiShip').val().toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.") + " VNĐ";
                obj.fThanhTien = "0";
                obj.fPromotionCode = "0";
            }

            obj.fLoaiThanhToan = $('#cb_PayType :selected').text();
            obj.fLoaiThanhToanId = $('#cb_PayType').val();

            obj.detalMaster = [];
            if ($('#cb_OrderType :selected').text() == 'Gói') {
                var songayconlai = $('#txtSoNgayConLai').val() != "" ? $('#txtSoNgayConLai').val() : '0'
                songayconlai = Number(songayconlai) + parseInt($('#cb_OrderType2').val());
                obj.soNgayGoi = parseInt($('#cb_OrderType2').val());
                $('#txtSoNgayConLai').val(songayconlai);
            } else {
                var songayconlai = $('#txtSoNgayConLai').val() != "" ? $('#txtSoNgayConLai').val() : '0';
                songayconlai = Number(songayconlai) + 1;
                obj.soNgayGoi = 1;
                $('#txtSoNgayConLai').val(songayconlai);
            }
            var infoKHPackage = {};
            infoKHPackage.maKH = $('#txtMaKH1').val();
            infoKHPackage.hoTen = $('#txtHoTen1').val();
            infoKHPackage.ngaySinh = $('#txtNgaySinh1').val();
            infoKHPackage.soDienThoai = $('#txtSoDienThoai1').val();
            infoKHPackage.soDienThoai = document.getElementById('txtSoDienThoai1').value;
            infoKHPackage.email = document.getElementById('txtEmailCustomer1').value;
            infoKHPackage.diaChi = document.getElementById('txtDiaChiCustomer1').value;
            infoKHPackage.maquan = $('#cb_quan1').val();
            infoKHPackage.billId = 0;
            obj.infoKH = infoKHPackage;
            //Harcode
            if (window.dataGlobal.length > 0) {
                var check = false;
                for (var i = 0; i < window.dataGlobal.length ; i++) {
                    if (window.dataGlobal[i].tabIndex == window.indexTab) {
                        obj.billId = window.dataGlobal[i].data.length;
                        window.dataGlobal[i].data.push(obj);
                        $table.bootstrapTable('load', window.dataGlobal[i].data);
                        check = true;
                        break;
                    }
                }
                if (!check) {
                    var infoKH = {};
                    if (window.indexTab == 0) {
                        infoKH.maKH = $('#txtMaKH').val();
                        infoKH.hoTen = $('#txtHoTen').val();
                        infoKH.ngaySinh = $('#txtNgaySinh').val();
                        infoKH.soDienThoai = $('#txtSoDienThoai').val();
                        infoKH.soDienThoai = document.getElementById('txtSoDienThoai').value;
                        infoKH.email = document.getElementById('txtEmailCustomer').value;
                        infoKH.diaChi = document.getElementById('txtDiaChiCustomer').value;
                        infoKH.maquan = $('#cb_quan').val();
                        infoKH.billId = 0;
                    } else {
                        infoKH.maKH = $('#txtMaKH1').val();
                        infoKH.hoTen = $('#txtHoTen1').val();
                        infoKH.ngaySinh = $('#txtNgaySinh1').val();
                        infoKH.soDienThoai = $('#txtSoDienThoai1').val();
                        infoKH.soDienThoai = document.getElementById('txtSoDienThoai1').value;
                        infoKH.email = document.getElementById('txtEmailCustomer1').value;
                        infoKH.diaChi = document.getElementById('txtDiaChiCustomer1').value;
                        infoKH.maquan = $('#cb_quan1').val();
                        infoKH.billId = 0;
                    }
                    window.dataGlobal.push({ 'tabIndex': window.indexTab, 'data': [obj], 'infoKH': infoKH, 'isMaster': window.indexTab == 0 ? true : false });
                    $table.bootstrapTable('append', [obj]);
                }
            } else {
                obj.billId = 0;
                var infoKH = {};
                if (window.indexTab == 0) {
                    infoKH.maKH = $('#txtMaKH').val();
                    infoKH.hoTen = $('#txtHoTen').val();
                    infoKH.ngaySinh = $('#txtNgaySinh').val();
                    infoKH.soDienThoai = $('#txtSoDienThoai').val();
                    infoKH.soDienThoai = document.getElementById('txtSoDienThoai').value;
                    infoKH.email = document.getElementById('txtEmailCustomer').value;
                    infoKH.diaChi = document.getElementById('txtDiaChiCustomer').value;
                    infoKH.maquan = $('#cb_quan').val();
                    infoKH.billId = 0;
                } else {
                    infoKH.maKH = $('#txtMaKH1').val();
                    infoKH.hoTen = $('#txtHoTen1').val();
                    infoKH.ngaySinh = $('#txtNgaySinh1').val();
                    infoKH.soDienThoai = $('#txtSoDienThoai1').val();
                    infoKH.soDienThoai = document.getElementById('txtSoDienThoai1').value;
                    infoKH.email = document.getElementById('txtEmailCustomer1').value;
                    infoKH.diaChi = document.getElementById('txtDiaChiCustomer1').value;
                    infoKH.maquan = $('#cb_quan1').val();
                    infoKH.billId = 0;
                }
                window.dataGlobal.push({ 'tabIndex': window.indexTab, 'data': [obj], 'infoKH': infoKH, 'isMaster': $("#chkCheckBox").prop('checked') });
                $table.bootstrapTable('append', [obj]);
            }
            //$table.bootstrapTable('insertRow', { index: obj.stt, row: obj });

        }
    });
    function eventLinkPopup(e, value, row, index) {
        if (row.fLoaiHinhDonId == 1) { // Gói
            var $table = $('#tablePopup');
            initTablePopup();
            var dataTabIndex = [];
            var dataTemp = [];
            for (var i = 0; i < window.dataGlobal.length ; i++) {
                if (window.dataGlobal[i].tabIndex == window.indexTab) {
                    dataTabIndex = window.dataGlobal[i].data;
                    break;
                }
            }
            if (dataTabIndex.length > 0) {
                for (var k = 0; k < dataTabIndex.length ; k++) {
                    if (dataTabIndex[k].billId == row.billId) {
                        dataTemp = dataTabIndex[k].detalMaster;
                        break;
                    }
                }
            }

            if (dataTemp.length > 0) {
                $table.bootstrapTable('load', dataTemp);
            } else {
                var dataTemp = [];
                var n = row.fLoaiGoiId;
                var tien = 0;
                //var idGoi = 0;
                window.indexGoi = row.billId;
                for (var m = 0; m < n; m++) {
                    var index = m + 1;
                    var obj = {};

                    obj.id = index;
                    obj.parent = true;
                    obj.parentBillId = row.billId;
                    obj.parentId = -1;
                    obj.deliveryDate = '';
                    obj.product = '';
                    obj.productName = '';
                    obj.sugar = true;
                    obj.quantity = '';
                    obj.price = '';
                    obj.money = '';
                    obj.promotionCode = '';
                    obj.total = '';
                    obj.test = '';
                    obj.operate = '1';
                    obj.thugiaohang = '';
                    obj.note = '';
                    dataTemp.push(obj);
                }
                $table.bootstrapTable('load', dataTemp);

            }
            $('#txtTotalTienGoi').val(window.tienGoi.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
            $('#txtPromotionCode').val(row.fPromotionCode);
            if ($('#txtPromotionCode').val() != "") {
                var formpromotionCode = new FormData();
                var json = { 'Code': $('#txtPromotionCode').val() };
                formpromotionCode.append('type', 'getDataByPromotionCode');
                formpromotionCode.append('data', JSON.stringify(json));
                $.ajax({
                    url: "/SysPromotion/getDataByPromotionCode",
                    type: "POST",
                    data: formpromotionCode,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        var jsonData = result;
                        var arr = [];
                        var total = $('#txtTotalTienGoi').val().toString().split('.').join('');
                        if (jsonData && jsonData.length > 0) {
                            var objectData = jsonData[0];
                            var percent = Number(objectData.Amount_VND);
                            total = total == "" ? Number('0') : Number(total);
                            $('#txtTienKM').val(percent.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
                            $('#txtTotalTienGoiSauKM').val((total - (percent)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
                        } else {
                            $('#txtTienKM').val(0);
                            $('#txtTotalTienGoiSauKM').val(total.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
                        }
                    },
                    error: function (err) {

                    }
                });
            } else {
                $('#txtTienKM').val(0);
                $('#txtTotalTienGoiSauKM').val($('#txtTotalTienGoi').val().toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
            }
            $('#modalTable').modal('show');
            disableEditableTable();
        } else if (row.fLoaiHinhDonId == 2) { // Lẻ
            var $table = $('#tablePopupSingle');
            $('#dvHidden').css({ 'display': 'block' });
            initTableSinglePopup();
            var dataTemp = [];
            var objCustomer = {};
            var dataTabIndex = [];
            for (var i = 0; i < window.dataGlobal.length ; i++) {
                if (window.dataGlobal[i].tabIndex == window.indexTab) {
                    dataTabIndex = window.dataGlobal[i].data;
                    break;
                }
            }
            if (dataTabIndex.length > 0) {
                for (var k = 0; k < dataTabIndex.length ; k++) {
                    if (dataTabIndex[k].billId == row.billId) {
                        dataTemp = dataTabIndex[k].detalMaster;
                        objCustomer = dataTabIndex[k].detalCustomer;
                        break;
                    }
                }
            }

            if (objCustomer) {
                $('#txtHoTenPopUp').val(objCustomer.name);
                $('#txtSoDienThoaiPopUp').val(objCustomer.phone);
                $('#txtDiaChiPopUp').val(objCustomer.address);
                $('#txtDeliveryPopup').val(objCustomer.delivery);
            }
            if (dataTemp.length > 0) {
                window.rowTemp = row;
                $table.bootstrapTable('load', dataTemp);
            } else {
                window.rowTemp = row;
                var dataTemp = [];
                $table.bootstrapTable('load', dataTemp);
            }
            $('#modalTableSingle').modal('show');

        }

    };
    /************************************************
    ******** Popup Hóa đơn gói Grid
    ************************************************/
    function initTablePopup() {
        var $table = $('#tablePopup');
        $('#tablePopup').bootstrapTable({
            columns: [{
                field: 'id',
                title: 'STT',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'deliveryDate',
                title: 'Ngày giao hàng',
                align: 'center',
                valign: 'middle',
                style: 'font-weight: bold',
                fontWeight: 'bold',
                editable: function (value, row, index) {
                    if (row.operate == -1) {
                        return false;
                    } else {
                        return true;
                    }
                },
                formatter: function (value, row, index) {
                    if (row.operate == -1) {
                        return '';
                    } else {
                        if (value == "") {
                            return ""
                        } else {
                            return value;
                        }
                    }
                }

            },
            {
                field: 'thugiaohang',
                title: 'Thứ giao hàng',
                align: 'center',
                valign: 'middle',
            },
            {
                field: 'product',
                title: 'Mã Sản phẩm',
                align: 'center',
                valign: 'middle',
                editable: true
            },
            {
                field: 'productName',
                title: ' Tên Sản phẩm',
                align: 'center',
                valign: 'middle'
            },
            {
                field: 'note',
                title: 'Ghi chú',
                align: 'center',
                valign: 'middle',
                editable: true,
            },
            {
                field: 'quantity',
                title: 'Số lượng',
                align: 'center',
                valign: 'middle',
                editable: true
            },
            {
                field: 'sugar',
                title: 'Sugar',
                align: 'center',
                valign: 'middle',
                checkbox: true
            },
            {
                field: 'operate',
                title: 'Thao tác',
                align: 'center',
                valign: 'middle',
                events: window.operateEventsPopup = {
                    'click .remove': function (e, value, row, index) {
                        operateEventsPopup(e, value, row, index);
                    }
                },
                formatter: operateFormatterPopup

            }],
            data: []
        });
        $table.on('check.bs.table', function (e, field, row, old, $el) {
            var x = "1";
        });
        $table.on('editable-save.bs.table', function (e, field, row, old, $el) {
            var $els = $table.find('.editable');
            next = $els.index($el) + 1;

            if (field == "deliveryDate") {
                var deliveryDate = row.deliveryDate;
                if (deliveryDate == "") {
                    row.thugiaohang = "";
                    row.deliveryDate = "";
                } else {
                    if (deliveryDate.split('/').length == 1) {

                    } else if (deliveryDate.split('/').length == 2) {
                        var x = new Date();
                        deliveryDate = deliveryDate + "/" + x.getFullYear();
                        row.thugiaohang = convertDateToDay(deliveryDate);
                        row.deliveryDate = deliveryDate;
                    } else {
                        row.thugiaohang = convertDateToDay(deliveryDate);
                        row.deliveryDate = deliveryDate;
                    }
                }
                $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                disableEditableTable();
            }
            if (field == "note") {
                $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                disableEditableTable();
            }
            if (field == "product") {
                var formProduct = new FormData();
                var json = { 'Product_Code': row[field] };
                formProduct.append('type', 'getDataByProductCode');
                formProduct.append('data', JSON.stringify(json));
                $.ajax({
                    url: "/SysProduct/getDataByProductCode",
                    type: "POST",
                    data: formProduct,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        var jsonData = result;
                        var arr = [];
                        if (jsonData && jsonData.length > 0) {
                            var objectData = jsonData[0];
                            var quantity = 1;
                            row.quantity = 1;
                            row.productName = objectData.Product_Name;
                            var price = objectData.Product_Amount.toString().split('.').join('');
                            row.price = price.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                            row.money = (quantity * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                            row.total = (quantity * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                            $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                            disableEditableTable();
                        } else {
                            row.productName = "";
                            row.quantity = "";
                            row.price = "";
                            row.money = "";
                            row.total = "";
                            $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                            disableEditableTable();
                        }
                    },
                    error: function (err) {

                    }
                });
            }
            if (field == "quantity") {
                var price = row.price.split('.').join('');
                row.money = (row[field] * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                row.total = (row[field] * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                disableEditableTable();
            }
            if (field == "promotionCode") {
                var formpromotionCode = new FormData();
                var json = { 'Code': row[field] };
                formpromotionCode.append('type', 'getDataByPromotionCode');
                formpromotionCode.append('data', JSON.stringify(json));
                $.ajax({
                    url: "/SysPromotion/getDataByPromotionCode",
                    type: "POST",
                    data: formpromotionCode,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        var jsonData = result;
                        var arr = [];
                        if (jsonData && jsonData.length > 0) {
                            var objectData = jsonData[0];
                            var percent = Number(objectData.Promotion_Percent) / 100;
                            var total = row.total.toString().split('.').join('');
                            total = total == "" ? Number('0') : Number(total);
                            row.total = (total - (total * percent)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                            $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                            disableEditableTable();
                        }
                    },
                    error: function (err) {

                    }
                });
            }

        });
    };
    $('#txtPromotionCode').on('change', function () {
        if ($('#txtPromotionCode').val() != "") {
            var formpromotionCode = new FormData();
            var json = { 'Code': $('#txtPromotionCode').val() };
            formpromotionCode.append('type', 'getDataByPromotionCode');
            formpromotionCode.append('data', JSON.stringify(json));
            $.ajax({
                url: "/SysPromotion/getDataByPromotionCode",
                type: "POST",
                data: formpromotionCode,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    var total = $('#txtTotalTienGoi').val().toString().split('.').join('');
                    if (jsonData && jsonData.length > 0) {
                        var objectData = jsonData[0];
                        var percent = Number(objectData.Amount_VND);
                        total = total == "" ? Number('0') : Number(total);
                        $('#txtTienKM').val(percent.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
                        $('#txtTotalTienGoiSauKM').val((total - (percent)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
                    } else {
                        $('#txtTienKM').val(0);
                        $('#txtTotalTienGoiSauKM').val(total.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
                    }
                },
                error: function (err) {

                }
            });
        } else {
            $('#txtTienKM').val(0);
            $('#txtTotalTienGoiSauKM').val($('#txtTotalTienGoi').val().toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
        }

    });
    function disableEditableTable() {
        var $table = $('#tablePopup');
        $tableRows = $table.find('tbody tr');
        tableData = $table.bootstrapTable('getData', true);
        var x = $('#tablePopup input[type=checkbox]');
        if (!window.hidden) {
            x[0].style.display = 'none';
            x[0].parentElement.innerText = "Đường";
            window.hidden = true;
        }
        $.each(tableData, function (i, row) {
            //that.$body.find('a[data-name="' + column.field + '"]').editable(column.editable)
            if (row.operate == "1") {
                x[i].style.display = 'none';
                $tableRows.eq(i).find('a[data-name="' + 'product' + '"]').editable('toggleDisabled');
                $tableRows.eq(i).find('a[data-name="' + 'quantity' + '"]').editable('toggleDisabled');
                //$tableRows.eq(i).find('a[data-name="' + 'promotionCode' + '"]').editable('toggleDisabled');
                $tableRows.eq(i).find('a[data-name="' + 'note' + '"]').editable('toggleDisabled');
            } else {
                $tableRows.eq(i).find('a[data-name="' + 'deliveryDate' + '"]').editable('toggleDisabled');
            }
        });
    };
    function operateEventsPopup(e, value, row, index) {
        var $table = $('#tablePopup');
        if (row.operate == "1") {
            var data = $table.bootstrapTable('getData');
            var dataTemp = [];
            var position = -1;
            var parendId = -1;
            var parentBillId = -1;
            for (var i = 0; i < data.length ; i++) {
                dataTemp.push(data[i]);
                if (data[i].id == row.id) {
                    position = i;
                    parendId = i;
                    parentBillId = row.parentBillId;
                    break;
                }
            }
            var obj = {};
            obj.id = -1; obj.parent = false; obj.deliveryDate = ''; obj.product = ''; obj.productName = '';
            obj.sugar = false; obj.quantity = ''; obj.price = ''; obj.money = ''; obj.promotionCode = '';
            obj.total = ''; obj.test = ''; obj.operate = '0';
            obj.parentBillId = parentBillId; obj.parentId = parendId + 1;
            obj.thugiaohang = ''; obj.note = '';
            dataTemp.push(obj);
            var k = position + 1;
            for (k ; k < data.length ; k++) {
                if (data[k].parendId && parentId == parentId) {
                    //NOT PUSH
                } else {
                    dataTemp.push(data[k]);
                }
            }
            for (var n = 0; n < dataTemp.length ; n++) {
                var m = n + 1;
                dataTemp[n].id = m;
            }
            $table.bootstrapTable('removeAll');
            $table.bootstrapTable('load', dataTemp);

        } else {
            $('#tablePopup').bootstrapTable('remove', {
                field: 'id',
                values: [row.id]
            });
            var data = $table.bootstrapTable('getData');
            for (var i = 0; i < data.length ; i++) {
                var k = i + 1;
                data[i].id = k;
            }
            $table.bootstrapTable('load', data);
        }
        disableEditableTable();
    }
    function operateFormatterPopup(value, row, index) {
        if (value == "1") {
            return [
             '<a class="remove" href="javascript:void(0)" title="Thêm mới">',
            '<i class="glyphicon glyphicon-plus-sign"></i>',
            '</a>',
            ].join('');
        } else {
            return [
              '<a class="remove" href="javascript:void(0)" title="delete">',
             '<i class="glyphicon glyphicon-remove"></i>',
             '</a>',
            ].join('');
        }

    }
    $('#btnPopup').on('click', function () {
        var $tablePopup = $('#tablePopup');
        var $table = $('#table');
        var dataPopup = $('#tablePopup').bootstrapTable('getData');
        var objCustomer = {};
        objCustomer.maKH = $("#txtMaKH1").val();
        objCustomer.hoTen = $("#txtHoTen1").val();
        objCustomer.ngaySinh = $("#txtNgaySinh1").val();
        objCustomer.soDienThoai = $("#txtSoDienThoai1").val();
        objCustomer.email = $("#txtEmailCustomer1").val();
        objCustomer.diaChi = $("#txtDiaChiCustomer1").val();
        objCustomer.maquan = $('#cb_quan1').val();
        if (dataPopup.length > 0) {
            /*
            var totalMoneyPopup = 0;
            for (var i = 0; i < dataPopup.length ; i++) {
                var thanhtien = dataPopup[i].total.split('.').join('');
                totalMoneyPopup += Number(thanhtien);
            }*/
            var total = 0;
            for (var m = 0; m < window.dataGlobal.length ; m++) {
                var check = false;
                if (window.dataGlobal[m].tabIndex == window.indexTab) {
                    check = true;
                }
                for (var k = 0; k < window.dataGlobal[m].data.length ; k++) {
                    if (check) {
                        if (window.dataGlobal[m].data[k].billId == dataPopup[0].parentBillId) {
                            window.dataGlobal[m].data[k].fThanhTien = $('#txtTotalTienGoiSauKM').val().toString().split('.').join('').replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                            window.dataGlobal[m].data[k].fPromotionCode = $('#txtPromotionCode').val();
                            window.dataGlobal[m].data[k].detalMaster = dataPopup;
                            window.dataGlobal[m].data[k].detailCustomer = objCustomer;
                            $table.bootstrapTable('updateRow', { index: window.dataGlobal[m].data[k].id - 1, row: window.dataGlobal[m].data[k] });
                        }
                    }
                    total += Number(window.dataGlobal[m].data[k].fThanhTien.split('.').join(''));
                }
            }
            $('#txtTong').val(total.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));

        }
    });

    /************************************************
    ******** Popup Hóa đơn lẻ Grid
    ************************************************/
    function initTableSinglePopup() {
        var $table = $('#tablePopupSingle');
        $('#tablePopupSingle').bootstrapTable({
            columns: [{
                field: 'id',
                title: 'STT',
                align: 'center',
                valign: 'middle',
            },
            {
                field: 'product',
                title: 'Mã Sản phẩm',
                align: 'center',
                valign: 'middle',
                editable: true
            },
            {
                field: 'productName',
                title: 'Tên Sản phẩm',
                align: 'center',
                valign: 'middle',
                editable: true
            },
            {
                field: 'note',
                title: 'Ghi chú',
                align: 'center',
                valign: 'middle',
                editable: true
            },
            {
                field: 'quantity',
                title: 'Số lượng',
                align: 'center',
                valign: 'middle',
                editable: true
            },
            {
                field: 'price',
                title: 'Giá sản phẩm',
                align: 'center',
                valign: 'middle'
            },
            {
                field: 'sugar',
                title: 'Đường',
                align: 'center',
                valign: 'middle',
                checkbox: true
            },
            {
                field: 'money',
                title: 'Thành tiền',
                align: 'center',
                valign: 'middle'
            },
            {
                field: 'promotionCode',
                title: 'Mã khuyến mại',
                align: 'center',
                valign: 'middle',
                editable: true
            },
            {
                field: 'total',
                title: 'Total',
                align: 'center',
                valign: 'middle'
            },

            {
                field: 'operate',
                title: 'Thao tác',
                align: 'center',
                valign: 'middle',
                events: window.operateEventsPopupSingle = {
                    'click .remove': function (e, value, row, index) {
                        var $table = $('#tablePopupSingle');
                        $('#tablePopupSingle').bootstrapTable('remove', {
                            field: 'id',
                            values: [row.id]
                        });
                    }
                },
                formatter: operateFormatterPopupSingle
            }],
            data: []
        });

        var x = $('#tablePopupSingle input[type=checkbox]');
        if (!window.hiddenSingle) {
            x[0].style.display = 'none';
            x[0].parentElement.innerText = "Đường";
            window.hiddenSingle = true;
        }
        $table.on('editable-save.bs.table', function (e, field, row, old, $el) {
            var $els = $table.find('.editable');
            next = $els.index($el) + 1;
            if (field == "product") {

                var formProduct = new FormData();
                var json = { 'Product_Code': row[field] };
                formProduct.append('type', 'getDataByProductCode');
                formProduct.append('data', JSON.stringify(json));
                $.ajax({
                    url: "/SysProduct/getDataByProductCode",
                    type: "POST",
                    data: formProduct,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        var jsonData = result;
                        var arr = [];
                        if (jsonData && jsonData.length > 0) {
                            var objectData = jsonData[0];
                            var quantity = 1;
                            row.quantity = 1;
                            row.productName = objectData.Product_Name;
                            var price = objectData.Product_Amount.toString().split('.').join('');
                            row.price = price.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                            row.money = (quantity * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                            row.total = (quantity * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                            $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                        } else {
                            row.quantity = "";
                            row.productName = "";
                            row.price = "";
                            row.money = "";
                            row.total = "";
                            $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                        }
                    },
                    error: function (err) {

                    }
                });
            }
            if (field == "quantity") {
                var price = row.price.split('.').join('');
                row.money = (row[field] * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                row.total = (row[field] * price).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
            }
            if (field == "note") {

            }
            if (field == "promotionCode") {
                var formpromotionCode = new FormData();
                var json = { 'Code': row[field] };
                formpromotionCode.append('type', 'getDataByPromotionCode');
                formpromotionCode.append('data', JSON.stringify(json));
                $.ajax({
                    url: "/SysPromotion/getDataByPromotionCode",
                    type: "POST",
                    data: formpromotionCode,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        var jsonData = result;
                        var arr = [];
                        if (jsonData && jsonData.length > 0) {
                            var objectData = jsonData[0];
                            var percent = Number(objectData.Amount_VND);
                            var total = row.total.toString().split('.').join('');
                            total = total == "" ? Number('0') : Number(total);
                            row.total = (total - (percent)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");

                            $table.bootstrapTable('updateRow', { index: row.id - 1, row: row });
                        }
                    },
                    error: function (err) {

                    }
                });
            }
        });
    };
    $('#txtNgayGiaoHangLe').on('change', function () {
        var dateNgaygiaoHangLe = this.value;
        if (dateNgaygiaoHangLe != "") {
            var x = new Date();
            if (dateNgaygiaoHangLe.split('/').length == 1) {

            } else if (dateNgaygiaoHangLe.split('/').length == 2) {
                dateNgaygiaoHangLe = dateNgaygiaoHangLe + "/" + x.getFullYear();
                $("#txtThuGiaoHangLe").val(convertDateToDay(dateNgaygiaoHangLe));
                $("#txtNgayGiaoHangLe").val(dateNgaygiaoHangLe);
            } else {
                $("#txtThuGiaoHangLe").val(convertDateToDay(dateNgaygiaoHangLe));
                $("#txtNgayGiaoHangLe").val(dateNgaygiaoHangLe);
            }

        } else {
            $("#txtNgayGiaoHangLe").val("");
        }
        

    });
    function convertDateToDay(num) {
        // var x = parseStringToDate(num);
        var x = num;
        x = x.split('/')[1] + "/" + x.split('/')[0] + "/" + x.split('/')[2];
        var date = new Date(x);
        var day = date.getDay();
        var strDay = "";
        switch (day) {
            case 0:
                strDay = "Chủ Nhật";
                break;
            case 1:
                strDay = "Thứ hai";
                break;
            case 2:
                strDay = "Thứ ba";
                break;
            case 3:
                strDay = "Thứ tư";
                break;
            case 4:
                strDay = "Thứ năm";
                break;
            case 5:
                strDay = "Thứ sáu";
                break;
            case 6:
                strDay = "Thứ bảy";
                break;
            case 7:
                strDay = "Chủ Nhật";
                break;
            default:
                break;
        }
        return strDay
    }
    function operateFormatterPopupSingle(value, row, index) {
        return [
            '<a class="remove" href="javascript:void(0)" title="delete">',
           '<i class="glyphicon glyphicon-remove"></i>',
           '</a>',
        ].join('');
    }
    $('#btnAddSingle').on('click', function () {
        var $table = $('#tablePopupSingle');
        var data = $('#tablePopupSingle').bootstrapTable('getData');
        var obj = {};
        obj.id = data.length + 1;;
        obj.parent = false;
        obj.parentBillId = window.rowTemp.billId;
        obj.parentId = -1;
        obj.deliveryDate = '';
        obj.productName = '';
        obj.product = '';
        obj.sugar = false;
        obj.quantity = '';
        obj.price = '';
        obj.money = '';
        obj.promotionCode = '';
        obj.total = '';
        obj.test = '';
        obj.operate = '1';
        obj.note = '';
        $table.bootstrapTable('append', [obj]);
    });
    $('#btnPopupSingle').on('click', function () {
        var $tablePopup = $('#tablePopupSingle');
        var $table = $('#table');
        var ngayGiaoHangLe = $("#txtNgayGiaoHangLe").val();
        var dataPopup = $('#tablePopupSingle').bootstrapTable('getData');
        var objCustomer = {};
        objCustomer.maKH = $("#txtMaKH1").val();
        objCustomer.hoTen = $("#txtHoTen1").val();
        objCustomer.ngaySinh = $("#txtNgaySinh1").val();
        objCustomer.soDienThoai = $("#txtSoDienThoai1").val();
        objCustomer.email = $("#txtEmailCustomer1").val();
        objCustomer.diaChi = $("#txtDiaChiCustomer").val("");
        objCustomer.maquan = $('#cb_quan1').val();
        if (dataPopup.length > 0) {
            var totalMoneyPopup = 0;
            for (var i = 0; i < dataPopup.length ; i++) {
                var thanhtien = dataPopup[i].total.split('.').join('');
                totalMoneyPopup += Number(thanhtien);
            }
            var total = 0;
            for (var m = 0; m < window.dataGlobal.length ; m++) {
                var check = false;
                if (window.dataGlobal[m].tabIndex == window.indexTab) {
                    check = true;
                }
                for (var k = 0; k < window.dataGlobal[m].data.length ; k++) {
                    if (check) {
                        if (window.dataGlobal[m].data[k].billId == dataPopup[0].parentBillId) {
                            window.dataGlobal[m].data[k].fThanhTien = totalMoneyPopup.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
                            window.dataGlobal[m].data[k].detalMaster = dataPopup;
                            window.dataGlobal[m].data[k].detailCustomer = objCustomer;
                            window.dataGlobal[m].data[k].ngayGiaoHangLe = ngayGiaoHangLe;
                            $table.bootstrapTable('updateRow', { index: window.dataGlobal[m].data[k].id - 1, row: window.dataGlobal[m].data[k] });
                        }
                    }
                    total += Number(window.dataGlobal[m].data[k].fThanhTien.split('.').join(''));
                }
            }
            $('#txtTong').val(total.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1."));
        }
    });
    /*****
    ******* Upload file Excel *****
    *******/
    $('#btnUpload').on('click', function () {
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
        var file = document.getElementById("txtFile");
        var files = file.files;
        if (files.length > 0 && window.tenGoi != files[0].name.split('.')[0]) {
            bootbox.alert({
                message: "File Import không đúng gói " + window.tenGoi + " !",
                size: 'small'
            });
            return;
        }
        var obj = {};
        var formBill = new FormData();
        formBill.append('type', 'uploadFile');
        formBill.append('file', files[0]);
        formBill.append('data', JSON.stringify(obj));
        $.ajax({
            url: "/InsertBill/uploadFile",
            type: "POST",
            data: formBill,
            contentType: false,
            processData: false,
            success: function (result) {
                var x = result;
                var index = 0;
                var dataTemp = [];
                for (var i = 1; i < result.length ; i++) {
                    var obj = {};
                    if (result[i].Column1 && result[i].Column1 != "") {
                        index = i;
                        obj.id = index;
                        obj.parent = true;
                        obj.parentBillId = window.indexGoi;
                        obj.parentId = -1;
                        obj.deliveryDate = formatDateTime(result[i].Column1);
                        obj.thugiaohang = convertDateToDay(formatDateTime(result[i].Column1));
                        obj.product = '';
                        obj.sugar = false;
                        obj.quantity = '';
                        obj.price = '';
                        obj.money = '';
                        obj.promotionCode = '';
                        obj.total = '';
                        obj.test = '';
                        obj.operate = '1';
                        obj.productName = '';
                        obj.note = '';
                    } else {
                        obj.id = i;
                        obj.parent = false;
                        obj.parentBillId = window.indexGoi;
                        obj.parentId = index;
                        obj.deliveryDate = "";
                        obj.thugiaohang = "";
                        obj.product = result[i].Column3;
                        obj.sugar = result[i].Column6 ? true : false;
                        obj.quantity = result[i].Column4;
                        obj.price = '0';
                        obj.money = '0';
                        obj.promotionCode = '0';
                        obj.total = '0';
                        obj.test = '';
                        obj.operate = '0';
                        obj.thugiaohang = '';
                        obj.productName = '';
                        obj.note = '';
                    }
                    dataTemp.push(obj);
                }
                $('#tablePopup').bootstrapTable('load', dataTemp);
                disableEditableTable();
            },
            error: function (err) {

            }
        });

    });
    /*************************************************
    ******** Save Hóa đơn
    *************************************************/
    $('#btnSave').on('click', function () {
        if (window.isMasterTab == -1) {
            bootbox.alert({
                message: "Vui lòng tích chọn đơn Master!",
                size: 'small'
            });
            return;
        }
        

        var obj = {};
        obj.maKH = $('#txtMaKH').val();
        obj.hoTen = $('#txtHoTen').val();
        obj.ngaySinh = $('#txtNgaySinh').val();
        obj.soDienThoai = $('#txtSoDienThoai').val();
        obj.soDienThoai = document.getElementById('txtSoDienThoai').value;
        obj.email = document.getElementById('txtEmailCustomer').value;
        obj.diaChi = document.getElementById('txtDiaChiCustomer').value;
        obj.maquan = $('#cb_quan').val();
        if ($('#txtSoDienThoai').val() == "" || document.getElementById('txtEmailCustomer').value == "" || document.getElementById('txtDiaChiCustomer').value == "" || $('#txtHoTen').val() == "") {
            bootbox.alert({
                message: "Vui lòng nhập đầy đủ thông tin khách hàng!",
                size: 'small'
            });
            return;
        }
        var bill = {};
        //bill.maReversion = $('#txtMaHD').val();
        bill.sourceName = $('#cb_SourceType :selected').text();
        bill.sourceId = $('#cb_SourceType').val();
        bill.songayconlai = $('#txtSoNgayConLai').val();
        bill.tong = $('#txtTong').val().split('.').join('');
        bill.sotienthuduoc = $('#txtSoTienThuDuoc').val() != "" ? $('#txtSoTienThuDuoc').val().split('.').join('') : '0'
        bill.chietkhau = $('#txtChietKhau').val() != "" ? $('#txtChietKhau').val().split('.').join('') : '0'
        bill.conNo = $('#txtNo').val() != "" ? $('#txtNo').val().split('.').join('') : '0'
        bill.inFoCustomer = obj;
        bill.infoBill = window.dataGlobal;
        bill.isMasterTab = window.isMasterTab;
        if (bill.infoBill == null || bill.infoBill.length == 0) {
            bootbox.alert({
                message: "Vui lòng nhập thông tin đơn hàng!",
                size: 'small'
            });
            return;
        }
        var formBill = new FormData();
        formBill.append('type', 'insert');
        formBill.append('data', JSON.stringify(bill));
        $.ajax({
            url: "/InsertBill/insert",
            type: "POST",
            data: formBill,
            contentType: false,
            processData: false,
            beforeSend: function () {
                $.LoadingOverlay("show");
            },
            success: function (result) {
                $.LoadingOverlay("hide");
                bootbox.alert({
                    message: "Thêm mới đơn hàng thành công",
                    size: 'small'
                });
                $('#txtMaHD').val("HD" + (result < 0) ? ("0" + result) : result);
                $("#btnSave").attr('disabled', true);
                $("#btnAddBill").attr('disabled', true);
            },
            error: function (err) {

            }
        });
    });
});