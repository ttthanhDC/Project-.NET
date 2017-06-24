<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SYSGREEN.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
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
        <label class="col-md-3 control-label">Full name</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="fullName" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Email</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="email" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Title</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="title" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Content</label>
        <div class="col-md-9">
            <textarea class="form-control" name="content" rows="5"></textarea>
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
            <button type="submit" class="btn btn-default">Validate</button>
        </div>
    </div>
</div>
</asp:Content>
