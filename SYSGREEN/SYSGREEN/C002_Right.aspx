<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Menu.Master" CodeBehind="C002_Right.aspx.cs" Inherits="SYSGREEN.C002_Right" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <script>
        // test popup
        $(document).ready(function () {
            $('#userForm')
                .formValidation({
                    framework: 'bootstrap',
                    icon: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        name: {
                            validators: {
                                notEmpty: {
                                    message: 'The full name is required'
                                },
                                regexp: {
                                    regexp: /^[a-zA-Z\s]+$/,
                                    message: 'The full name can only consist of alphabetical characters'
                                }
                            }
                        },
                        email: {
                            validators: {
                                notEmpty: {
                                    message: 'The email address is required'
                                },
                                emailAddress: {
                                    message: 'The email address is not valid'
                                }
                            }
                        },
                        website: {
                            validators: {
                                notEmpty: {
                                    message: 'The website address is required'
                                },
                                uri: {
                                    allowEmptyProtocol: true,
                                    message: 'The website address is not valid'
                                }
                            }
                        }
                    }
                })
                .on('success.form.fv', function (e) {
                    // Save the form data via an Ajax request
                    e.preventDefault();

                    var $form = $(e.target),
                        id = $form.find('[name="id"]').val();

                    // The url and method might be different in your application
                    $.ajax({
                        url: 'http://jsonplaceholder.typicode.com/users/' + id,
                        method: 'PUT',
                        data: $form.serialize()
                    }).success(function (response) {
                        // Get the cells
                        var $button = $('button[data-id="' + response.id + '"]'),
                            $tr = $button.closest('tr'),
                            $cells = $tr.find('td');

                        // Update the cell data
                        $cells
                            .eq(1).html(response.name).end()
                            .eq(2).html(response.email).end()
                            .eq(3).html(response.website).end();

                        // Hide the dialog
                        $form.parents('.bootbox').modal('hide');

                        // You can inform the user that the data is updated successfully
                        // by highlighting the row or showing a message box
                        bootbox.alert('The user profile is updated');
                    });
                });

            $('.editButton').on('click', function () {
                // Get the record's ID via attribute
                var id = $(this).attr('data-id');

                $.ajax({
                    url: 'http://jsonplaceholder.typicode.com/users/' + id,
                    method: 'GET'
                }).success(function (response) {
                    // Populate the form fields with the data returned from server
                    $('#userForm')
                        .find('[name="id"]').val(response.id).end()
                        .find('[name="name"]').val(response.name).end()
                        .find('[name="email"]').val(response.email).end()
                        .find('[name="website"]').val(response.website).end();

                    // Show the dialog
                    bootbox
                        .dialog({
                            title: 'Edit the user profile',
                            message: $('#userForm'),
                            show: false // We will show it manually later
                        })
                        .on('shown.bs.modal', function () {
                            $('#userForm')
                                .show()                             // Show the login form
                                .formValidation('resetForm'); // Reset form
                        })
                        .on('hide.bs.modal', function (e) {
                            // Bootbox will remove the modal (including the body which contains the login form)
                            // after hiding the modal
                            // Therefor, we need to backup the form
                            $('#userForm').hide().appendTo('body');
                        })
                        .modal('show');
                });
            });
        });
        $(function () {
            $('#table').bootstrapTable({
                columns: [{
                    field: 'id',
                    title: 'ID',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,
                }, {
                    field: 'department',
                    title: 'Bộ phận',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,

                }, {
                    field: 'dateCreate',
                    title: 'Ngày tạo',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: true,
                }, {
                    field: 'user',
                    title: 'User',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    editable: {
                        type: 'text',
                        title: 'User',
                        validate: function (value) {
                            value = $.trim(value);
                            if (!value) {
                                return 'This field is required';
                            }
                            if (!/^\$/.test(value)) {
                                return 'This field needs to start width $.'
                            }
                            var data = $table.bootstrapTable('getData'),
                                index = $(this).parents('tr').data('index');
                            console.log(data[index]);
                            return '';
                        }
                    },
                    footerFormatter: userFormatter
                }, {
                    field: 'operate',
                    title: 'Thao tác',
                    align: 'center',
                    valign: 'middle',
                    events: operateEvents,
                    formatter: operateFormatter
                }],



                data: [{
                    id: 1,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 2,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 3,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 4,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 5,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 6,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 7,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 8,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 9,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 10,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 11,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 12,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 13,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }, {
                    id: 14,
                    department: 'sele',
                    dateCreate: '20/5/2017',
                    user: 'Duytn4'
                }]
            });
        });
        // function
        function userFormatter(data) {
            return data.length;
        }
        function operateFormatter(value, row, index) {
            return [
                '<a class="right" href="javascript:void(0)" title="Phân quyền">',
                'Phân quyền',
                '</a>', '|',
                '<a class="edit" href="javascript:void(0)" title="Sửa">',
                'Sửa',
                '</a>  ', '|',
                '<a class="remove" href="javascript:void(0)" title="Xoá">',
                'Xóa',
                '</a>',
                
            ].join('');
        }

        window.operateEvents = {
            'click .right': function (e, value, row, index) {
                alert('You click like action, row: ' + JSON.stringify(row));
            },
            'click .edit': function (e, value, row, index) {
                alert('You click like action, row: ' + JSON.stringify(row));
            },
            'click .remove': function (e, value, row, index) {
                $('#table').bootstrapTable('remove', {
                    field: 'id',
                    values: [row.id]
                });
            }
        };

    </script>
    <table id="table" 
        data-pagination="true"
        data-search="true" 
        data-show-refresh="true" 
        data-show-toggle="true" data-show-columns="true" 
        data-show-pagination-switch="true"
        data-page-list="[10, 25, 50, 100, ALL]" 
        data-show-footer="false" 
        ></table>

    <!-- The form which is used to populate the item data -->
        <div id="userForm"  class="form-horizontal" >
            <div class="form-group">
                <label class="col-xs-3 control-label">ID</label>
                <div class="col-xs-3">
                    <input type="text" class="form-control" name="id" disabled="disabled" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-3 control-label">Full name</label>
                <div class="col-xs-5">
                    <input type="text" class="form-control" name="name" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-3 control-label">Email</label>
                <div class="col-xs-5">
                    <input type="text" class="form-control" name="email" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-3 control-label">Website</label>
                <div class="col-xs-5">
                    <input type="text" class="form-control" name="website" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-5 col-xs-offset-3">
                    <button type="submit" class="btn btn-default">Save</button>
                </div>
            </div>
        </div>
    

    </asp:Content>

