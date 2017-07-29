<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S002_Route.aspx.cs" Inherits="SYSGREEN.S002_Route" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
                
                 <label for="sel1" class="col-md-2"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_Date" placeholder="Ngày" />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ShipNumber" placeholder="Shiper number"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_ShipName" placeholder="Shiper name"/>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btLoTrinh">In lộ trình</button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btHoaDon">In hóa đơn</button>
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
                        obj.name = objectData.RoleName;
                        obj.dateCreate = objectData.Create_Date;
                        obj.user = objectData.Create_User;
                        arr.push(obj);
                    }
                }
                data = arr;

                $('#table').bootstrapTable({
                    columns: [{
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
                    data: data
                });
            },
            error: function (err) {

            }
        });
        // format table
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

