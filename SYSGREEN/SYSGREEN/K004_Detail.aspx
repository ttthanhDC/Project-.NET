<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="K004_Detail.aspx.cs" Inherits="SYSGREEN.K002_Buy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
       <div id="contactForm"  class="form-horizontal">
    <div class="form-group">
        <label class="col-md-3 control-label">Nhà cung cấp</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_productCode" />
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
                 <option value ="1">Kho A</option>
                 <option value ="2">Kho A</option>
                 <option value ="3">Tất cả</option>
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
           // eventSearch1();

           var idParam = getQueryVariable("paramId");
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
           if (idParam === "ADD") {

           } else {
               var formDataListUser = new FormData();
               formDataListUser.append('type', 'getData');
               var json = { 'ID': parseInt(idParam) };
               formDataListUser.append('data', JSON.stringify(json));
               $.ajax({
                   url: "Configuation/HandlerSysProduct.ashx",
                   type: "POST",
                   data: formDataListUser,
                   contentType: false,
                   processData: false,
                   success: function (result) {
                       var jsonData = result;
                       if (jsonData && jsonData.length > 0) {
                           for (var i = 0; i < jsonData.length ; i++) {
                               var objectData = jsonData[i];
                               $('#txt_gia').val(objectData.Product_Amount);
                               $('#txt_donVi').val(objectData.Product_Unit);
                               $('#txt_productName').val(objectData.Product_Name);
                               $('#txt_productCode').val(objectData.Product_Code);
                               $('#orgId').val(objectData.ORG_ID);
                           }
                       }
                   },
                   error: function (err) {

                   }
               });
           }



       });
       $('#btnBack').on('click', function (e) {
           window.location = '/K004_ImPortHat.aspx?paramId= 0';
       });
       // Event Thêm mới
       $('#btnSave').on('click', function (e) {
           var idParam = getQueryVariable("paramId");
           // funtion get
           if (idParam === "ADD") {
               // update
               var formData = new FormData();
               var json = {
                   'ID': parseInt(idParam + ""),
                   'Product_Amount': $('#txt_gia').val(),
                   'Product_Unit': $('#txt_donVi').val(),
                   'Product_Name': $('#txt_productName').val(),
                   'Product_Code': $('#txt_productCode').val(),
                   'ORG_ID': parseInt($('#orgId').val() + ""),
               };
               jQuery.ajaxSetup({ async: true });
               formData.append('type', 'update');
               formData.append('data', JSON.stringify(json));
               $.ajax({
                   url: "Configuation/HandlerSysProduct.ashx",
                   type: "POST",
                   data: formData,
                   contentType: false,
                   processData: false,
                   success: function (result) {
                       alert(result);
                   },
                   error: function (err) {

                   }
               });
           } else {
               // insert
               var formData = new FormData();
               var json = {
                   'Product_Amount': $('#txt_gia').val(),
                   'Product_Unit': $('#txt_donVi').val(),
                   'Product_Name': $('#txt_productName').val(),
                   'Product_Code': $('#txt_productCode').val(),
                   'ORG_ID': parseInt($('#orgId').val() + ""),
                   'Create_User': parseInt($('#userid').val() + ""),
               };
               jQuery.ajaxSetup({ async: true });
               formData.append('type', 'insert');
               formData.append('data', JSON.stringify(json));
               $.ajax({
                   url: "Configuation/HandlerSysProduct.ashx",
                   type: "POST",
                   data: formData,
                   contentType: false,
                   processData: false,
                   success: function (result) {
                       alert(result);
                   },
                   error: function (err) {

                   }
               });
           }
       });
       /* var eventSearch1 = function () {
            var data = [{
                stt: '1',
                maSp: 'PX-20082018',
                tenSp: 'Kho A',
                soLuong: '20/08/2018',
                donvi: '150',
                hanSuDung: 'duytn ',
                gia: 'duytn ',
                chuyenToiKho: 'duytn ',
            }]
            data = data;
            var $table1 = $('#table1');
            $table1.bootstrapTable('load', data);
        };*/

       $('#btnAdd').on('click', function (e) {
           var data = [];
           var datatable = $('#table1').bootstrapTable('getData');
           if (datatable) {
               var x = datatable.length;
               var obj = {};
               obj.stt = x + 1;
               obj.maSp = '';
               obj.tenSp = '';
               obj.soLuong = '';
               obj.donvi = '';
               obj.hanSuDung = '';
               obj.gia = '';
               obj.chuyenToiKho = '';
               datatable.push(obj);
           } else {
               var obj = {};
               obj.stt = 1;
               obj.maSp = '';
               obj.tenSp = '';
               obj.soLuong = '';
               obj.donvi = '';
               obj.hanSuDung = '';
               obj.gia = '';
               obj.chuyenToiKho = '';
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
                       field: 'maSp',
                       title: 'Mã sản phẩm',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'tenSp',
                       title: 'Tên sản phẩm',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'soLuong',
                       title: 'Số lượng',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'donvi',
                       title: 'Đơn vị',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'hanSuDung',
                       title: 'Hạn sử dụng',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'gia',
                       title: 'Giá',
                       align: 'center',
                       valign: 'middle',
                       editable: true
                   }, {
                       field: 'chuyenToiKho',
                       title: 'Chuyển tới kho',
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
               '<a class="view" href="javascript:void(0)" title="xóa">',
               'Xóa',
               '</a>  '
           ].join('');
       }

       window.operateEvents = {
           'click .view': function (e, value, row, index) {
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

