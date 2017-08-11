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
                        <button type="button" class="btn btn-primary" id="btSave">Lưu</button>
                       <button type="button" class="btn btn-primary" id="btBack">Quay lại</button>
                   </div>
                </div>
           </div>
    </div>
<script>
    $(document).ready(function () {
        window.shipNo = "";
        window.shipName = "";
        window.adress = "";
        window.date = "";
        window.desc = "";
        window.id = "";

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
        if (window.id === "Add") {
            $('#div_number')[0].style.display = "none";
            $('#div_date')[0].style.display = "none";
        } else {
            window.shipNo = getQueryVariable("shipNo").replace(/%20/g, " ");
            window.shipName = getQueryVariable("shipName").replace(/%20/g, " ");
            window.adress = getQueryVariable("adress").replace(/%20/g, " ");
            window.date = getQueryVariable("date").replace(/%20/g, " ");
            window.desc = getQueryVariable("desc").replace(/%20/g, " ");
            window.id = getQueryVariable("id");
            // 
            $('#txt_shipname').val(window.shipName);
            $('#txt_shipnumber').val(window.shipNo);
            $('#txt_date').val(window.date);
            $('#txt_adsress').val(window.adress);
            $('#txt_desc').val(window.desc);
        }
        // event 
        $('#btBack').on('click', function (e) {
            window.location = '/S006_ListShiper.aspx?paramId= 0';
        });
        // save
        $('#btSave').on('click', function (e) {
            if (window.id === "Add") {
                // function save

            } else {
                // function update
            }
        });
    });
</script>
    </asp:Content>

