<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="KD002_HistoryBuy.aspx.cs" Inherits="SYSGREEN.KD002_HistoryBuy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
       <div id="contactForm"  class="form-horizontal">
    <div class="form-group">
        <label class="col-md-3 control-label">mã Khách hàng</label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="tile" id="txt_maKH" />
        </div>
        <div class="col-md-1">
            <button type="button" class="btn btn-primary" id="btnView">View</button>
        </div>
        <div class="col-md-1">
           <button type="button" class="btn btn-primary" id="btnIn">In</button>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Tên khách hàng</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_nameKH" />
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
            <textarea class="form-control"  id="txt_diaChi"></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Ngày</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_ngay" />
        </div>
    </div>
   <div class="form-group">
        <label class="col-md-3 control-label">User tạo</label>
         <div class="col-md-9">
             <input type="text" class="form-control" name="tile" id="txt_user" />
           </div>
    </div>
    
    <div class="form-group">
        <label class="col-md-3 control-label">Tổng tiêu</label>
         <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_date" />
         </div>
    </div> 
      
 </div> 
    <div style ="height:30px"></div> 
    <div style ="margin-left:20px;margin-right:20px" id ="div_Table1">
        <table id="table1"></table>
    </div>
  
   <script>
       $(function () {
           var itemData = [];
           getDataTable1(itemData);
           eventSearch1();

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

       $('#btnView').on('click', function (e) {
           window.location = '/LT002_demo2.aspx?paramId= 0';
       });

       $('#btnIn').on('click', function (e) {
           window.location = '/K004_ImPortHat.aspx?paramId= 0';
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
       var eventSearch1 = function () {
           var data = [{
               stt: '1',
               maReser: 'PX-20082018',
               maDon: 'Trần ngọc duy',
               hoTen: '20/08/2018',
               sdt: 'Khách gói',
               quan: '0989485398 ',
               diaChi: 'duytn@123',
               trangThai: 'Ba đình ',
           }, {
               stt: '2',
               maReser: 'PX-20082018',
               maDon: 'Trần ngọc duy',
               hoTen: '20/08/2018',
               sdt: 'Khách gói',
               quan: '0989485398 ',
               diaChi: 'duytn@123',
               trangThai: 'Ba đình ',
           }]
           data = data;
           var $table1 = $('#table1');
           $table1.bootstrapTable('load', data);
       };

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
                       field: 'maReser',
                       title: 'Mã reservation',
                       align: 'center',
                       valign: 'middle',
                   }, {
                       field: 'maDon',
                       title: 'Mã đơn',
                       align: 'center',
                       valign: 'middle',
                   }, {
                       field: 'hoTen',
                       title: 'Họ tên',
                       align: 'center',
                       valign: 'middle',
                   }, {
                       field: 'sdt',
                       title: 'SĐT',
                       align: 'center',
                       valign: 'middle',
                   }, {
                       field: 'quan',
                       title: 'Quận',
                       align: 'center',
                       valign: 'middle',
                   }, {
                       field: 'diaChi',
                       title: 'Dịa Chỉ',
                       align: 'center',
                       valign: 'middle',
                   }, {
                       field: 'trangThai',
                       title: 'Trạng thái',
                       align: 'center',
                       valign: 'middle',
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


