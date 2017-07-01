<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddRole.aspx.cs" Inherits="SYSGREEN.AddRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <script>

         $(document).ready(function () {
             function testFunction(data) {
                 return data.valid;
             }

             // Event Thêm mới
             $('#btnSave').on('click', function (e) {
                 var formData = new FormData();
                 var RoleName = $('#txtNhomquyen').val();
                 var json = { 'RoleName': RoleName, 'Create_User': '' };
                 jQuery.ajaxSetup({ async: true });
                 formData.append('type', 'insert');
                 formData.append('data', JSON.stringify(json));
                 $.ajax({
                     url: "Configuation/HandlerSysRole.ashx",
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
