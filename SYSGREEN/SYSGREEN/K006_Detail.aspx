<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="K006_Detail.aspx.cs" Inherits="SYSGREEN.K006_Detail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
<div id="contactForm"  class="form-horizontal">
   <div class="form-group">
        <label class="col-md-3 control-label">Mã</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_ma" />
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
        <label class="col-md-3 control-label">Tỉnh</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_tinh" />
        </div>
   </div> 
    
   <div class="form-group">
        <label class="col-md-3 control-label">Địa chỉ</label>
         <div class="col-md-9">
             <textarea class="form-control"  id="txt_diaChi"></textarea>
         </div>
    </div>
     <div class="form-group">
        <label class="col-md-3 control-label">Loại dịch vụ</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_loai" />
        </div>
   </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Ghi chú</label>
         <div class="col-md-9">
             <textarea class="form-control"  id="txt_ghiChu"></textarea>
         </div>
    </div>
    <div class="form-group" id="div_ngay">
        <label class="col-md-3 control-label">Ngày tạo</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_ngay" />
        </div>
   </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Ngày tạo</label>
        <div class="col-md-9">
           <select class="form-control" id="cbUser"> </select>
        </div>
   </div>
 </div> 
    <div class="form-group">
        <div class="col-md-12 col-md-offset-3">
            <div style="display:inline-block"><button type="button" class="btn btn-primary" id="btnSave">Lưu</button></div>
            <div style="display:inline-block"><button type="button" class="btn btn-primary" id="btnBack">Quay lại</button></div>
        </div>
    </div>
   <script>
       $(function () {
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

           var formDataUser = new FormData();
           formDataUser.append('type', 'getData');
           var json = { 'ID': 0 };
           formDataUser.append('data', JSON.stringify(json));
           $.ajax({
               url: "Configuation/HandlerSysUser.ashx",
               type: "POST",
               data: formDataUser,
               contentType: false,
               processData: false,
               success: function (result) {
                   var jsonData = result;
                   var arr = [];
                   if (jsonData && jsonData.length > 0) {
                       for (var i = 0; i < jsonData.length ; i++) {
                           var objectData = jsonData[i];
                           var obj = {};
                           obj.name = objectData.UserName;
                           obj.link = objectData.ID;
                           obj.sub = null;
                           arr.push(obj);
                       }
                   }
                   var data = { menu: arr };
                   var $menu = $("#cbUser");
                   $.each(data.menu, function () {
                       $menu.append(
                           getUser(this)
                       );
                   });
               },
               error: function (err) {

               }
           });
           // select box shiper  
           var getUser = function (itemData) {
               var item = $("<option value='" + itemData.link + "'>")
                   .append(itemData.name);
               return item;
           };



           if (idParam === "ADD") {
               $('#div_ngay')[0].style.display = "none";
           } else {
               $('#div_ngay')[0].style.display = "block";
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
           window.location = '/K006_Supplier.aspx?paramId= 0';
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
   </script>
    
</asp:Content>



