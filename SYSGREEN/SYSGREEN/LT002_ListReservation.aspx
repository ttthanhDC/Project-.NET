<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="LT002_ListReservation.aspx.cs" Inherits="SYSGREEN.LT002_ListReservation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
 <div style ="text-align:center">
    <div style ="height:10px"></div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                     <label for="sel1">Nguồn</label>
                    <select class="form-control" id="cb_SourceType">
                        <option value ="1">Facebook</option>
                        <option value ="2">Zalo</option>
                  </select>
                </div>
            </div>
             <div class="col-md-4">
                <div class="form-group">
                     <label for="sel1">Mã khách hàng</label>
                     <input type="text" class="form-control" name="title" id="txtMaKH" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                     <label for="sel1">Mã Reservation</label>
                     <input type="text" class="form-control" name="title" id="txtMaHD" />
                </div>
            </div>
        </div>
      <div class="row">
          <div class="col-md-8">
                <div class="form-group">
                     <label for="sel1">Họ và tên</label>
                     <input type="text" class="form-control" name="title" id="txtHoTen" />
                </div>
            </div>
          <div class="col-md-4">
                <div class="form-group">
                     <label for="sel1">Số ngày còn lại</label>
                     <input type="text" class="form-control" name="title" id="txtSoNgayConLai" />
                </div>
            </div>
      </div>
      <div class="row">
          <div class="col-md-8">
                <div class="form-group">
                     <label for="sel1">Ngày sinh</label>
                     <input type="date" class="form-control" name="title" id="txtNgaySinh" />
                </div>
            </div>
          <div class="col-md-4">
                <div class="form-group">
                     <label for="sel1">Tổng</label>
                     <input type="text" class="form-control" name="title" id="txtTong" />
                </div>
            </div>
       </div>
      <div class="row">
          <div class="col-md-8">
                <div class="form-group">
                     <label for="sel1">Số điện thoại</label>
                     <input type="text" class="form-control" name="title" id="txtSoDienThoai" />
                </div>
            </div>
          <div class="col-md-4">
                <div class="form-group">
                     <label for="sel1">Số tiền thu được</label>
                     <input type="text" class="form-control" name="title" id="txtSoTienThuDuoc" />
                </div>
           </div>
       </div>
     <div class="row">
          <div class="col-md-8">
                <div class="form-group">
                     <label for="sel1">Email</label>
                     <input type="email" class="form-control" name="title" id="txtEmail" />
                </div>
            </div>
          <div class="col-md-4">
                <div class="form-group">
                     <label for="sel1">Chiết khấu</label>
                     <input type="text" class="form-control" name="title" id="txtChietKhau" />
                </div>
           </div>
       </div>
     <div class="row">
          <div class="col-md-8">
                <div class="form-group">
                     <label for="sel1">Địa chỉ</label>
                     <input type="email" class="form-control" name="title" id="txtDiaChi" />
                </div>
            </div>
          <div class="col-md-4">
                <div class="form-group">
                     <label for="sel1">Còn Nợ</label>
                     <input type="text" class="form-control" name="title" id="txtNo" />
                </div>
           </div>
       </div>
     
        <div class="row" style="margin-left : 30px; margin-right : 30px">
            <div class="col-md-4">
                <div class="form-group">
                  <label for="sel1">Loại đơn hàng</label>
                  <select class="form-control" id="cb_billType">
                    <option value ="1">Master</option>
                    <option value ="2">Not master</option>
                  </select>
                </div>
            </div>
            <div class="col-md-4">
                 <div class="form-group">
                  <label for="sel1">Loại sản phẩm</label>
                  <select class="form-control" id="cb_OrderType">
                    <option value ="1"></option>
                    <option value ="2">Gói</option>
                    <option value ="3">Đơn lẻ</option>
                  </select>
                </div>
            </div>
            <div class="col-md-4">
                 <div class="form-group" id ="div_cb_OrderType2" style="display : none">
                  <label for="sel1">Loại gói </label>
                  <select class="form-control" id="cb_OrderType2">
                    <option value ="1">Gói A </option>
                    <option value ="2">Gói B </option>
                    <option value ="3">Gói C </option>
                    <option value ="4">Gói D </option>
                  </select>
                </div>
            </div>
        </div> 
        
    <div style ="text-align:center;display: table;margin: 0 auto;">
       <button type="submit" class="btn btn-default" id="btnAdd">Thêm</button>
       <button type="submit" class="btn btn-default" id="btnTackBill">Tách bill</button>
    </div>
