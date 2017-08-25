﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="K006_Detail.aspx.cs" Inherits="SYSGREEN.K006_Detail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
<div id="contactForm"  class="form-horizontal">
   <div class="form-group">
        <label class="col-md-3 control-label">Mã</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_ma" />
        </div>
   </div> 
    <div class="form-group">
        <label class="col-md-3 control-label">Tên</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_ten" />
        </div>
   </div> 
    <div class="form-group">
        <label class="col-md-3 control-label">SĐT</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_sdt" />
        </div>
   </div> 
    <div class="form-group">
        <label class="col-md-3 control-label">Tỉnh</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_tinh" />
        </div>
   </div> 
    
   <div class="form-group">
        <label class="col-md-3 control-label">Địa chỉ</label>
         <div class="col-md-9">
             <textarea class="form-control"  id="txt_diaChi"></textarea>
         </div>
    </div>
     <div class="form-group">
        <label class="col-md-3 control-label">Loại dịch vụ</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="tile" id="txt_loai" />
        </div>
   </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Ghi chú</label>
         <div class="col-md-9">
             <textarea class="form-control"  id="txt_ghiChu"></textarea>
         </div>
    </div>
    <div class="form-group">
        <div id="div_ngay">
            <label class="col-md-3 control-label">Ngày tạo</label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="tile" id="txt_ngay" disabled ="disabled"/>
            </div>
        </div>
   </div>
    <div class="form-group">
        <div id="div_user">
            <label class="col-md-3 control-label">Người tạo</label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="tile" id="cbUser" disabled ="disabled" />
            </div>
        </div>
        
   </div>
 </div> 
    <div class="form-group">
        <div class="col-md-12 col-md-offset-3">
            <div style="display:inline-block"><button type="button" class="btn btn-primary" id="btnSave">Lưu</button></div>
            <div style="display:inline-block"><button type="button" class="btn btn-primary" id="btnBack">Quay lại</button></div>
        </div>
    </div>
   <script>
       $(function () {
           window.id = 0;
           window.idParam = 0;
           window.idParam = getQueryVariable("paramId");
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

           if (window.idParam === "ADD") {
               $('#div_ngay')[0].style.display = "none";
               $('#div_user')[0].style.display = "none";
           } else {
               $('#div_ngay')[0].style.display = "block";
               $('#div_user')[0].style.display = "block";
               $('#txt_ma')[0].disabled = true;
               var data = [];
               var formDatasearch = new FormData();
               formDatasearch.append('type', 'viewNhaCungCap');

               formDatasearch.append('MaNCC', window.idParam);
               formDatasearch.append('TenNCC', "");
               formDatasearch.append('SoDT',"");
               formDatasearch.append('Tinh',"");
               formDatasearch.append('LoaiDichVu',"");
               $.ajax({
                   url: "Configuation/HandlerKhoServices.ashx",
                   type: "POST",
                   data: formDatasearch,
                   contentType: false,
                   processData: false,
                   success: function (result) {
                       
                       var jsonData = result;
                       var arr = [];
                       if (jsonData && jsonData.length > 0) {
                           for (var i = 0; i < jsonData.length ; i++) {
                               var objectData = jsonData[i];
                               window.id = objectData.ID;
                               $('#txt_ma').val(objectData.MaNCC);
                               $('#txt_ten').val(objectData.TenNCC);
                               $('#txt_sdt').val(objectData.SoDT);
                               $('#txt_tinh').val(objectData.Tinh);
                               $('#txt_diaChi').val(objectData.DiaChi);
                               $('#txt_loai').val(objectData.LoaiDichVu);
                               $('#txt_ghiChu').val(objectData.GhiChu);
                               var data_ngay = objectData.NgayTao;
                               var z = "";
                               if (data_ngay) {
                                   var x = data_ngay.substr(0, 10);
                                   var y = x.split("-");
                                   var y1 = y[0];
                                   var y2 = y[1];
                                   var y3 = y[2];
                                   z = y3 + "/" + y2 + "/" + y1;
                               }
                               $('#txt_ngay').val(z);
                               //$('#txt_ngay').val(objectData.NgayTao);
                               $('#cbUser').val(objectData.NguoiTao);
                           }
                       }
                   },
                   error: function (err) {
                   }
               });
           }
       });
       $('#btnBack').on('click', function (e) {
           window.location = '/K006_Supplier.aspx?paramId= 0';
       });
       // Event Thêm mới
       $('#btnSave').on('click', function (e) {
           if (window.idParam === "ADD") {
               // update
               var formData = new FormData();
               var json = {
                   'ID': 0,
                   'MaNCC': $('#txt_ma').val(),
                   'TenNCC': $('#txt_ten').val(),
                   'SoDT': $('#txt_sdt').val(),
                   'Tinh': $('#txt_tinh').val(),
                   'DiaChi': $('#txt_diaChi').val(),
                   'LoaiDichVu': $('#txt_loai').val(),
                   'GhiChu': $('#txt_ghiChu').val(),
               };
               jQuery.ajaxSetup({ async: true });
               formData.append('type', 'insertOrUpdateNhaCungCap');
               formData.append('data', JSON.stringify(json));
               $.ajax({
                   url: "Configuation/HandlerKhoServices.ashx",
                   type: "POST",
                   data: formData,
                   contentType: false,
                   processData: false,
                   success: function (result) {
                       if (result === -1 || result === (-1)) {
                           alert("Mã nhà cung cấp đã tồn tại trên hệ thống. Vui lòng nhập mã nhà cung cấp khác.");
                       } else {
                           alert("Lưu thành công.");
                           $('#btnSave')[0].disabled = true;
                       }
                   },
                   error: function (err) {

                   }
               });
           } else {
               // insert
              
               var formData = new FormData();
               var json = {
                   'ID': window.id,
                   'MaNCC': $('#txt_ma').val(),
                   'TenNCC': $('#txt_ten').val(),
                   'SoDT': $('#txt_sdt').val(),
                   'Tinh': $('#txt_tinh').val(),
                   'DiaChi': $('#txt_diaChi').val(),
                   'LoaiDichVu': $('#txt_loai').val(),
                   'GhiChu': $('#txt_ghiChu').val(),
               };
               jQuery.ajaxSetup({ async: true });
               formData.append('type', 'insertOrUpdateNhaCungCap');
               formData.append('data', JSON.stringify(json));
               $.ajax({
                   url: "Configuation/HandlerKhoServices.ashx",
                   type: "POST",
                   data: formData,
                   contentType: false,
                   processData: false,
                   success: function (result) {
                       alert("Sửa thành công.");
                   },
                   error: function (err) {

                   }
               });
           }
       });
   </script>
    
</asp:Content>



