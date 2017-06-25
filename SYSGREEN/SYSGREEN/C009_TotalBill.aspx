<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Menu.Master" CodeFile="C009_TotalBill.aspx.cs" Inherits="SYSGREEN.C009_TotalBill" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <script>
        $(function () {
            $('#table').bootstrapTable({
                columns: [{
                    field: 'branch',
                    title: 'Cơ sở',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,
                }, {
                    field: 'billMin',
                    title: 'Min',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,
                }, {
                    field: 'billMax',
                    title: 'Max',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,

                }, {
                    field: 'beginDate',
                    title: 'Ngày bắt đầu',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,
                }, {
                    field: 'endDate',
                    title: 'Ngày tạo',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,
                }, {
                    field: 'code',
                    title: 'Mã',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: {
                        type: 'text',
                        title: 'User',
                        validate: function (value) {
                            value = $.trim(value);
                            if (!value) {
                                return 'This field is required';
                            }
                            if (!/^\$/.test(value)) {
                                return 'This field needs to start width $.'
                            }
                            var data = $table.bootstrapTable('getData'),
                                index = $(this).parents('tr').data('index');
                            console.log(data[index]);
                            return '';
                        }
                    },
                    footerFormatter: userFormatter
                }, {
                    field: 'nameBill',
                    title: 'Tên',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,
                }, {
                    field: 'percent',
                    title: '%',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,
                }, {
                    field: 'money',
                    title: 'Vnđ',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,
                }, {
                    field: 'freeShip',
                    title: 'Free ship',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,
                }, {
                    field: 'operate',
                    title: 'Thao tác',
                    align: 'center',
                    valign: 'middle',
                    events: operateEvents,
                    formatter: operateFormatter
                }],



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
