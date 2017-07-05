<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeFile="C008_Product.aspx.cs" Inherits="SYSGREEN.C008_Product" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
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
                        field: 'codeProduct',
                        title: 'Code',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'nameProduct',
                        title: 'Tên ',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'unitProduct',
                        title: 'Đơn vị',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        field: 'priceProduct',
                        title: 'Giá',
                        align: 'center',
                        valign: 'middle',
                    }],
                    data: data
                });
            },
            error: function (err) {

            }
        });
            data: [{
                branch: 'HO',
                codeProduct: 'P001',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P002',
                nameProduct: 'Sữa hạt điều cốt đậu đen',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P003',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P004',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P005',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P006',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P007',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P008',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P009',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P010',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P011',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P012',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P013',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }, {
                branch: 'HO',
                codeProduct: 'P014',
                nameProduct: 'Sữa hạt điều cốt dừa',
                unitProduct: '325 ml',
                priceProduct: '30,000'
            }]
        });

    });
</script>
    </asp:Content>

