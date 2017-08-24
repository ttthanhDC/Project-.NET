﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="K005_Detail.aspx.cs" Inherits="SYSGREEN.K005_Detail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
       <div id="contactForm"  class="form-horizontal">
           <div class="form-group">
        <label class="col-md-3 control-label">Nhà cung cấp</label>
        <div class="col-md-9">
            <select class="form-control" id="txt_productCode">
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Tên</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_ten" />
        </div>
    </div>
   <div class="form-group">
        <label class="col-md-3 control-label">SĐT</label>
         <div class="col-md-9">
             <input type="text" class="form-control" name="tile" id="txt_sdt" />
           </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Địa chỉ</label>
         <div class="col-md-9">
              <textarea class="form-control"  id="txt_DiaChi"></textarea>
             </div>
    </div> 
    
           <div class="form-group">
        <label class="col-md-3 control-label">Ngày</label>
         <div class="col-md-9">
         <input type="text" class="form-control" name="tile" id="txt_date" />
             </div>
    </div> 
    <div class="form-group">
        <label class="col-md-3 control-label">Tới kho</label>
         <div class="col-md-9">
             <select class="form-control" id="kho">
                 <option value ="1">Tất cả cơ sở</option>
                 <option value ="2">Cơ sở A</option>
                 <option value ="3">Cơ sở B</option>
             </select>
           </div>
    </div>  
            <div class="form-group">
        <label class="col-md-3 control-label">Ghi chú</label>
         <div class="col-md-9">
             <textarea class="form-control"  id="txt_ghiChu"></textarea>
             </div>
    </div>
      
 </div> 
    <div style ="height:30px"></div> 
    <div style ="margin-left:20px;margin-right:20px" id ="div_Table1">
        <button type="button" class="btn btn-primary" id="btnAdd">Thêm</button>
        <table id="table1"></table>
    </div>
    <div class="form-group">
        <div class="col-md-12 col-md-offset-3">
            <div style="display:inline-block"><button type="button" class="btn btn-primary" id="btnSave">Lưu</button></div>
            <div style="display:inline-block"><button type="button" class="btn btn-primary" id="btnBack">Quay lại</button></div>
        </div>
    </div>
   <script>
       $(function () {
           var itemData = [];
           getDataTable1(itemData);
           window.id = 0;
           window.idParam = 0;
           // eventSearch1();

           window.idParam = getQueryVariable("paramId");
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
           }
           //
           var formDatasearch = new FormData();
           formDatasearch.append('type', 'viewNhaCungCap');

           formDatasearch.append('MaNCC', "");
           formDatasearch.append('TenNCC', "");
           formDatasearch.append('SoDT', "");
           formDatasearch.append('Tinh', "");
           formDatasearch.append('LoaiDichVu', "");

           $.ajax({
               url: "Configuation/HandlerKhoServices.ashx",
               type: "POST",
               data: formDatasearch,
               contentType: false,
               processData: false,
               success: function (result) {
                   var jsonData = result;
                   var arr = [];
                   if (jsonData && jsonData.length > 0) {
                       for (var i = 0; i < jsonData.length ; i++) {
                           var objectData = jsonData[i];
                           var obj = {};
                           obj.name = objectData.MaNCC + " : " + objectData.TenNCC;
                           obj.link = objectData.ID;
                           obj.sub = null;
                           arr.push(obj);
                       }
                   }
                   var data = { menu: arr };
                   var $menu = $("#txt_productCode");
                   $.each(data.menu, function () {
                       $menu.append(
                           getNCC(this)
                       );
                   });
               },
               error: function (err) {

               }
           });
           ///
           var getNCC = function (itemData) {
               var item = $("<option value='" + itemData.link + "'>")
                   .append(itemData.name);
               return item;
           };
           //
           if (window.idParam === "ADD") {

           } else {
               var formDataListUser = new FormData();
               formDataListUser.append('type', 'viewDetailNhapXuatKho');
               formDataListUser.append('TypeXNK', 2);
               formDataListUser.append('IdNhapXuat', window.idParam);
               $.ajax({
                   url: "Configuation/HandlerKhoServices.ashx",
                   type: "POST",
                   data: formDataListUser,
                   contentType: false,
                   processData: false,
                   success: function (result) {
                       //alert(result);
                       var arr = [];
                       var k = 0;
                       var jsonData = result;
                       if (jsonData && jsonData.length > 0) {
                           var data1 = jsonData[0];
                           var dataOBJ = data1[0];
                           $('#txt_productCode').val(dataOBJ.NhaCungCap);
                           $('#txt_ten').val(dataOBJ.Ten);
                           $('#txt_sdt').val(dataOBJ.SoDT);
                           $('#txt_DiaChi').val(dataOBJ.DiaChi);

                           $('#kho').val(dataOBJ.Kho);
                           $('#txt_ghiChu').val(dataOBJ.GhiChu);
                           var data_ngay = dataOBJ.NgayTao;
                           var z = "";
                           if (data_ngay) {
                               var x = data_ngay.substr(0, 10);
                               var y = x.split("-");
                               var y1 = y[0];
                               var y2 = y[1];
                               var y3 = y[2];
                               z = y3 + "/" + y2 + "/" + y1;
                           }
                           $('#txt_date').val(z);
                           for (var i = 0; i < jsonData[1].length ; i++) {
                               var data2 = jsonData[1];
                               var objectData = data2[i];
                               var obj = {};
                               k = k + 1;
                               obj.stt = k;
                               obj.DonVi = objectData.DonVi;
                               obj.Gia = objectData.Gia;

                               obj.ID = objectData.ID;
                               obj.Kho = 0;
                               obj.NhapKhoId = objectData.NhapKhoId;
                               obj.Product_Code = objectData.Product_Code;
                               obj.Product_Name = objectData.Product_Name;
                               obj.SoLuong = objectData.SoLuong;
                               obj.Type = objectData.Type;
                               obj.XuatKhoId = objectData.XuatKhoId;
                               var data_ngay = objectData.HanSuDung;
                               var z = "";
                               if (data_ngay) {
                                   var x = data_ngay.substr(0, 10);
                                   var y = x.split("-");
                                   var y1 = y[0];
                                   var y2 = y[1];
                                   var y3 = y[2];
                                   z = y3 + "/" + y2 + "/" + y1;
                               }
                               obj.HanSuDung = z;
                               arr.push(obj);
                           }

                           data = arr;
                           var $table1 = $('#table1');
                           $table1.bootstrapTable('load', data);
                       }
                   },
                   error: function (err) {

                   }
               });
           }
       });
       $('#btnBack').on('click', function (e) {
           window.location = '/K005_ExpectedToBuy.aspx?paramId= 0';
       });
       // Event Thêm mới
       $('#btnSave').on('click', function (e) {
           // funtion get
           if (window.idParam === "ADD") {
               // update
               var formData = new FormData();
               var obj = {
                   'ID': 0,
                   'NhaCungCap': $('#txt_productCode').val(),
                   'Ten': $('#txt_ten').val(),
                   'SoDT': $('#txt_sdt').val(),
                   'DiaChi': $('#txt_DiaChi').val(),
                   'Ngay': $('#txt_date').val(),
                   'Kho': $('#kho').val(),
                   'GhiChu': $('#txt_ghiChu').val(),
                   'Type': 2
               };
               var datatable = $('#table1').bootstrapTable('getData');
               var json = { 'PX': obj, 'Detail': datatable };
               jQuery.ajaxSetup({ async: true });
               formData.append('type', 'InsertKho003ReturnID');
               formData.append('data', JSON.stringify(json));
               $.ajax({
                   url: "Configuation/HandlerKhoServices.ashx",
                   type: "POST",
                   data: formData,
                   contentType: false,
                   processData: false,
                   success: function (result) {
                       $('#btnSave')[0].disabled = true;
                       alert("Lưu thành công.");
                       //window.idParam == result;
                       // update
                   },
                   error: function (err) {
                   }
               });
           } else {
               var formData = new FormData();
               var id = 0;
               if (window.idParam === "ADD") {
                   id = 0;
               } else {
                   id = window.idParam;
               }
               var obj = {
                   'ID': id,
                   'NhaCungCap': $('#txt_productCode').val(),
                   'Ten': $('#txt_ten').val(),
                   'SoDT': $('#txt_sdt').val(),
                   'DiaChi': $('#txt_DiaChi').val(),
                   'Ngay': $('#txt_date').val(),
                   'Kho': $('#kho').val(),
                   'GhiChu': $('#txt_ghiChu').val(),
                   'Type': 2
               };
               var datatable = $('#table1').bootstrapTable('getData');
               var json = { 'PX': obj, 'Detail': datatable };
               jQuery.ajaxSetup({ async: true });
               formData.append('type', 'InsertKho003ReturnID');
               formData.append('data', JSON.stringify(json));
               $.ajax({
                   url: "Configuation/HandlerKhoServices.ashx",
                   type: "POST",
                   data: formData,
                   contentType: false,
                   processData: false,
                   success: function (result) {
                       alert("sửa thành công.");
                       window.idParam == result;
                       // update
                   },
                   error: function (err) {
                   }
               });
           }
       });

       $('#btnAdd').on('click', function (e) {
           var data = [];
           var datatable = $('#table1').bootstrapTable('getData');
           if (datatable) {
               var x = datatable.length;
               var obj = {};
               obj.stt = x + 1;
               obj.Product_Code = '';
               obj.Product_Name = '';
               obj.SoLuong = '';
               obj.DonVi = '';
               obj.HanSuDung = '';
               obj.Gia = '';
               obj.Kho = 0;
               //
               obj.Type = 2;
               obj.ID = 0;
               obj.NhapKhoId = 0;
               obj.XuatKhoId = 0;
               datatable.push(obj);
           } else {
               var obj = {};
               obj.stt = 1;
               obj.Product_Code = '';
               obj.Product_Name = '';
               obj.SoLuong = '';
               obj.DonVi = '';
               obj.HanSuDung = '';
               obj.Gia = '';
               obj.Kho = 0;
               //
               obj.Type = 2;
               obj.ID = 0;
               obj.NhapKhoId = 0;
               obj.XuatKhoId = 0;
               datatable.push(obj);
           }
           data = datatable;
           var $table1 = $('#table1');
           $table1.bootstrapTable('load', data);
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
                       field: 'Product_Code',
                       title: 'Mã sản phẩm',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'Product_Name',
                       title: 'Tên sản phẩm',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'SoLuong',
                       title: 'Số lượng',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'DonVi',
                       title: 'Đơn vị',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'HanSuDung',
                       title: 'Hạn sử dụng',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'Gia',
                       title: 'Giá',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'operate',
                       title: 'Xóa',
                       align: 'center',
                       valign: 'middle',
                       events: operateEvents,
                       formatter: operateFormatter
                   }],

               data: itemData
           });
       };
       function operateFormatter(value, row, index) {
           return [
               '<a class="xoa" href="javascript:void(0)" title="xóa">',
               'Xóa',
               '</a>  '
           ].join('');
       }

       window.operateEvents = {
           'click .xoa': function (e, value, row, index) {
               if (row.id) {

               } else {
                   $('#table1').bootstrapTable('remove', {
                       field: 'stt',
                       values: [row.stt]
                   });
                   sortData();
               }
           }
       };
       var sortData = function () {
           var datatable = $('#table1').bootstrapTable('getData');
           var x = datatable.length;
           if (x > 0) {
               for (var i = 0; i < datatable.length; i++) {
                   datatable[i].stt = i + 1;
               }
           } else {
               datatable = [];
           }
           data = datatable;
           var $table1 = $('#table1');
           $table1.bootstrapTable('load', data);
       };
   </script>
    
</asp:Content>


