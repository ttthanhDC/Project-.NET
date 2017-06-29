<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="CreateRole.aspx.cs" Inherits="SYSGREEN.CreateRole" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   <script>
      
       $(document).ready(function () {
           // Load Data Bộ phận
           var formData = new FormData();
           var formDataDept = new FormData();
           var formDataOrg = new FormData();
           formDataDept.append('type', 'getDataDept');
           formDataDept.append('data', '1');
           formDataOrg.append('type', 'getDataOrg');
           formDataOrg.append('data', '1');
           $.ajax({
               url: "Configuation/HandlerSysUser.ashx",
               type: "POST",
               data: formDataDept,
               contentType: false,
               processData: false,
               success: function (result) {
                   var jsonData = result;
                   var arr = [];
                   if (jsonData && jsonData.length > 0) {
                       for (var i = 0; i < jsonData.length ; i++) {
                           var objectData = jsonData[i];
                           var obj = {};
                           obj.name = objectData.Dept_Name;
                           obj.link = objectData.ID;
                           obj.sub = null;
                           arr.push(obj);
                       }
                   }
                   var data1 = { menu: arr };
                   var $menu = $("#deptID");
                   $.each(data1.menu, function () {
                       $menu.append(
                           getDept(this)
                       );
                   });
               },
               error: function (err) {

               }
           });

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
                   var $menu = $("#orgID");
                   $.each(data2.menu, function () {
                       $menu.append(
                           getOrg(this)
                       );
                   });
               },
               error: function (err) {

               }
           });
           
           // select box phòng ban
           var getDept = function (itemData) {
               var item = $("<option value='"+itemData.link+"'>")
                   .append(itemData.name);
               return item;
           };

           // select box cơ sở   
           var getOrg = function (itemData) {
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
               var formData = new FormData();
               var user = $('#txtNhomquyen').val();
               var pass = $('#txtPassword').val();
               var email = $('#txtEmail').val();
               var deptId = $('#deptID').val();
               deptId = parseInt(deptId);
               var orgId = $('#orgID').val();
               orgId = parseInt(orgId);
               //formData.append('data', "{Dept_Name:'abc',Dept_Description:'mieuta','Create_User':'thanhdc7'}");
               var json = { 'RoleName': user, 'Password': pass, 'Email': email, 'DeptId': deptId, 'OrgId': orgId, 'Create_User': 'admin' };
               jQuery.ajaxSetup({ async: true });
               formData.append('type', 'insert');
               formData.append('data', JSON.stringify(json));
               $.ajax({
                   url: "Configuation/HandlerSysUser.ashx",
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
           });
          
           $('#contactForm').bootstrapValidator({
               container: '#messages',
               feedbackIcons: {
                   valid: 'glyphicon glyphicon-ok',
                   invalid: 'glyphicon glyphicon-remove',
                   validating: 'glyphicon glyphicon-refresh'
               },
               fields: {
                   txtNhomquyen: {
                       validators: {
                           notEmpty: {
                               message: 'Tên nhóm quyền bắt buộc và không được để trống'
                           }
                       }
                   },
                   txtUserName: {
                       validators: {
                           notEmpty: {
                               message: ''
                           },
                          
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
        <label class="col-md-3 control-label">Tên nhóm quyền</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="txtNhomquyen" id="txtNhomquyen" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">User Tạo</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="txtUserName" id="txtUserName" />
        </div>
    </div>
    <!-- #messages is where the messages are placed inside -->
    <div class="form-group">
        <div class="col-md-12 col-md-offset-3">
            <div id="messages"></div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12 col-md-offset-3">
            <button type="submit" class="btn btn-default" id="btnSave">Lưu</button>
        </div>
    </div>
</div>
</asp:Content>
