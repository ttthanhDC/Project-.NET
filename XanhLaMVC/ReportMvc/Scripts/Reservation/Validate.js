$(function () {
    $('#contact_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            txtHoTen: {
                validators: {
                    stringLength: {
                        min: 2,
                    },
                    notEmpty: {
                        message: 'Họ tên khách hàng không được để trống!'
                    }
                }
            },
            txtNgaySinh: {
                validators: {
                    stringLength: {
                        min: 8,
                    },
                    notEmpty: {
                        message: 'Ngày sinh không được để trống'
                    }
                }
            },
            txtEmailCustomer: {
                validators: {
                    notEmpty: {
                        message: 'Địa chỉ email không được để trống!'
                    },
                    emailAddress: {
                        message: 'Địa chỉ email không đúng!'
                    }
                }
            },
            txtSoDienThoai: {
                validators: {
                    notEmpty: {
                        message: 'Số điện thoại không được để trống!'
                    },
                    phone: {
                        country: 'US',
                        message: 'Số điện thoại không đúng định dạng'
                    }
                }
            },
            txtDiaChiCustomer: {
                validators: {
                    stringLength: {
                        min: 8,
                    },
                    notEmpty: {
                        message: 'Địa chỉ khách hàng không được để trống!'
                    }
                }
            },

            cb_quan: {
                validators: {
                    notEmpty: {
                        message: 'Xin hãy chọn Quận!'
                    }
                }
            }
        }
    });

    $('#contact_form1').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            txtHoTen1: {
                validators: {
                    stringLength: {
                        min: 2,
                    },
                    notEmpty: {
                        message: 'Họ tên khách hàng không được để trống!'
                    }
                }
            },
            txtNgaySinh1: {
                validators: {
                    stringLength: {
                        min: 8,
                    },
                    notEmpty: {
                        message: 'Ngày sinh không được để trống'
                    }
                }
            },
            txtEmailCustomer1: {
                validators: {
                    notEmpty: {
                        message: 'Địa chỉ email không được để trống!'
                    },
                    emailAddress: {
                        message: 'Địa chỉ email không đúng!'
                    }
                }
            },
            txtSoDienThoai1: {
                validators: {
                    notEmpty: {
                        message: 'Số điện thoại không được để trống!'
                    },
                    phone: {
                        country: 'US',
                        message: 'Số điện thoại không đúng định dạng'
                    }
                }
            },
            txtDiaChiCustomer1: {
                validators: {
                    stringLength: {
                        min: 8,
                    },
                    notEmpty: {
                        message: 'Địa chỉ khách hàng không được để trống!'
                    }
                }
            },

            cb_quan1: {
                validators: {
                    notEmpty: {
                        message: 'Xin hãy chọn Quận!'
                    }
                }
            }
        }
    })
});