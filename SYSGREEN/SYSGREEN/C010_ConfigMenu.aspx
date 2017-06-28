<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeFile="C010_ConfigMenu.aspx.cs" Inherits="SYSGREEN.C010_ConfigMenu" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu2" runat="server">
   <div class="table-responsive" >
       <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th style ="text-align:center">Thứ</th>
                <th style ="text-align:center">Món</th>
                <th style ="text-align:center"></th>
            </tr>
            </thead>
           <tr>
               <td style ="text-align:center"><label> Thứ 2</label> </td>
               <td style ="text-align:center">
                   <table id ="tbl_add1" class ="tbl_add1" style ="width:100%;border:none">
                       <tr style ="width:100%">
                           <td style ="width:100%">
                               <div class="form-group">
                                  <select class="form-control" id="sel1" style ="width:100%">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                  </select>
                                </div>
                           </td>
                       </tr>
                   </table>
                   
               </td>
               <td style ="text-align:center"><button type="button" data-id="1" class="btn btn-default editButton">Thêm</button></td>
           </tr>
           <tr>
               <td style ="text-align:center"><label> Thứ 3</label> </td>
               <td style ="text-align:center">
                   <table id ="tbl_add2" class ="tbl_add2" style ="width:100%;border:none">
                       <tr style ="width:100%">
                           <td style ="width:100%">
                               <div class="form-group">
                                  <select class="form-control" id="sel2">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                  </select>
                                </div>
                           </td>
                       </tr>
                   </table>
                   
               </td>
               <td style ="text-align:center"><button type="button" data-id="2" class="btn btn-default editButton">Thêm</button></td>
           </tr>
           <tr>
               <td style ="text-align:center"><label> Thứ 4</label> </td>
               <td style ="text-align:center">
                   <table id ="tbl_add3" class ="tbl_add3" style ="width:100%;border:none">
                       <tr style ="width:100%">
                           <td style ="width:100%">
                               <div class="form-group">
                                  <select class="form-control" id="sel3">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                  </select>
                                </div>
                           </td>
                       </tr>
                   </table>
                   
               </td>
               <td style ="text-align:center"><button type="button" data-id="3" class="btn btn-default editButton">Thêm</button></td>
           </tr>
           <tr>
               <td style ="text-align:center"><label> Thứ 5</label> </td>
               <td style ="text-align:center">
                   <table id ="tbl_add4" class ="tbl_add4" style ="width:100%;border:none">
                       <tr style ="width:100%">
                           <td style ="width:100%">
                               <div class="form-group">
                                  <select class="form-control" id="sel4">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                  </select>
                                </div>
                           </td>
                       </tr>
                   </table>
                   
               </td>
               <td style ="text-align:center"><button type="button" data-id="4" class="btn btn-default editButton">Thêm</button></td>
           </tr>
           <tr>
               <td style ="text-align:center"><label> Thứ 6</label> </td>
               <td style ="text-align:center">
                   <table id ="tbl_add5" class ="tbl_add5" style ="width:100%;border:none">
                       <tr style ="width:100%">
                           <td style ="width:100%">
                               <div class="form-group">
                                  <select class="form-control" id="sel5">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                  </select>
                                </div>
                           </td>
                       </tr>
                   </table>
                   
               </td>
               <td style ="text-align:center"><button type="button" data-id="5" class="btn btn-default editButton">Thêm</button></td>
           </tr>
           <tr>
               <td style ="text-align:center"><label> Thứ 7</label> </td>
               <td style ="text-align:center">
                   <table id ="tbl_add6" class ="tbl_add6" style ="width:100%;border:none">
                       <tr style ="width:100%">
                           <td style ="width:100%">
                               <div class="form-group">
                                  <select class="form-control" id="sel6">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                  </select>
                                </div>
                           </td>
                       </tr>
                   </table>
                   
               </td>
               <td style ="text-align:center"><button type="button" data-id="6" class="btn btn-default editButton">Thêm</button></td>
           </tr>
           <tr>
               <td style ="text-align:center"><label> Chủ nhật</label> </td>
               <td style ="text-align:center">
                   <table id ="tbl_add7" class ="tbl_add7" style ="width:100%;border:none">
                       <tr style ="width:100%">
                           <td style ="width:100%">
                               <div class="form-group">
                                  <select class="form-control" id="sel7">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                  </select>
                                </div>
                           </td>
                       </tr>
                   </table>
                   
               </td>
               <td style ="text-align:center"><button type="button" data-id="7" class="btn btn-default editButton">Thêm</button></td>
           </tr>
       </table>
   </div> 
    <script>
        var count3 = 0;
        $('.editButton').on('click', function () {
            var id = $(this).attr('data-id');
            alert('click button add 1' + id);
            // create cell in table
            var table = null;
            if (id + "" === "1") {
                table = $('#tbl_add1');
            }

           // table.append('<tr> <td style ="width:100%"><div class="form-group" style ="width:100%"><select class="form-control" id="sel1" style ="width:100%"><option>1</option><option>2</option><option>3</option><option>4</option></select> </div></td></tr>');



            // var table = this.tbl_add;
             var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
            var newId = count3++;
            row.id = newId;
            row.setAttribute('class', 'Tr');
            var value = "";
            for (var i = 0; i < 1; i++) {
            if(i === 0){
             alert('click input 2' + i);
            }
            }
        });
     </script>
</asp:Content>

