<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>测试页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="framwork/webix/webix.css" type="text/css">
    <script src="framwork/webix/webix.js" type="text/javascript"></script>
</head>
<body>
<div id="tab-area"></div>
<script type="text/javascript" charset="utf-8">
    webix.ui({
        rows: [ {container: "tab-area",
            view: "tabview",
            cells: [
                {
                    header: "数据库查询",
                    body: {
                        rows: [{
                            view: "toolbar",
                            cols: [
                                {view: "search", align: "center", placeholder: "表名...", id: "search", width: 500,
                                    on: {
                                        'onKeyPress': function(code) {
                                           if (code == 13) {
                                               $$("datagrid").clearAll();
                                               $$("datagrid").config.columns = [];
                                               $$("datagrid").refreshColumns();
                                               var value = this.getValue();
                                               if("" == value) {
                                                   return;
                                               }
                                               webix.ajax().post("cols.do", {tableName: value}, function(text,data) {
                                                   var textA = eval("(" + text + ')')
                                                   var newCols = [];
                                                   for(var item in textA) {
                                                       var object = {};
                                                       object.id = textA[item];
                                                       object.adjust = true;
                                                       newCols.push(object);
                                                   }
                                                   console.log(newCols);
                                                   $$("datagrid").config.columns = newCols;
                                                   $$("datagrid").refreshColumns();
                                                   $$("datagrid").load("data.do?tableName=" + value);
                                               });
                                           }
                                        },
                                        'onSearchIconClick': function() {
                                                $$("datagrid").clearAll();
                                                $$("datagrid").config.columns = [];
                                                $$("datagrid").refreshColumns();
                                                var value = this.getValue();
                                                if("" == value) {
                                                    return;
                                                }
                                                webix.ajax().post("cols.do", {tableName: value}, function(text,data) {
                                                    var textA = eval("(" + text + ')')
                                                    var newCols = [];
                                                    for(var item in textA) {
                                                        var object = {};
                                                        object.id = textA[item];
                                                        object.adjust = true;
                                                        newCols.push(object);
                                                    }
                                                    console.log(newCols);
                                                    $$("datagrid").config.columns = newCols;
                                                    $$("datagrid").refreshColumns();
                                                    $$("datagrid").load("data.do?tableName=" + value);
                                                });
                                        }
                                    }}
                            ]
                        }, {
                            id: "datagrid",
                            view: "datatable",
                            columns: [
                            ]
                        }]
                    }
                },{
                    header: "数据库查询-副",
                    body: {
                        rows: [{
                            view: "toolbar",
                            cols: [
                                {view: "search", align: "center", placeholder: "表名...", id: "search2", width: 500,
                                    on: {
                                        'onKeyPress': function(code) {
                                            if (code == 13) {
                                                $$("datagrid2").clearAll();
                                                $$("datagrid2").config.columns = [];
                                                $$("datagrid2").refreshColumns();
                                                var value = this.getValue();
                                                if("" == value) {
                                                    return;
                                                }
                                                webix.ajax().post("cols2.do", {tableName: value}, function(text,data) {
                                                    var textA = eval("(" + text + ')')
                                                    var newCols = [];
                                                    for(var item in textA) {
                                                        var object = {};
                                                        object.id = textA[item];
                                                        object.adjust = true;
                                                        newCols.push(object);
                                                    }
                                                    console.log(newCols);
                                                    $$("datagrid2").config.columns = newCols;
                                                    $$("datagrid2").refreshColumns();
                                                    $$("datagrid2").load("data2.do?tableName=" + value);
                                                });
                                            }
                                        },
                                        'onSearchIconClick': function() {
                                            $$("datagrid2").clearAll();
                                            $$("datagrid2").config.columns = [];
                                            $$("datagrid2").refreshColumns();
                                            var value = this.getValue();
                                            if("" == value) {
                                                return;
                                            }
                                            webix.ajax().post("cols2.do", {tableName: value}, function(text,data) {
                                                var textA = eval("(" + text + ')')
                                                var newCols = [];
                                                for(var item in textA) {
                                                    var object = {};
                                                    object.id = textA[item];
                                                    object.adjust = true;
                                                    newCols.push(object);
                                                }
                                                console.log(newCols);
                                                $$("datagrid2").config.columns = newCols;
                                                $$("datagrid2").refreshColumns();
                                                $$("datagrid2").load("data2.do?tableName=" + value);
                                            });
                                        }
                                    }}
                            ]
                        }, {
                            id: "datagrid2",
                            view: "datatable",
                            columns: [
                            ]
                        }]
                    }
                },
                {
                    header: "文件查询",
                    body: {
                        rows: [{
                            view: "toolbar",
                            cols: [
                                {view: "search", align: "center", placeholder: "文件路径...", id: "search-path", width: 500,
                                    on: {
                                        'onKeyPress': function(code) {
                                            if (code == 13) {
                                                $$("template-content").setHTML('');
                                                var value = this.getValue();
                                                if("" == value) {
                                                    return;
                                                }
                                                webix.ajax().post("file.do", {path: value}, function(text,data) {
                                                    $$("template-content").setHTML(text);
                                                });
                                            }
                                        },
                                        'onSearchIconClick': function() {
                                            $$("template-content").setHTML('');
                                            var value = this.getValue();
                                            if("" == value) {
                                                return;
                                            }
                                            webix.ajax().post("file.do", {path: value}, function(text,data) {
                                                $$("template-content").setHTML(text);
                                            });
                                        }
                                    }}
                            ]
                        }, {
                            id: 'template-content',
                            view: "template"
                        }]
                    }
                }
            ]}, {
                height: 70,
                // war升级修改这里
                template: "<h2 style='text-align:center'>  version: 1.0 </h2>"
        }]
    });
</script>
</body>
</html>
