<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="managerPoromotion.aspx.cs" Inherits="SYSGREEN.managerPoromotion" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
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
                   url: "Configuation/HandlerSysPromotion.ashx",
                   type: "POST",
                   data: formDataListUser,
                   contentType: false,
                   processData: false,
                   success: function (result) {
                       var jsonData = result;
                       if (jsonData && jsonData.length > 0) {
                           for (var i = 0; i < jsonData.length ; i++) {
                               var objectData = jsonData[i];
                               $('#orgId').val(objectData.ORG_ID);
                               $('#txt_min').val(objectData.Min);
                               $('#txt_max').val(objectData.Max);
                               $('#date_bigin').val(objectData.Date_Start);
                               $('#date_end').val(objectData.Date_End);
                               $('#txt_code').val(objectData.Code);
                               $('#txt_name').val(objectData.Name);
                               $('#txt_percent').val(objectData.Promotion_Percent);
                               $('#txt_amount').val(objectData.Amount_VND);
                               $('#txt_freeShip').val(objectData.Amount_FreeShip);
                               $('#date_create').val(objectData.Create_Date);
                               // $('#Create_User').val(objectData.Create_User);
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



           // Event Thêm mới
           $('#btnSave').on('click', function (e) {
               var idParam = getQueryVariable("paramId");
               // funtion get
               if (idParam) {
                   // update
                   var formData = new FormData();
                   var json = {
                       'ID': parseInt(idParam + ""),
                       'Min': $('#txt_min').val(),
                       'Max': $('#txt_max').val(),
                       'Date_Start': $('#date_bigin').val(),
                       'Date_End': $('#date_end').val(),
                       'ORG_ID': parseInt($('#orgId').val() + ""),
                       'Code': $('#txt_code').val(),
                       'Name': $('#txt_name').val(),
                       'Promotion_Percent': $('#txt_percent').val(),
                       'Amount_VND': $('#txt_amount').val(),
                       //'ORG_ID': parseInt($('#userid').val() + ""),
                       'Amount_FreeShip': $('#txt_freeShip').val(),
                       //'Create_Date': $('#date_create').val(),
                       //'Create_User': 'admin'
                       //userid
                   };
                   jQuery.ajaxSetup({ async: true });
                   formData.append('type', 'update');
                   formData.append('data', JSON.stringify(json));
                   $.ajax({
                       url: "Configuation/HandlerSysPromotion.ashx",
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
                       'Min': $('#txt_min').val(),
                       'Max': $('#txt_max').val(),
                       'Date_Start': $('#date_bigin').val(),
                       'Date_End': $('#date_end').val(),
                       'ORG_ID': parseInt($('#orgId').val() + ""),
                       'Code': $('#txt_code').val(),
                       'Name': $('#txt_name').val(),
                       'Promotion_Percent': $('#txt_percent').val(),
                       'Amount_VND': $('#txt_amount').val(),
                       //'ORG_ID': parseInt($('#userid').val() + ""),
                       'Amount_FreeShip': $('#txt_freeShip').val(),
                       'Create_Date': $('#date_create').val(),
                       'Create_User': $('#userid').val(),
                       //userid
                   };
                   jQuery.ajaxSetup({ async: true });
                   formData.append('type', 'insert');
                   formData.append('data', JSON.stringify(json));
                   $.ajax({
                       url: "Configuation/HandlerSysPromotion.ashx",
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
    <div id="contactForm"  class="form-horizontal">
    <div class="form-group">
        <label class="col-md-3 control-label">Cơ sở</label>
        <div class="col-md-9">
             <select class="form-control" id="orgId"></select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Min</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="min" id="txt_min" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Max</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="max" id="txt_max" />
        </div>
    </div>
   <div class="form-group">
        <label class="col-md-3 control-label">Ngày bắt đầu</label>
        <div class="col-md-9">
           <input type="date" class="form-control" name="bigin date" id="date_bigin" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Ngày kết thúc</label>
        <div class="col-md-9">
            <input type="date" class="form-control" name="end date" id="date_end" />
        </div>
    </div> 
    <div class="form-group">
        <label class="col-md-3 control-label">Mã</label>
        <div class="col-md-9">
             <input type="text" class="form-control" name="code" id="txt_code" />
        </div>
    </div> 
        <div class="form-group">
        <label class="col-md-3 control-label">Tên</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="name" id="txt_name" />
        </div>
    </div> 
          <div class="form-group">
        <label class="col-md-3 control-label">%</label>
        <div class="col-md-9">
            <input type="number" class="form-control" name="percent" id="txt_percent" />
        </div>
    </div> 
    <div class="form-group">
        <label class="col-md-3 control-label">Vnđ</label>
        <div class="col-md-9">
            <input type="number" class="form-control" name="amount" id="txt_amount" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Ngày tạo</label>
        <div class="col-md-9">
            <input type="date" class="form-control" name="create date" id="date_create" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Free ship</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="freeShip" id="txt_freeShip" />
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
            <button type="button" class="btn btn-primary" id="btnSave">Lưu</button>
        </div>
    </div>
    </div>
</asp:Content>