</div>
<div style ="height:40px"></div>
<div style="margin-left : 30px; margin-right : 30px">
    <table id="table" 
        data-search="true" 
        data-show-refresh="true" 
    ></table>
</div>

    
<script>
    // Bootstrap Table
    $(function () {
        // onchage select box 
        $('#cb_OrderType').on('change', function () {
            alert(this.value);
            if (this.value == "2") {
                $("#div_cb_OrderType2").css("display", "block");
            } else {
                $("#div_cb_OrderType2").css("display", "none");
            }
        })
        $('#table').bootstrapTable({
            columns: [{
                field: 'stt',
                title: 'STT',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'billType',
                title: 'loại hóa đơn',
                align: 'center',
                valign: 'middle',
                style: 'font-weight: bold',
                fontWeight: 'bold'
                
            }, {
                field: 'OrderType',
                title: 'Loại đơn hàng',
                align: 'center',
                valign: 'middle',

            }, {
                field: 'product',
                title: 'Sản phẩm ',
                align: 'center',
                valign: 'middle',
                events: productEvents,
                formatter: productFormatter
                
            }, {
                field: 'dateShip',
                title: 'Ngày giao hàng',
                align: 'center',
                valign: 'middle',
                editable: true
            }, {
                field: 'discount',
                title: 'Chiết khấu (nếu có)',
                align: 'center',
                valign: 'middle',
                editable: true
            }, {
                field: 'monny',
                title: 'Thành tiền',
                align: 'center',
                valign: 'middle',
            }, {
                field: 'operate',
                title: 'Thao tác',
                align: 'center',
                valign: 'middle',
                events: operateEvents,
                formatter: operateFormatter

            }],



            data: [{
                stt : '1',
                billType: 'Master',
                OrderType: 'G-1',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '2',
                billType: '',
                OrderType: 'G-2',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '3',
                billType: '',
                OrderType: 'G-3',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '4',
                billType: '',
                OrderType: 'G-4',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '5',
                billType: '',
                OrderType: 'G-5',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '6',
                billType: '',
                OrderType: 'G-6',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '7',
                billType: '',
                OrderType: 'G-7',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '8',
                billType: '',
                OrderType: 'G-8',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '9',
                billType: '',
                OrderType: 'G-9',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '10',
                billType: '',
                OrderType: 'G-10',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '11',
                billType: '',
                OrderType: 'Đơn lẻ',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '12',
                billType: 'Đơn 2',
                OrderType: 'G-1',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '13',
                billType: '',
                OrderType: 'G-2',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }, {
                stt: '14',
                billType: '',
                OrderType: 'G-3',
                dateShip: '20/07/2017',
                discount: '10%',
                monny: '30,000'
            }]
        });
    });
    function userFormatter(data) {
        return data.length;
    }
    function operateFormatter(value, row, index) {
        return [
             '<a class="remove" href="javascript:void(0)" title="Xoá">',
            'Xóa',
            '</a>',
        ].join('');
    }
    function productFormatter(value, row, index) {
        return [
            '<a class="product" href="javascript:void(0)" title="sản phẩm">',
            'Sản phẩm',
            '</a>',
        ].join('');
    }
    window.operateEvents = {
        'click .remove': function (e, value, row, index) {
            $('#table').bootstrapTable('remove', {
                field: 'stt',
                values: [row.stt]
            });
        }
    };
    window.productEvents = {
        'click .product': function (e, value, row, index) {
            alert('You click like action, row: ' + JSON.stringify(row));
        }
    };
</script>
    </asp:Content>


