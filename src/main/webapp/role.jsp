<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>角色管理</title>
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
				url : "role/showAll",
				type : "get",
				data : {"pageNum" : pageNum,"pageSize" : pageSize},
				dataTyepe : "json",
				success : function (data) {
					var tr = "";
					$(data.list).each(function (index,role) {
						tr += "<tr class='newtr' align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
								"\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
								"\t<td>"+role.roleid+"</td>\n" +
								"\t<td>"+role.rolename+"</td>\n" +
								"\t<td align=\"center\">"+role.roledis+"</td>\n" +
								"\t<td>"+(role.status==1?"正常":"禁用")+"</td>\n" +
								"\t<td><a >删除</a> |<a href=\"role-edit.jsp?roleid="+role.roleid+"\">编辑</a> | <a href=\"role-look.jsp\">查看详情</a></td>";
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
    当前位置:权限管理>>角色管理
 </td>
  <td>
    <input type='button' class="coolbg np" onClick="location='role-add.jsp';" value='添加角色' />
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
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;角色列表&nbsp;</td>
</tr>
<tr id="trr" align="center" bgcolor="#FAFAF1" height="22">
	<td width="4%">选择</td>
	<td width="6%">编号</td>
    <td width="10%">角色名称</td>
	<td width="10%">角色描述</td>
	<td width="8%">状态</td>
	<td width="10%">操作</td>
</tr>

<%--<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
	<td><input name="id" type="checkbox" id="id" value="101" class="np"></td>
	<td>1</td>
	<td>普通员工</td>
	<td align="center">具有日常的普通功能</td>
	<td>启用</td>
	<td><a >删除</a> |<a href="role-edit.jsp">编辑</a> | <a href="role-look.jsp">查看详情</a></td>
</tr>--%>


<tr bgcolor="#FAFAF1">
<td height="28" colspan="12">
	&nbsp;
	<a href="javascript:checkAll()" class="coolbg">全选</a>
	<a href="javascript:decheckAll()" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="" class="coolbg">&nbsp;禁用&nbsp;</a>
</td>
</tr>
<tr align="right" bgcolor="#EEF4EA">
	<td id="pagetd" height="36" colspan="12" align="center"><!--翻页代码 --></td>
</tr>
</table>

</form>
  

</body>
</html>