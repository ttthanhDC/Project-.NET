<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Main.Master" CodeBehind="KT002_Detail.aspx.cs" Inherits="SYSGREEN.KT002_Detail" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   <div style ="text-align:center">
        <div style ="height:50px"></div>
            <div class="row">
                <div class="col-md-3">
                   Ngày
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="txt_ngay">
                </div>
            </div> 
       
         <div class="row" id="div_number">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Số tiền
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control"  id="txt_monny">
                </div>
          </div> 
         <div class="row" id="div_date">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                   Tài khoản chi
                </div>
                <div class="col-md-3">
                    <select class="form-control" id="txt_status"> 
                        <option value = 0 ></option>
                        <option value = 1 >Đã nhận tiền</option>
                         <option value = 2 >Chưa nhận tiền</option>
                    </select>
                </div>
          </div> 
         <div class="row">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Ghi chú
                </div>
                <div class="col-md-3">
                 <textarea class="form-control" id="txt_GhiChu"></textarea>
                </div>
          </div> 
           <div class="row">
               <div class="col-md-8">
                   <div style ="height:20px"></div>
                   <div style ="text-align:center;display: table;margin: 0 auto;">
                        <div style="margin-right: 20px; display:inline-block" ><button type="button" class="btn btn-primary" id="btSave">Lưu</button></div>
                      <div style="display:inline-block"> <button type="button" class="btn btn-primary" id="btBack">Quay lại</button></div>
                   </div>
                </div>
           </div>
    </div>
<script>
    $(document).ready(function () {
        window.id = 0;

        //alert("Data" + window.idParam);
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) {
                    return pair[1];
                }
            }
        }
        window.id = getQueryVariable("id");
      
        // event 
        $('#btBack').on('click', function (e) {
            window.location = '/KT002_ReceiveMoneyCash.aspx?paramId= 0';
        });
        // save
        $('#btSave').on('click', function (e) {
           
            // function update
            var formData = new FormData();
            formData.append('type', 'InsertChiTietThuTMReturnId');
            var json = { 'ID': 0 };
            formData.append('data', JSON.stringify(json));
            var date = "";
            if ($('#txt_ngay').val()) {
                var y = $('#txt_ngay').val().split("/");
                var y1 = y[0];
                var y2 = y[1];
                var y3 = y[2];
                date = y2 + "/" + y1 + "/" + y3;
            }
            formData.append('Ngay', date);
            formData.append('SoTien', $('#txt_monny').val());
            formData.append('MaGiaoDich', "");
            formData.append('LoaiThu', "1");
            formData.append('GhiChu', $('#txt_GhiChu').val());
            formData.append('IdKeToan', "0");
            formData.append('IdNgayHD', "0");
            formData.append('MaNganHang', '6');
            formData.append('ID', '0');
            formData.append('TinhTrang', $('#txt_status').val());

            $.ajax({
                url: "Configuation/HandlerKeToan.ashx",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function (result) {
                    window.id = result;
                    alert("Sửa thành công");

                },
                error: function (err) {
                }
            });
        });
    });
</script>
    </asp:Content>



