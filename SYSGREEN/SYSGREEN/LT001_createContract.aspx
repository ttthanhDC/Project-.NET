<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Main.Master" CodeFile="LT001_createContract.aspx.cs" Inherits="SYSGREEN.LT001_createContract" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   <script>
       $(document).ready(function () {
           // Load Data Bộ phận
           var data = {
               menu: [{
                   name: 'Facebooc',
                   link: '1',
                   sub: null
               }, {
                   name: 'Web',
                   link: '2',
                   sub: null
               }
               ]
           };
          
           // select box phòng ban
           var getDept = function (itemData) {
               var item = $("<option value='" + itemData.link + "'>")
                   .append(itemData.name);
               return item;
           };

           var $menu = $("#sourceId");
           $.each(data.menu, function () {
               $menu.append(
                   getDept(this)
               );
           });
          

           // Event Thêm mới
           $('#btnSave').on('click', function (e) {
               var formData = new FormData();
               var txt_fullname = $('#txt_fullname').val();
               var txt_title = $('#txt_title').val();
               var txt_email = $('#txt_email').val();
               var sourceId = $('#sourceId').val();
               sourceId = parseInt(sourceId);
               var txt_comment = $('#txt_comment').val();
               //orgId = parseInt(orgId);
               //formData.append('data', "{Dept_Name:'abc',Dept_Description:'mieuta','Create_User':'thanhdc7'}");
               var json = { 'UserName': user, 'Password': pass, 'Email': email, 'DeptId': deptId, 'OrgId': orgId, 'Create_User': 'admin' };
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



           var formData = new FormData();
           function testFunction(data) {
               return data.valid;
           }
           jQuery.ajaxSetup({ async: true });
           formData.append('type', 'insert');
           $('#contactForm').bootstrapValidator({
               container: '#messages',
               feedbackIcons: {
                   valid: 'glyphicon glyphicon-ok',
                   invalid: 'glyphicon glyphicon-remove',
                   validating: 'glyphicon glyphicon-refresh'
               },
               fields: {
                   fullName: {
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
                   title: {
                       validators: {
                           notEmpty: {
                               message: 'The title is required and cannot be empty'
                           },
                           stringLength: {
                               max: 100,
                               message: 'The title must be less than 100 characters long'
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
        <label class="col-md-3 control-label">Họ và tên</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="fullName" id ="txt_fullname" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">SĐT</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="title" id="txt_title" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Email</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="email" id ="txt_email" />
        </div>
    </div>
   <div class="form-group">
        <label class="col-md-3 control-label">Nguồn</label>
        <div class="col-md-9">
             <select class="form-control" id="sourceId"></select>
           </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Ghi chú</label>
        <div class="col-md-9">
            <textarea class="form-control" name="content" rows="5" id ="txt_comment"></textarea>
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
            <button type="submit" class="btn btn-default">Tiếp</button>
        </div>
    </div>
</div>
</asp:Content>
