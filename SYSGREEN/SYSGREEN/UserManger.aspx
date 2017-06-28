<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="UserManger.aspx.cs" Inherits="SYSGREEN.UserManger" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   <script>
       $(document).ready(function () {
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
        <label class="col-md-3 control-label">UserName</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="userName" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Password</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="passWord" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Email</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="email" />
        </div>
    </div>
   <div class="form-group">
        <label class="col-md-3 control-label">Phòng ban</label>
        <div class="col-md-9">
                <select class="form-control" id="depID">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Cơ sở</label>
        <div class="col-md-9">
                <select class="form-control" id="orgID">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                </select>
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
            <button type="submit" class="btn btn-default">Lưu</button>
        </div>
    </div>
</div>
</asp:Content>
