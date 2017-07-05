<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeFile="C009_TotalBill.aspx.cs" Inherits="SYSGREEN.C009_TotalBill" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <script>
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
                            obj.department = objectData.RoleName;
                            obj.dateCreate = objectData.Create_Date;
                            obj.user = objectData.Create_User;
                            arr.push(obj);
                        }
                    }
                    data = arr;

                    $('#table').bootstrapTable({
                        columns: [{
                            field: 'branch',
                            title: 'Cơ sở',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'billMin',
                            title: 'Min',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'billMax',
                            title: 'Max',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'beginDate',
                            title: 'Ngày bắt đầu',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'endDate',
                            title: 'Ngày tạo',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'code',
                            title: 'Mã',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'nameBill',
                            title: 'Tên',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'percent',
                            title: '%',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'money',
                            title: 'Vnđ',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'freeShip',
                            title: 'Free ship',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'operate',
                            title: 'Thao tác',
                            align: 'center',
                            valign: 'middle',
                            events: operateEvents,
                            formatter: operateFormatter
                        }],
                        data: data
                    });
                },
                error: function (err) {

                }
            });
            
                data: [{
                    branch : 'HO',
                    billMin :'Min',
                    billMax : 'Max',
                    beginDate :'01/01/2017',
                    endDate :'02/02/2017',
                    code :'123',
                    nameBill :'Xuất kho',
                    percent :'10',
                    money :'100,000',
                    freeShip :'20,000'
                }, {
                    id: 2,
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }, {
                    branch: 'HO',
                    billMin: 'Min',
                    billMax: 'Max',
                    beginDate: '01/01/2017',
                    endDate: '02/02/2017',
                    code: '123',
                    nameBill: 'Xuất kho',
                    percent: '10',
                    money: '100,000',
                    freeShip: '20,000'
                }]
            });
        });
        // function
        function userFormatter(data) {
            return data.length;
        }
        function operateFormatter(value, row, index) {
            return [
                '<a class="edit" href="javascript:void(0)" title="Sửa">',
                'Sửa',
                '</a>  ', '|',
                '<a class="remove" href="javascript:void(0)" title="Xoá">',
                'Xóa',
                '</a>',
            ].join('');
        }

        window.operateEvents = {
            'click .edit': function (e, value, row, index) {
                alert('You click like action, row: ' + JSON.stringify(row));
            },
            'click .remove': function (e, value, row, index) {
                $('#table').bootstrapTable('remove', {
                    field: 'id',
                    values: [row.id]
                });
            }
        };

    </script>
    <table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-show-toggle="true" data-show-columns="true" 
        data-show-pagination-switch="true"
        data-page-list="[10, 25, 50, 100, ALL]" 
        data-show-footer="false" 
        ></table>
    <div style ="height:40px"></div>
    <div style ="text-align:center;display: table;margin: 0 auto;">
        <input type="submit" class="btn btn-info" value="Thêm">
    </div>
    </asp:Content>
