<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Main.Master" CodeBehind="AddUserToGorup.aspx.cs" Inherits="SYSGREEN.AddUserToGorup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div id="contactForm"  class="form-horizontal" style ="text-align:center;margin-left:30px; margin-right:30px" >
        <div style ="height : 70px"></div>
        <div class="form-group">
            <label class="col-md-3 control-label">User</label>
            <div class="col-md-9">
             <select class="form-control" id="userID">
                 <option>1</option>
                 <option>2</option>
                 <option>3</option>
                 <option>4</option>
             </select>

           </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Roles</label>
            <div class="col-md-9">
             <select class="form-control" id="roleID">
                 <option>1</option>
                 <option>2</option>
                 <option>3</option>
                 <option>4</option>
             </select>
                
           </div>
        </div>
        <div class="form-group">
            <div class="col-md-9">
              <button type="submit" class="btn btn-default" id="btSave">Lưu</button>
           </div>
        </div>
    </div>
     <script>

         $(document).ready(function () {
             // Event Thêm mới
             $('#btSave').on('click', function (e) {
                 var formData = new FormData();
                 //orgId = parseInt(orgId);
                 var json = {
                     'Company_Name_Vi': $('#txt_nameFunction').val(),
                     'Company_Name_Short': $('#txt_txt_descriptionsdecp').val(),
                 };

                 alert(json);
                 jQuery.ajaxSetup({ async: true });
                 formData.append('type', 'insert');
                 formData.append('data', JSON.stringify(json));
                 $.ajax({
                     url: "Configuation/HandlerSysCompany.ashx",
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
         });
   </script>
    </asp:Content>



