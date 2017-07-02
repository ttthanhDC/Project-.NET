<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="AddFunction.aspx.cs" Inherits="SYSGREEN.AddFunction" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div id="contactForm"  class="form-horizontal" style ="text-align:center;margin-left:30px; margin-right:30px" >
        <div style ="height : 70px"></div>
        <div class="form-group">
            <label class="col-md-3 control-label">Tên Function</label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="name" id="txt_nameFunction" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Mô tả</label>
            <div class="col-md-9">
                <textarea class="form-control" rows="5" name="descriptions" id="txt_descriptions"></textarea>
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


