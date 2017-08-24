﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"  CodeBehind="K005_ExpectedToBuy.aspx.cs" Inherits="SYSGREEN.K005_ExpectedToBuy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div class="main-content-inner" style ="margin-left:30px;margin-right:30px" id ="div_LoTrinh">
         <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_phieuNhap"placeholder="Phiếu nhập" />
                </div>
                  <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_date"placeholder="Ngày" />
                </div>
                   <div class="col-md-2">
                    <div class="form-group">
                          <select class="form-control" id="cbKho">
                              <option value ="1"> Tất cả cơ sở</option>
                              <option value ="2"> Cơ sở A</option>
                                <option value ="2"> Cơ sở B</option>
                          </select>
                        </div>
                </div>
                  <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btSearh">Tìm kiếm</button>
                </div>
                 <div class="col-md-1">
                    <button type="button" class="btn btn-primary" id="btAdd">Thêm</button>
                </div>
            </div> 
    </div>
</div>
    <div style ="margin-left:20px;margin-right:20px" id ="div_Table1">
        <table id="table1"></table>
    </div>
   
<script>
    // Bootstrap Table
    $(function () {
        var itemData = [];
        getDataTable1(itemData);
        eventSearch1();
    });

    $('#btTKLoTrinh').on('click', function (e) {
        eventSearch1();
    });
    var eventSearch1 = function () {
        var data = [];
        var formDatasearch = new FormData();
        formDatasearch.append('type', 'viewNhapXuatKho');

        formDatasearch.append('TypeXNK', 2);
        formDatasearch.append('Ma', $('#txt_phieuNhap').val());
        formDatasearch.append('Ngay', $('#txt_date').val());
        formDatasearch.append('KhoId', 0);
        
        $.ajax({
            url: "Configuation/HandlerKhoServices.ashx",
            type: "POST",
            data: formDatasearch,
            contentType: false,
            processData: false,
            success: function (result) {
                // alert(result);
                var jsonData = result;
                var arr = [];
                if (jsonData && jsonData.length > 0) {
                    for (var i = 0; i < jsonData.length ; i++) {
                        var objectData = jsonData[i];
                        var obj = {};

                        obj.stt = i + 1;
                        //ID
                        //MaPhieuNhap
                        //MaPhieuXuat
                        //SoDT
                        //Ten
                        obj.id = objectData.ID;
                        obj.phieuNhap = objectData.MaPhieuNhap;
                        obj.coSo = "";// TODO
                        obj.toi = objectData.Kho;
                        // obj.date = objectData.Ngay;
                        obj.nguoiDeXuat = objectData.NguoiTao;
                        obj.ghiChu = objectData.GhiChu;
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
                        arr.push(obj);
                    }
                }
                data = arr;
                var $table1 = $('#table1');
                $table1.bootstrapTable('load', data);
            },
            error: function (err) {
            }
        });
    };

    $('#btAdd').on('click', function (e) {
        window.location = '/K005_Detail.aspx?paramId=ADD';
    });


    // getdata table lộ trình
    var getDataTable1 = function (itemData) {
        $('#table1').bootstrapTable({
            columns: [
                {
                    field: 'stt',
                    title: 'STT',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'phieuNhap',
                    title: 'Phiếu xuất',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'coSo',
                    title: 'Cơ sở',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'date',
                    title: 'Thời gian',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'nguoiDeXuat',
                    title: 'Người đề xuất',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'toi',
                    title: 'Tới kho',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'ghiChu',
                    title: 'Ghi chú',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'operate',
                    title: 'Xem',
                    align: 'center',
                    valign: 'middle',
                    events: operateEvents,
                    formatter: operateFormatter
                }, {
                    field: 'operate2',
                    title: 'Duyệt',
                    align: 'center',
                    valign: 'middle',
                    events: operateEvents1,
                    formatter: operateFormatter1
                }],

            data: itemData
        });
    };

    function operateFormatter(value, row, index) {
        return [
            '<a class="view" href="javascript:void(0)" title="view">',
            'Xem',
            '</a>  '
        ].join('');
    }

    window.operateEvents = {
        'click .view': function (e, value, row, index) {
            window.location = '/K005_Detail.aspx?paramId=' + row.id;
        }
    };
    function operateFormatter1(value, row, index) {
        return [
            '<a class="duyet" href="javascript:void(0)" title="Duyet">',
            'Duyet',
            '</a>  '
        ].join('');
    }

    window.operateEvents1 = {
        'click .view': function (e, value, row, index) {
           // window.location = '/K005_Detail.aspx?paramId=' + row.id;
        }
    };
</script>
    </asp:Content>






