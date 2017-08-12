<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="S007_ManagerShiper.aspx.cs" Inherits="SYSGREEN.S007_ManagerShiper" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <div style ="text-align:center">
        <div style ="height:50px"></div>
            <div class="row">
                <div class="col-md-3">
                   Ship name
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="txt_shipname">
                </div>
            </div> 
         <div class="row" id="div_number">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Ship number
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control"  id="txt_shipnumber" disabled ="disabled">
                </div>
          </div> 
         <div class="row" id="div_date">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Ngày tạo
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control"  id="txt_date" disabled ="disabled">
                </div>
          </div> 
        <div class="row">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Số điện thoại
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control"  id="txt_phone">
                </div>
          </div> 
         <div class="row">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Địa chỉ 
                </div>
                <div class="col-md-3">
                 <textarea class="form-control" id="txt_adsress"></textarea>
                </div>
          </div> 
         <div class="row">
                <div style ="height:10px"></div>
                <div class="col-md-3">
                    Mô tả
                </div>
                <div class="col-md-3">
                 <textarea class="form-control" id="txt_desc"></textarea>
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
        if (window.id === "Add") {
            $('#div_number')[0].style.display = "none";
            $('#div_date')[0].style.display = "none";
        } else {
           /* window.shipNo = getQueryVariable("shipNo").replace(/%20/g, " ");
            window.shipName = getQueryVariable("shipName").replace(/%20/g, " ");
            window.adress = getQueryVariable("adress").replace(/%20/g, " ");
            window.date = getQueryVariable("date").replace(/%20/g, " ");
            window.desc = getQueryVariable("desc").replace(/%20/g, " ");
            window.phone = getQueryVariable("phone");*/

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
                    $('#txt_shipname').val(obj.NAME);
                    if (obj.NUMBER) {
                        $('#txt_shipnumber').val(obj.NUMBER);
                    } else {
                        if (window.id < 10) {
                            $('#txt_shipnumber').val("S00" + window.id);
                        } else {
                            $('#txt_shipnumber').val("S0" + window.id);
                        }
                    }
                    $('#txt_adsress').val(obj.DiaChi);
                    $('#txt_desc').val(obj.DESCRIPTION);
                    $('#txt_phone').val(obj.SoDienThoai);
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
                    $('#txt_date').val(z);

                },
                error: function (err) {
                }
            });
            // 
           
        }
        // event 
        $('#btBack').on('click', function (e) {
            window.location = '/S006_ListShiper.aspx?paramId= 0';
        });
        // save
        $('#btSave').on('click', function (e) {
            if (window.id > 0) {
                // function save
                var formDataSave = new FormData();
                formDataSave.append('type', 'UpdateShipperReturnId');
                var json = { 'ID': 0 };
                formDataSave.append('data', JSON.stringify(json));
                formDataSave.append('NAME', $('#txt_shipname').val());
                formDataSave.append('DiaChi', $('#txt_adsress').val());
                formDataSave.append('SoDienThoai', $('#txt_phone').val());
                formDataSave.append('DESCRIPTION', $('#txt_desc').val());
                formDataSave.append('Shipe_ID', window.id);
                $.ajax({
                    url: "Configuation/HandlerShipper.ashx",
                    type: "POST",
                    data: formDataSave,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        window.id = result;
                        alert("Sửa shiper thành công");
                        
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
                formDataSave.append('NAME', $('#txt_shipname').val());
                formDataSave.append('DiaChi', $('#txt_adsress').val());
                formDataSave.append('SoDienThoai', $('#txt_phone').val());
                formDataSave.append('DESCRIPTION', $('#txt_desc').val());

                $.ajax({
                    url: "Configuation/HandlerShipper.ashx",
                    type: "POST",
                    data: formDataSave,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        alert("Tạo shiper thành công");
                    },
                    error: function (err) {
                    }
                });
            }
        });
    });
</script>
    </asp:Content>

