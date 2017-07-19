<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="BC005_StatisticalFormShiper.aspx.cs" Inherits="SYSGREEN.BC005_StatisticalFormShiper" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
    <script>
        $(function () {
            $('#table').bootstrapTable({
                columns: [{
                    field: 'id',
                    title: 'Mã chuyến đi',
                    align: 'center',
                    valign: 'middle',
                   // sortable: true,
                    //editable: true,
                }, {
                    field: 'isShiper',
                    title: 'Mã shiper',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: true,
                    events: reservationEvents,
                    formatter: reservationFormatter

                }, {
                    field: 'name',
                    title: 'Họ tên',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                    //editable: true,
                }, {
                    field: 'take',
                    title: 'Nhận',
                    align: 'center',
                    valign: 'middle',
                   // sortable: true,

                    //footerFormatter: userFormatter
                }, {
                    field: 'go',
                    title: 'Đi',
                    align: 'center',
                    valign: 'middle',
                   // sortable: true,
                }, {
                    field: '_return',
                    title: 'Trả về',
                    align: 'center',
                    valign: 'middle',
                   // sortable: true,
                }, {
                    field: 'noney',
                    title: 'Số tiền thu được',
                    align: 'center',
                    valign: 'middle',
                    //sortable: true,
                }],



                data: [{
                    id : '1',
                    isShiper : '123',
                    name : 'Trần ngọc duy',
                    take : '10',
                    go  : '7',
                    _return : '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }, {
                    id: '1',
                    isShiper: '123',
                    name: 'Trần ngọc duy',
                    take: '10',
                    go: '7',
                    _return: '1',
                    noney: '1,000,000'
                }]
            });
        });
        // function
        function userFormatter(data) {
            return data.length;
        }
        function reservationFormatter(value, row, index) {
            return [
                '<a class="edit" href="javascript:void(0)" title="mã rỉevation">',
                '' + row.id + '',
                '</a>  ',
            ].join('');
        }

        window.reservationEvents = {
            'click .edit': function (e, value, row, index) {
                //window.location = '/UserManger.aspx?paramId=' + row.id;
                alert('Sự kiện chuyển màn hình');
            },
            'click .remove': function (e, value, row, index) {
                $('#table').bootstrapTable('remove', {
                    field: 'id',
                    values: [row.id]
                });
            }
        };

    </script>
     <div class="main-content-inner" style ="margin-left:30px;margin-right:30px">
          <div class="form-horizontal">
            <div class="form-group">
               
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_dept" placeholder="Cơ sở" />
                </div>
                <div class="col-md-2">
                    <input type="date" class="form-control" name="title" id="txt_beginDate" placeholder ="Ngày bắt đầu"  />
                </div>
                <div class="col-md-2">
                    <input type="date" class="form-control" name="title" id="txt_EndDate" placeholder= "Ngày kết thúc" />
                </div>
                <div class="col-md-1">
                    <input type="text" class="form-control" name="title" id="txt_shiperCode" placeholder="Mã shiper" />
                  
                </div>
                  <div class="col-md-2"> 
                    <input type="text" class="form-control" name="title" id="txt_NameShiper" placeholder="Tên Shiper"  />
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-default" id="btSearch">Xem</button>
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-default" id="btPrint">In</button>
                </div>
            </div> 
        </div> 
        </div>
    <div style ="margin-left:10px;margin-right:10px;">
         <table id="table" 
       data-pagination="true"
        data-page-list="[10, 25, 50, 100, ALL]" 
        ></table>
    </div>
      <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-4"></label>
                <label for="sel1" class="col-md-2">Nhận</label>
                <label for="sel1" class="col-md-2">Đi</label>
                <label for="sel1" class="col-md-2">Trả về</label>
            </div> 
        </div> 
          <div class="form-horizontal">
            <div class="form-group">
               <label for="sel1" class="col-md-3"></label>
                <label for="sel1" class="col-md-1">Tổng</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_thu" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_tong" readOnly = 'true' />
                </div>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="title" id="txt_thieu" readOnly = 'true' />
                </div>
            </div> 
        </div> 
    </asp:Content>


