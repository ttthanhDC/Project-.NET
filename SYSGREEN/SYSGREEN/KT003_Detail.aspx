<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Main.Master" CodeBehind="KT003_Detail.aspx.cs" Inherits="SYSGREEN.KT003_Detail" %>

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
       <div class="row">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Nội dung chi
                </div>
                <div class="col-md-3">
                   <textarea class="form-control"  id="txt_NDC"></textarea>
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
                    <select class="form-control" id="txt_TkChi"> 
                        <option value = 0 ></option>
                        <option value = 1 >VCB</option>
                        <option value = 2 >BIDV</option>
                        <option value = 3 >TCB</option>
                        <option value = 4 >VP</option>
                        <option value = 5 >VPDN</option>
                        <option value = 6 >Tiền mặt</option>
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
        if (window.id !== "Add") {
            var formDataSave = new FormData();
            formDataSave.append('type', 'getDataShipper');
            var json = { 'ID': 0 };
            formDataSave.append('data', JSON.stringify(json));
            formDataSave.append('Shipe_ID', window.id);
            formDataSave.append('NAME', "");
            $.ajax({
                url: "Configuation/HandlerShipper.ashx",
                type: "POST",
                data: formDataSave,
                contentType: false,
                processData: false,
                success: function (result) {
                    var obj = result[0];
                    $('#txt_NDC').val(obj.NAME);
                    $('#txt_monny').val(obj.DiaChi);
                    $('#txt_TkChi').val(obj.DESCRIPTION);
                    $('#txt_GhiChu').val(obj.SoDienThoai);
                    var data_ngay = obj.NgayTao;
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

                },
                error: function (err) {
                }
            });
            // 

        }
        // event 
        $('#btBack').on('click', function (e) {
            window.location = '/KT003_TotalExpenditure.aspx?paramId= 0';
        });
        // save
        $('#btSave').on('click', function (e) {
            if (window.id > 0) {
                // function save
                var formDataSave = new FormData();
                formDataSave.append('type', 'UpdateShipperReturnId'); 
                var json = { 'ID': 0 };
                formDataSave.append('data', JSON.stringify(json));
                formDataSave.append('NAME', $('#txt_ngay').val());
                formDataSave.append('DiaChi', $('#txt_NDC').val());
                formDataSave.append('SoDienThoai', $('#txt_monny').val());
                formDataSave.append('DESCRIPTION', $('#txt_TkChi').val());
                formDataSave.append('DESCRIPTION', $('#txt_GhiChu').val());
                formDataSave.append('Shipe_ID', window.id);
                $.ajax({
                    url: "Configuation/HandlerShipper.ashx",
                    type: "POST",
                    data: formDataSave,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        window.id = result;
                        alert("Sửa thành công");

                    },
                    error: function (err) {
                    }
                });
            } else {
                // function update
                var formDataSave = new FormData();
                formDataSave.append('type', 'InsertShipperReturnId');
                var json = { 'ID': 0 };
                formDataSave.append('data', JSON.stringify(json));
                formDataSave.append('NAME', $('#txt_ngay').val());
                formDataSave.append('DiaChi', $('#txt_NDC').val());
                formDataSave.append('SoDienThoai', $('#txt_monny').val());
                formDataSave.append('DESCRIPTION', $('#txt_TkChi').val());
                formDataSave.append('DESCRIPTION', $('#txt_GhiChu').val());

                $.ajax({
                    url: "Configuation/HandlerShipper.ashx",
                    type: "POST",
                    data: formDataSave,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        alert("Tạo thành công");
                    },
                    error: function (err) {
                    }
                });
            }
        });
    });
</script>
    </asp:Content>


