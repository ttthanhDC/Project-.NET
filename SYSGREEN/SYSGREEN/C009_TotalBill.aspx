<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeFile="C009_TotalBill.aspx.cs" Inherits="SYSGREEN.C009_TotalBill" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">

     <table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-page-list="[10, 25, 50, 100, ALL]" 
        ></table>
    <div style ="height:40px"></div>
    <div style ="text-align:center;display: table;margin: 0 auto;">
         <button type="button" class="btn btn-primary" id="btadd">Thêm</button>
    </div>

    <script>
        $(function () {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getData');
            var json = { 'ID': 0 };
            formDataListUser.append('data', JSON.stringify(json));
            $.ajax({
                url: "Configuation/HandlerSysPromotion.ashx",
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
                            obj.branch = objectData.ORG_ID;
                            obj.billMin = objectData.Min;
                            obj.billMax = objectData.Max;
                            obj.beginDate = objectData.Date_Start;
                            obj.endDate = objectData.Date_End;
                            obj.code = objectData.Code;
                            obj.nameBill = objectData.Name;
                            obj.percent = objectData.Promotion_Percent;
                            obj.money = objectData.Amount_VND;
                            obj.freeShip = objectData.Amount_FreeShip;
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
        });
        // function
        $('#btadd').on('click', function (e) {
            window.location = '/managerPoromotion.aspx?';
        });
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
                window.location = '/managerPoromotion.aspx?paramId=' + row.id;
            },
            'click .remove': function (e, value, row, index) {
                var formData = new FormData();
                var id = parseInt(row.id + "");
                //formData.append('data', "{Dept_Name:'abc',Dept_Description:'mieuta','Create_User':'thanhdc7'}");
                var json = { 'ID': id };
                jQuery.ajaxSetup({ async: true });
                formData.append('type', 'delete');
                formData.append('data', JSON.stringify(json));
                $.ajax({
                    url: "Configuation/HandlerSysPromotion.ashx",
                    type: "POST",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        alert('Xóa thành công');
                        $('#table').bootstrapTable('remove', {
                            field: 'id',
                            values: [row.id]
                        });
                    },
                    error: function (err) {
                        alert('Xóa thất bại');
                    }
                });
            }
        };
    </script>
   
    </asp:Content>
