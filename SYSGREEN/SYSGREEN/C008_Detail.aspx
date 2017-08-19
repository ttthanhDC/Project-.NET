<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="C008_Detail.aspx.cs" Inherits="SYSGREEN.managerProduct" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div id="contactForm"  class="form-horizontal">
    <div class="form-group">
        <label class="col-md-3 control-label">Cơ sở</label>
        <div class="col-md-9">
             <select class="form-control" id="orgId"></select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Product code</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="product code" id="txt_productCode" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Product name</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="Product Name" id="txt_productName" />
        </div>
    </div>
   <div class="form-group">
        <label class="col-md-3 control-label">Đơn vị</label>
         <div class="col-md-9">
             <input type="text" class="form-control" name="Don vi" id="txt_donVi" />
           </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Giá</label>
         <div class="col-md-9">
         <input type="text" class="form-control" name="gia" id="txt_gia" />
             </div>
    </div> 
    <div class="form-group">
        <label class="col-md-3 control-label">User tạo</label>
         <div class="col-md-9">
             <select class="form-control" id="userid"></select>
           </div>
    </div>     
    
    <div class="form-group">
        <div class="col-md-12 col-md-offset-3">
            <div style="display:inline-block"><button type="button" class="btn btn-primary" id="btnSave">Lưu</button></div>
            <div style="display:inline-block"><button type="button" class="btn btn-primary" id="btnBack">Quya lại</button></div>
        </div>
    </div>
</div>
   <script>

       $(document).ready(function () {
           // load data khi edit
           var idParam = getQueryVariable("paramId");
           // funtion get
           if (idParam) {
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
           // Load Data Bộ phận
           var formData = new FormData();
           var formDataOrg = new FormData();
           formDataOrg.append('type', 'getDataOrg');
           formDataOrg.append('data', '1');
           $.ajax({
               url: "Configuation/HandlerSysUser.ashx",
               type: "POST",
               data: formDataOrg,
               contentType: false,
               processData: false,
               success: function (result) {
                   var jsonData = result;
                   var arr = [];
                   if (jsonData && jsonData.length > 0) {
                       for (var i = 0; i < jsonData.length ; i++) {
                           var objectData = jsonData[i];
                           var obj = {};
                           obj.name = objectData.Name;
                           obj.link = objectData.ID;
                           obj.sub = null;
                           arr.push(obj);
                       }
                   }
                   var data2 = { menu: arr };
                   var $menu = $("#orgId");
                   $.each(data2.menu, function () {
                       $menu.append(
                           getOrg(this)
                       );
                   });
               },
               error: function (err) {

               }
           });

           // select box cơ sở   
           var getOrg = function (itemData) {
               var item = $("<option value='" + itemData.link + "'>")
                   .append(itemData.name);
               return item;
           };

           // Load Data user
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
                   var $menu = $("#userid");
                   $.each(data.menu, function () {
                       $menu.append(
                           getUser(this)
                       );
                   });
               },
               error: function (err) {

               }
           });

           // select box user  
           var getUser = function (itemData) {
               var item = $("<option value='" + itemData.link + "'>")
                   .append(itemData.name);
               return item;
           };

           //$menu.menu();

           function testFunction(data) {
               return data.valid;
           }
           $('#btnBack').on('click', function (e) {
               window.location = '/C008_Product.aspx?paramId= 0';
           });
           // Event Thêm mới
           $('#btnSave').on('click', function (e) {
               var idParam = getQueryVariable("paramId");
               // funtion get
               if (idParam) {
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


           $('#contactForm').bootstrapValidator({
               container: '#messages',
               feedbackIcons: {
                   valid: 'glyphicon glyphicon-ok',
                   invalid: 'glyphicon glyphicon-remove',
                   validating: 'glyphicon glyphicon-refresh'
               },
               fields: {
                   userName: {
                       validators: {
                           notEmpty: {
                               message: 'The full name is required and cannot be empty'
                           }
                       }
                   },
                   email: {
                       validators: {
                           notEmpty: {
                               message: 'The email address is required and cannot be empty'
                           },
                           emailAddress: {
                               message: 'The email address is not valid'
                           }
                       }
                   },
                   passWord: {
                       validators: {
                           notEmpty: {
                               message: 'The title is required and cannot be empty'
                           },
                           stringLength: {
                               max: 8,
                               message: 'The title must be less than 8 characters long'
                           }
                       }
                   },
                   content: {
                       validators: {
                           notEmpty: {
                               message: 'The content is required and cannot be empty'
                           },
                           stringLength: {
                               max: 500,
                               message: 'The content must be less than 500 characters long'
                           }
                       }
                   }
               }
           });
       });
   </script>
    
</asp:Content>
