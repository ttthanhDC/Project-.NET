<%@ Page Title="Demo Page" Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"  CodeBehind="C005_CompanyInformation.aspx.cs" Inherits="SYSGREEN.Demo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div style ="text-align:center">
        <div style ="height:50px"></div>
            <div class="row">
                <div class="col-md-3">
                    Tên cty
                </div>
                <div class="col-md-3">
                    <textarea class="form-control" rows="1" id="txt_CompanyName"></textarea>
                </div>
                <div class="col-md-3">
                    Logo
                </div>
                <div class="col-md-3">
                   <input type="text" class="form-control" id="txt_CompanyLogo" disabled ="true">
                </div>
            </div> 
         <div class="row">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Tên viết tắt
                </div>
                <div class="col-md-3">
                    <textarea class="form-control"  id="txt_CompanyAcount"></textarea>
                </div>
                <div class="col-md-3">
                    Email
                </div>
                <div class="col-md-3">
                    <textarea class="form-control"  id="txt_CompanyEmail"></textarea>
                </div>
          </div> 
         <div class="row">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Tên tiếng anh
                </div>
                <div class="col-md-3">
                    <textarea class="form-control"  id="txt_CompanyEnglish"></textarea>
                </div>
                <div class="col-md-3">
                    Địa chỉ
                </div>
                <div class="col-md-3">
                    <textarea class="form-control" id="txt_CompanyAdress"></textarea>
                </div>
               
          </div> 
         <div class="row">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Mã số thuế
                </div>
                <div class="col-md-3">
                 <input type="text" class="form-control" id="txt_CompanyTax">
                </div>
                <div class="col-md-3">
                    SĐT
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="txt_CompanyPhone">
                </div>
          </div> 
         <div class="row">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Tài khoản ngân hàng
                </div>
                <div class="col-md-3">
                 <input type="text" class="form-control" id="txt_BankAcount">
                </div>
                <div class="col-md-3">
                    Giá trị được freeship
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="txt_PriceFreeship">
                </div>
          </div> 
           <div class="row">
               <div class="col-md-12">
                   <div style ="height:40px"></div>
                   <div style ="text-align:center;display: table;margin: 0 auto;">
                        <button type="button" class="btn btn-primary" id="btSave">Lưu</button>
                   </div>
                </div>
           </div>
    </div>
     <script>

         $(document).ready(function () {
             // Event Thêm mới
             $('#btSave').on('click', function (e) {
                 var formData = new FormData();
                 //orgId = parseInt(orgId);
                 //formData.append('data', "{Dept_Name:'abc',Dept_Description:'mieuta','Create_User':'thanhdc7'}");
                 var json = {
                     'Company_Name_Vi': $('#txt_CompanyName').val(),
                     'Company_Name_Short': $('#txt_CompanyAcount').val(),
                     'Email': $('#txt_CompanyEmail').val(),
                     'Company_Name_EN': $('#txt_CompanyEnglish').val(),
                    // 'txt_CompanyAdress': "chưa có",//$('#txt_CompanyAdress').val(),TODO
                     'Tax_Code': $('#txt_CompanyTax').val(),
                     'Phone_Number': $('#txt_CompanyPhone').val(),
                     'Bank_Account': $('#txt_BankAcount').val(),
                     'Amount_Freeship': $('#txt_PriceFreeship').val(),
                     'Logo': 'none'
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


