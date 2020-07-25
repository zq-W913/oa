<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>用户管理</title>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/script/docs.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/ztree/jquery.ztree.all-3.5.min.js"></script>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ztree/zTreeStyle.css">
    <script type="text/javascript">
        $(function () {

            var setting={
                async: {
                    enable: true,//开启异步加载
                    url: "source/showAll"
                },
                data: {
                    key: {
                        url: "xUrl"    //不想跳转，给他一个不存在的路径
                    }
                },
                view: {
                    //鼠标悬浮添加dom
                    addHoverDom:function(treeId, treeNode) {
                        var aObj = $("#" + treeNode.tId + "_a");
                        if ($("#diyBtn_"+treeNode.id).length>0) return;

                        var editStr = "<span id='diyBtn_space_" +treeNode.id+ "' > </span>"
                            + "<button type='button' class='diyBtn1' id='diyBtn_" + treeNode.id
                            + "' title='"+treeNode.name+"' onclick='edit("+treeNode.id+")' '>编辑</button>";

                        //如果有子菜单，只能有添加的功能，不能删除
                        if(treeNode.children.length>0){
                            editStr+="<span id='editBtn_space_" +treeNode.id+ "' > </span>"
                                + "<button type='button' class='diyBtn1' id='editBtn_" + treeNode.id
                                + "' title='"+treeNode.name+"' onclick='add("+treeNode.id+")'>添加</button>";
                        }else{//没有子菜单可以删除
                            editStr+="<span id='delBtn_space_" +treeNode.id+ "' > </span>"
                                + "<button type='button' class='diyBtn1' id='delBtn_" + treeNode.id
                                + "' title='"+treeNode.name+"' onclick='del("+treeNode.id+")' '>删除</button>";
                        }


                        aObj.append(editStr);
                        /*var btn = $("#diyBtn_"+treeNode.id);
                        if (btn) btn.bind("click", function(){alert("diy Button for " + treeNode.id);});*/
                    },
                    //鼠标移开后删除dom
                    removeHoverDom: function(treeId, treeNode) {
                        $("#diyBtn_"+treeNode.id).unbind().remove();
                        $("#diyBtn_space_" +treeNode.id).unbind().remove();

                        $("#editBtn_"+treeNode.id).unbind().remove();
                        $("#editBtn_space_" +treeNode.id).unbind().remove();

                        $("#delBtn_"+treeNode.id).unbind().remove();
                        $("#delBtn_space_" +treeNode.id).unbind().remove();



                    }
                }
            };
            //初始化基座
            $.fn.zTree.init($("#permissionTree"), setting);
        });

        //添加
        function add(pid) {
            // alert("添加"+pid);
            location.href="pm-add.jsp?pid="+pid;
        }

        //删除
        function del(id) {
            alert("删除--"+id)
        }

        //编辑
        function edit(id) {
            // alert("编辑："+id);
            location.href="pm-edit.jsp?id="+id;
        }


    </script>

</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
    <tr>
        <td height="26" background="skin/images/newlinebg3.gif">
            <table width="58%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td >
                        当前位置:权限管理>>权限维护
                    </td>
                    <td>

                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>


<!--  内容列表   -->
<form name="form2">
    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;权限列表&nbsp;</td>
        </tr>
        <tr align="center" bgcolor="#FAFAF1" height="22">
            <td>
                <div class="panel-body">
                    <ul id="permissionTree" class="ztree"></ul>
                </div>
            </td>
        </tr>

    </table>

</form>


</body>
</html>