<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S001_ListShiper.aspx.cs" Inherits="SYSGREEN.S001_ListShiper" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-1">
                    <input type="text" class="form-control" name="title" id="txt_reservation" placeholder="Mã reservation"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_Date" placeholder="Ngày" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_Distric" placeholder="Quận"/>
                </div>
                 <div class="col-md-1">
                    <input type="text" class="form-control" name="title" id="txt_ShipNumber"placeholder="Shiper number" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ShipName"placeholder="Shiper name" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_status"placeholder="Trạng thái" />
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
            </div> 
        </div> 
        <div class="form-horizontal">
            <div class="form-group">
                 <label for="sel1" class="col-md-1"></label>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="btIn">In hóa đơn vận chuyển</button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btBeark">Tách bill</button>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                          <select class="form-control" id="cbShip">
                            
                          </select>
                        </div>
                </div>
                 <div class="col-md-2">
                    <div class="form-group">
                           <select class="form-control" id="userid"></select>
                        </div>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btAssign ">Assign </button>
                </div>
            </div> 
        </div> 
        
    </div>
   <div style ="margin-left:20px;margin-right:20px">
       <table id="table" 
       
        ></table>
   </div> 
   
<script>
    // Bootstrap Table
    $(function () {
        // Load Data user
        var formDataUser = new FormData();
        formDataUser.append('type', 'getData');
        var json = { 'ID': 0 };
        formDataUser.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerSysUser.ashx",
            type: "POST",
            data: formDataUser,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.name = objectData.UserName;
                        obj.link = objectData.ID;
                        obj.sub = null;
                        arr.push(obj);
                    }
                }
                var data = { menu: arr };
                var $menu = $("#userid");
                $.each(data.menu, function () {
                    $menu.append(
                        getUser(this)
                    );
                });
            },
            error: function (err) {

            }
        });
        // select box shiper  
        var getUser = function (itemData) {
            var item = $("<option value='" + itemData.link + "'>")
                .append(itemData.name);
            return item;
        };
        // Load Data user
        var formDataUser = new FormData();
        formDataUser.append('type', 'getData');
        var json = { 'ID': 0 };
        formDataUser.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerSysUser.ashx",
            type: "POST",
            data: formDataUser,
            contentType: false,
            processData: false,
            success: function (result) {
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};
                        obj.name = objectData.UserName;
                        obj.link = objectData.ID;
                        obj.sub = null;
                        arr.push(obj);
                    }
                }
                var data = { menu: arr };
                var $menu = $("#cbShip");
                $.each(data.menu, function () {
                    $menu.append(
                        getShip(this)
                    );
                });
            },
            error: function (err) {

            }
        });
        // select box user  
        var getShip = function (itemData) {
            var item = $("<option value='" + itemData.link + "'>")
                .append(itemData.name);
            return item;
        };
        // table


        var data = [];
        var formDataListUser = new FormData();
        formDataListUser.append('type', 'getData');
        var json = { 'ID': 0 };
        formDataListUser.append('data', JSON.stringify(json));
        $.ajax({
            url: "Configuation/HandlerSysRole.ashx",
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
                        obj.id = objectData.ID;
                        obj.code = objectData.RoleName;
                        obj.date = objectData.Create_Date;
                        obj.district = objectData.Create_User;
                        obj.status = objectData.Create_User;
                        obj.name = objectData.Create_User;
                        obj.sdt = objectData.Create_User;
                        obj.addres = objectData.Create_User;
                        obj.money = objectData.Create_User;
                        obj.shipName = objectData.Create_User;
                        obj.shipNumber = objectData.Create_User;
                        obj.detb = objectData.Create_User;
                        arr.push(obj);
                    }
                }
                data = arr;
                    $('#table').bootstrapTable({
                        columns: [{
                            field: 'check',
                            title: 'Tích',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (value) {
                                    return '<input type="checkbox" value="" checked></label>';
                                } else {
                                    return '<input type="checkbox" value=""></label>';
                                }
                            }
                        },{
                            field: 'code',
                            title: 'Mã Reservation',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                return '<label style = "color: blue;">' + value + '</label>';
                            }
                        }, {
                            field: 'date',
                            title: 'Ngày',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (row.detb) {
                                    return '<label style = "color: red;">' + value + '</label>';
                                } else {
                                    return value;
                                }
                            }
                        }, {
                            field: 'district',
                            title: 'Quận',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (row.detb) {
                                    return '<label style = "color: red;">' + value + '</label>';
                                } else {
                                    return value;
                                }
                            }
                        }, {
                            field: 'status',
                            title: 'Trạng thái',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (row.detb) {
                                    return '<label style = "color: red;">' + value + '</label>';
                                } else {
                                    return value;
                                }
                            }
                        }, {
                            field: 'name',
                            title: 'Họ tên',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (row.detb) {
                                    return '<label style = "color: red;">' + value + '</label>';
                                } else {
                                    return value;
                                }
                            }
                        }, {
                            field: 'sdt',
                            title: 'SĐT',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (row.detb) {
                                    return '<label style = "color: red;">' + value + '</label>';
                                } else {
                                    return value;
                                }
                            }
                        }, {
                            field: 'addres',
                            title: 'Địa chỉ',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (row.detb) {
                                    return '<label style = "color: red;">' + value + '</label>';
                                } else {
                                        return value;
                                }
                            }
                        }, {
                            field: 'shipName',
                            title: 'Ship Name',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (row.detb) {
                                    return '<label style = "color: red;">' + value + '</label>';
                                } else {
                                    return value;
                                }
                            }
                        }, {
                            field: 'shipNumber',
                            title: 'ShipNo',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (row.detb) {
                                    return '<label style = "color: red;">' + value + '</label>';
                                } else {
                                    return value;
                                }
                            }
                        }, {
                            field: 'user',
                            title: 'User',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (row.detb) {
                                    return '<label style = "color: red;">' + value + '</label>';
                                } else {
                                    return value;
                                }
                            }
                        }, {
                            field: 'money',
                            title: 'Tiền',
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                if (row.detb) {
                                    return '<label style = "color: red;">' + value + '</label>';
                                } else {
                                    return value;
                                }
                            }
                        }],
                
                    data: data
                });
            },
            error: function (err) {

            }
        });
        // format table
        /*$('#table').bootstrapTable({
            columns: [{
                field: 'check',
                title: 'Tích',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (value) {
                        return '<input type="checkbox" value="" checked></label>';
                    } else {
                        return '<input type="checkbox" value=""></label>';
                    }
                }
            },{
                field: 'code',
                title: 'Mã Reservation',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<label style = "color: blue;">' + value + '</label>';
                }
            }, {
                field: 'date',
                title: 'Ngày',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'district',
                title: 'Quận',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'status',
                title: 'Trạng thái',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'name',
                title: 'Họ tên',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'sdt',
                title: 'SĐT',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'addres',
                title: 'Địa chỉ',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                         return value;
                    }
                }
            }, {
                field: 'shipName',
                title: 'Ship Name',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'shipNumber',
                title: 'ShipNo',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }, {
                field: 'money',
                title: 'Tiền',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    if (row.detb) {
                        return '<label style = "color: red;">' + value + '</label>';
                    } else {
                        return value;
                    }
                }
            }],
            data: [{
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: true,
                check : true
            },{
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: true,
                check: true
            }, {
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: false,
                check: true
            }, {
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: true,
                check: false
            }, {
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: true,
                check: true
            }, {
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: true,
                check: false
            }, {
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: true,
                check: true
            },{
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: true,
                check: false
            },{
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: true,
                check: true
            },{
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: false,
                check: true
            },{
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: true,
                check: true
            },{
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'ThanhDC',
                shipNumber: '0012',
                detb: false,
                check: false
            },{
                code: '002-001-123456',
                date: '20/07/2017',
                district: 'Hà đông',
                status: 'Đang chuyển',
                name: 'Trần ngọc duy',
                sdt: '0989485398',
                addres: '39 Hoàng mai, hà nội',
                money: '300,000',
                shipName: 'Duytn4',
                shipNumber: '0012',
                detb: true,
                check: false
            }]
        }); */
    });
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
</script>
    </asp:Content>

