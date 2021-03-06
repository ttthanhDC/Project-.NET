﻿function now() {
    return new Date().toLocaleDateString()
}

function nowPlus20Days() {
    var date = new Date()
    date.setDate(date.getDate() + 20)
    return date.toLocaleDateString()
}

function total(items) {
   
    var sum = 0
    items.forEach(function (i) {
        console.log('Calculating item ' + i.name + '; you should see this message in debug run')
        sum += i.price
    })
    return sum
}

function totalEur(root, items) {
    return Math.round(root.currency.rates.EUR * Handlebars.helpers.total(items))
}
$(function () {
    var data = [];
    var formDatasearch = new FormData();
    formDatasearch.append('type', 'viewNhaCungCap');

    formDatasearch.append('MaNCC',"");
    formDatasearch.append('TenNCC', "");
    formDatasearch.append('SoDT', "");
    formDatasearch.append('Tinh', "");
    formDatasearch.append('LoaiDichVu', "");
    $.ajax({
        url: "Configuation/HandlerKhoServices.ashx",
        type: "POST",
        data: formDatasearch,
        contentType: false,
        processData: false,
        success: function (result) {
            alert(result);
        },
        error: function (err) {
        }
    });
});
