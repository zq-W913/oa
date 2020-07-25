<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <script type="application/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="application/javascript">
        $(function () {
            loadData(1,5);
        })
        //获取所有员工信息
        function loadData(pageNum,pageSize) {
            $.ajax({
                url : "emp/user",
                type : "get",
                data : {"pageNum" : pageNum,"pageSize" : pageSize},
                dataTyepe : "json",
                success : function (data) {
                    var tr = "";
                    $(data.list).each(function (index,emp) {
                        tr += "<tr class='newtr' align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
                            "\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\""+emp.eid+"\" class=\"np\"></td>\n" +
                            "\t<td>"+emp.eid+"</td>\n" +
                            "\t<td>"+emp.ename+"</td>\n" +
                            "\t<td align=\"center\">"+emp.position.name+"</td>\n" +
                            "\t<td>"+(emp.esex == 0 ? "女" : "男")+"</td>\n" +
                            "\t<td>"+emp.eage+"</td>\n" +
                            "\t<td>"+emp.telephone+"</td>\n" +
                            "\t<td>"+emp.hiredate+"</td>\n" +
                            "\t<td>正常</td>\n" +
                            "\t<td><a >删除</a> | <a href=\"user-edit.jsp?eid="+emp.eid+"\">编辑</a> | <a href=\"user-look.jsp\">查看详情</a></td>\n" +
                            "</tr>"
                    })
                    $(".newtr").remove();
                    $("#trr").after(tr);

                    var bottom=" <ul class=\"pagination\">\n" +
                        "            <li><a href=\"javascript:loadData(1,5)\">首页</a></li>\n" +
                        "            <li><a href=\"javascript:loadData("+(data.isFirstPage?1:data.prePage)+",5)\">上一页</a></li>\n" +
                        "            <li><a href=\"javascript:loadData("+(data.isLastPage?data.pages:data.nextPage)+",5)\">下一页</a></li>\n" +
                        "            <li><a href=\"javascript:loadData("+data.pages+",5)\">尾页</a></li>\n" +
                        "            <li><span>总共"+data.pages+"页</span></li>\n" +
                        "            <li><span>当前第"+data.pageNum+"页</span></li>\n" +
                        "        </ul>";

                    $("#pagetd").html(bottom);
                }
            })
        }
        //全选全不选
        var checked = true;
        function checkAll() {
            $(":checkbox").prop("checked",checked)
            checked = !checked
        }
        //反选
        function decheckAll() {
            $(":checkbox").each(function () {
                $(this).prop("checked",!$(this).prop("checked"))
            })
        }

        //删除
        function delEmpById() {
            var eids = []
            $(":checkbox:checked").each(function () {
                eids.push($(this).val())
            })
            if (eids.length > 0){
                $.ajax({
                    url : "emp/delById?eids="+eids,
                    type : "post",
                    dataType : "json",
                    success : function (data) {
                        if (data){
                            loadData(1,5);
                        }
                    },
                    error : function () {
                        alert("此数据为重要数据，无法删除")
                    }
                })
            }else {
                alert("请选择要删除的选项")
            }
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
    当前位置:权限管理>>用户管理
 </td>
  <td>
    <input type='button' class="coolbg np" onClick="location='user-add.jsp';" value='添加用户' />
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<!--  搜索表单  -->
<form name='form3' action='' method='get'>
<input type='hidden' name='dopost' value='' />
<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
  <tr bgcolor='#EEF4EA'>
    <td background='skin/images/wbg.gif' align='center'>
      <table border='0' cellpadding='0' cellspacing='0'>
        <tr>
          <td width='90' align='center'>搜索条件：</td>
          <td width='160'>
          <select name='cid' style='width:150'>
          <option value='0'>选择类型...</option>
          	<option value='1'>姓名</option>
          	<option value='1'>联系电话</option>
          </select>
        </td>
        <td width='70'>
          关键字：
        </td>
        <td width='160'>
          	<input type='text' name='keyword' value='' style='width:120px' />
        </td>
        <td width='110'>
    		<select name='orderby' style='width:120px'>
            <option value='id'>排序...</option>
            <option value='pubdate'>添加时间</option>
            <option value='pubdate'>修改时间</option>
      	</select>
        </td>
        <td>
          &nbsp;&nbsp;&nbsp;<input name="imageField" type="image" src="skin/images/frame/search.gif" width="45" height="20" border="0" class="np" />
        </td>
       </tr>
      </table>
    </td>
  </tr>
</table>
</form>
<!--  内容列表   -->
<form name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;用户列表&nbsp;</td>
</tr>
<tr id="trr" align="center" bgcolor="#FAFAF1" height="22">
	<td width="4%">选择</td>
	<td width="6%">序号</td>
	<td width="10%">姓名</td>
	<td width="10%">职位</td>
	<td width="10%">性别</td>
	<td width="10%">年龄</td>
	<td width="10%">联系电话</td>
	<td width="8%">入职时间</td>
	<td width="8%">状态</td>
	<td width="10%">操作</td>
</tr>


<tr bgcolor="#FAFAF1">
<td height="28" colspan="12">
	&nbsp;
	<a href="javascript:checkAll()" class="coolbg">全选</a>
	<a href="javascript:decheckAll()" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:delEmpById()" class="coolbg">&nbsp;删除</a>
	<a href="" class="coolbg">&nbsp;导出Excel&nbsp;</a>
</td>
</tr>
<tr align="right" bgcolor="#EEF4EA">
	<td id="pagetd" height="36" colspan="12" align="center"></td>
</tr>
</table>

</form>
  

</body>
</html>