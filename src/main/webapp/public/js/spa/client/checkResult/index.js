/**
 * 用户模块Index
 *
 * @author linguozhi@52tt.com
 * @since 2016-06-01
 * @version 1.0.0
 */

/**
 * datatable表格渲染控制
 */
var datatable = $('#datatable').DataTable(
    {
        "draw": 1,
        "serverSide": true,
        "processing": false,
        "order": [1, 'desc'],
        "lengthMenu": [[15, 30, 50, 100], [15, 30, 50, 100]],
        "ajax": {
            "url": WEBROOT + "/checkResult/getList.html",
            "type": 'post',
            "data": function (d) {
                return $.extend({}, d,
                    {
                        "clientName": $('#sch_clientName').val(),
                        "itemName": $('#sch_itemName').val(),
                        "colName": $('tr[role="row"]').find('th').eq($('#datatable').DataTable().order()[0][0]).attr('id'),
                        "direction": $('#datatable').DataTable().order()[0][1]
                    });
            }
        },
        "bLengthChange": false,
        "columns": [
            {"data": "id", className: "center", "orderable": false, "width": "10px", class: "text-center"},
            {"data": "id", "defaultContent": "", "width": "80px", class: "text-center"},
            {"data": "clientName", "defaultContent": ""},
            {"data": "itemName", "defaultContent": ""},
            {"data": "score", "defaultContent": ""},
            {
                "data": "createTime", "defaultContent": "", "render": function (data, type) {
                return moment(data).format("YYYY-MM-DD HH:mm:ss");
            }
            },
            {
                "data": "modifyTime", "defaultContent": "", "render": function (data, type) {
                return moment(data).format("YYYY-MM-DD HH:mm:ss");
            }
            },
            {"data": "id", className: "center", "orderable": false, "width": "120px", class: "text-center"},
        ],
        "preDrawCallback": function (settings) {
            popup.loading().show();
        },
        "fnCreatedRow": function (nRow, aData, iDataIndex) {
            $('td:eq(0)', nRow).html('<input role="ck" type="checkbox" name="checkbox" class="center" value="' + aData.id + '">');
            //var html = '<a href="javascript:doDetail(' + aData.name + ')">查看</a>|';
            var html = '';
            html += '<a href="javascript:doMod(' + aData.id + ')">修改</a>|';
            html += '<a href="javascript:doCaculate(' + aData.id + ')">开始检测</a>|';
            html += '<a href="javascript:doDel(' + aData.id + ')">删除</a>|';
            $('td:eq(7)', nRow).html(html.substr(0, html.length - 1));
        },
        "drawCallback": function (settings) {
            popup.loading().hide();
            myDataTable.checkboxAll(); // 添加复选框事件
        },
        "initComplete": function (settings, json) {
        }
    });

/**
 * 查询
 */
doQuery = function () {
    datatable.ajax.reload();
}


/**
 * 导出Excel
 */
doExport = function () {
    jQuery("#converageForm").attr("action", WEBROOT + "/user/export.html");
    jQuery("#converageForm").submit();
}

onLoadInit = function () {

}

/**
 * 新增
 */
doAdd = function () {
    windows.go(WEBROOT + "/checkResult/edit.html");
}

/**
 * 修改
 */
doMod = function (id) {
    // 校验
    if (utils.empty(id)) {
        popup.tip("请选择修改对象");
        return;
    }
    if (utils.length(utils.split(id, ",")) > 1) {
        popup.tip("每次只允许操作1条数据");
        return;
    }
    // 操作
    windows.go(WEBROOT + '/checkResult/edit.html?id=' + id);
}

/**
 * 删除
 */
doDel = function (ids) {

    // 校验
    if (utils.emptys(ids)) {
        popup.tip("请选择删除数据");
        return;
    }

    // 操作
    popup.confirm('删除', '是否确认删除', function () {
        popup.loading('正在删除，请稍候……').show();
        $.post(WEBROOT + "/checkResult/del.html", {
            id: ids
        }, function (result) {
            popup.loading().hide();
            if (protocols.isSuccess(result)) {
                myDataTable.reloads();
            } else {
                popup.tip(protocols.getMessage(result));
                console.log(protocols.getMessage(result));
            }
        }, "json");
    });
}

/**
 * 检测
 */
doCaculate = function(ids) {
    // 校验
    if (utils.emptys(ids)) {
        popup.tip("请选择检测数据");
        return;
    }

    // 操作
    popup.confirm('检测', '是否确认检测', function () {
        popup.loading('正在检测，请稍候……').show();
        $.post(WEBROOT + "/checkResult/caculate.html", {
            id: ids
        }, function (result) {
            popup.loading().hide();
            if (protocols.isSuccess(result)) {
                myDataTable.reloads();
            } else {
                popup.tip(protocols.getMessage(result));
                console.log(protocols.getMessage(result));
            }
        }, "json");
    });
}


/**
 * 详情页
 * @param id    用户ID
 */
doDetail = function (id) {

    // 校验
    if (utils.empty(id)) {
        popup.tip("请选择查看对象");
        return;
    }

    // 构建弹出层
    var userDetailModel = dialog({
        title: '分类详情',
        width: '730px',
        content: "努力加载中...",
        cancelValue: '关 闭',
        cancel: function () {
        }
    });

    // 异步获取页面内容
    $.ajax({
        type: "post",
        url: WEBROOT + '/checkResult/detail.html?id=' + id,
        success: function (data) {
            userDetailModel.content(data);
            userDetailModel.showModal();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            popup.tip(errorThrown);
        },
        cache: false
    });
}

/**
 * 修改
 */
doMods = function () {
    doMod(myDataTable.getCheckedIds());
}

/**
 * 删除
 */
doDels = function () {
    doDel(myDataTable.getCheckedIds());
}

/**
 * 系统
 */
$(document).ready(function () {
    onLoadInit();
    $("#btnSearch").click(doQuery);
    $("#btnExport").click(doExport);
    $("#btnAdd").click(doAdd);
    $("#btnMod").click(doMods);
    $("#btnDel").click(doDels);
});

