﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="BC004_RevenueFormSource.aspx.cs" Inherits="SYSGREEN.c" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-5"></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_beginDate" placeholder="Ngày bắt đầu"/>
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_EndDate" placeholder="Ngày kết thúc" />
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearch">Tìm kiếm</button>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btPrint">In</button>
                </div>
            </div> 
        </div> 
    </div>
       
    <div style ="margin-left:50px;margin-right:50px">
         <table id="table" 
        ></table>
    </div>
    <div id="chartContainer" style="height: 400px; width: 100%;"></div>
    <script>
        $(function () {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getvBaoCao04');
            var json = { 'ID': 0 };
            formDataListUser.append('data', JSON.stringify(json));
            formDataListUser.append('tuNgay', "");
            formDataListUser.append('denNgay', "");
            
            $.ajax({
                url: "Configuation/HandlerBaoCao.ashx",
                type: "POST",
                data: formDataListUser,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    var SoLuongDon = 0;
                    var SoLuongShip = 0;
                    var DuKienThu = 0;
                  
                    if (jsonData && jsonData.length > 0) {
                        for (var i = 0; i < jsonData.length ; i++) {
                            var objectData = jsonData[i];
                            var obj = {};
                            obj.text1 = objectData.TenNguon;
                            obj.text4 = (objectData.DuKienThu+ "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            obj.text2 = objectData.SoLuongDon;
                            obj.text3 = objectData.SoluongShip;
                            SoLuongDon = SoLuongDon + objectData.SoLuongDon;
                            SoLuongShip = SoLuongShip + objectData.SoluongShip;
                            DuKienThu = DuKienThu + objectData.DuKienThu;
                            arr.push(obj);
                        }
                        var obj1 = {};
                        obj1.text1 = "Tổng";
                        obj1.text4 = (DuKienThu+ "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        obj1.text2 = SoLuongDon;
                        obj1.text3 = SoLuongShip;
                        arr.push(obj1);

                        data = arr;
                        getDataTable(data);
                        if (DuKienThu > 0) {
                            var obj2 = {}
                            var value = [];
                            for (var j = 0; j < data.length ; j++) {
                                if (data[j].text1 !== "Tổng") {
                                    var sodu = data[j].text4 / DuKienThu;
                                    obj2 = { y: sodu, indexLabel: data[j].text1, z: data[j].text4 }
                                    value.push(obj2);
                                }
                            }
                            loadContent(value);
                        }
                    }
                },
                error: function (err) {

                }
            });

            
        });
        $('#btSearch').on('click', function (e) {
            var data = [];
            var formDataListUser = new FormData();
            formDataListUser.append('type', 'getvBaoCao04');
            var json = { 'ID': 0 };
            formDataListUser.append('data', JSON.stringify(json));
            formDataListUser.append('tuNgay', $('#txt_beginDate').val());
            formDataListUser.append('denNgay', $('#txt_EndDate').val());

            $.ajax({
                url: "Configuation/HandlerBaoCao.ashx",
                type: "POST",
                data: formDataListUser,
                contentType: false,
                processData: false,
                success: function (result) {
                    var jsonData = result;
                    var arr = [];
                    var SoLuongDon = 0;
                    var SoLuongShip = 0;
                    var DuKienThu = 0;

                    if (jsonData && jsonData.length > 0) {
                        for (var i = 0; i < jsonData.length ; i++) {
                            var objectData = jsonData[i];
                            var obj = {};
                            obj.text1 = objectData.TenNguon;
                            obj.text4 = objectData.DuKienThu;
                            obj.text2 = objectData.SoLuongDon;
                            obj.text3 = objectData.SoluongShip;
                            SoLuongDon = SoLuongDon + objectData.SoLuongDon;
                            SoLuongShip = SoLuongShip + objectData.SoluongShip;
                            DuKienThu = DuKienThu + objectData.DuKienThu;
                            arr.push(obj);
                        }
                        var obj1 = {};
                        obj1.text1 = "Tổng";
                        obj1.text4 = DuKienThu;
                        obj1.text2 = SoLuongDon;
                        obj1.text3 = SoLuongShip;
                        arr.push(obj1);

                        data = arr;
                        var $table = $('#table');
                        $table.bootstrapTable('load', data);
                        if (DuKienThu > 0) {
                            var obj2 = {}
                            var value = [];
                            for (var j = 0; j < data.length ; j++) {
                                if (data[j].text1 !== "Tổng") {
                                    var sodu = data[j].text4 / DuKienThu;
                                    obj2 = { y: sodu, indexLabel: data[j].text1, z: data[j].text4 }
                                    value.push(obj2);
                                }
                            }
                            loadContent(value);
                        }
                    }
                },
                error: function (err) {

                }
            });


        });
        var getDataTable = function (itemData) {
            $('#table').bootstrapTable({
                columns: [{
                    field: 'text1',
                    title: 'Nguồn',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'text2',
                    title: 'Số lượng đơn',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'text3',
                    title: 'Số lượng ship',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'text4',
                    title: 'Dự kiến thu',
                    align: 'center',
                    valign: 'middle',
                }],
                data: itemData
            });
        };
        var loadContent = function (data) {
            var chart = new CanvasJS.Chart("chartContainer",
            {
                theme: "theme2",
                title: {
                    text: "Xanh lá"
                },
                data: [
                {
                    type: "pie",
                    showInLegend: true,
                    toolTipContent: "{z} VNĐ - #percent %",
                    legendText: "{indexLabel}",
                    dataPoints: data
                }
                ]
            });
            chart.render();
        };
    </script>
    
    </asp:Content>

