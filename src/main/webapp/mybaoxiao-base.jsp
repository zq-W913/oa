<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>附件管理</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="js/jquery-2.1.1.min.js"></script>
	<script>
		$(function () {
			loadData(1,5);
		})
		//获取所有项目需求信息
		function loadData(pageNum,pageSize) {
			$.ajax({
				url : "bao/getBxByEid",
				type : "get",
				data : {"pageNum" : pageNum,"pageSize" : pageSize},
				dataTyepe : "json",
				success : function (data) {
					var tr="";
					$(data.list).each(function (i,bx) {
						var state="";
						if (bx.bxstatus==0){//未审批
							state="<font>待审批</font>";
						}else if(bx.bxstatus==1){
							state="<font color='green'>通过</font>";
						}else{
							state="<font color='red'>驳回</font>";
						}
						tr+="<tr class='newtr' align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
								"\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
								"\t<td>"+bx.bxid+"</td>\n" +
								"\t<td>"+bx.totalmoney+"</td>\n" +
								"\t<td align=\"center\"><a href=''><u> "+bx.bxtime+" </u></a></td>\n" +
								"\t<td>"+bx.bxremark+"</td>\n" +
								"\t<td>"+state+"</td>\n" +
								"\t<td>"+(bx.bxstatus==1?"<a href=\"mybaoxiao-edit.jsp?bxid="+bx.bxid+"\">查看</a>":"<a href=\"mybaoxiao-edit.jsp?bxid="+bx.bxid+"\">编辑</a>")+"</td>\n" +
								"</tr>";
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
    当前位置:个人报销管理>>报销列表
 </td>
  <td>
    <input type='button' class="coolbg np" onClick="location='mybaoxiao-add.jsp';" value='添加报销' />
 </td>
 </tr>
</table>
</td>
</tr>
</table>


<!--  内容列表   -->
<form name="form2">

<table width="98%"  cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;附件列表&nbsp;</td>
</tr>
<tr id="trr" align="center" bgcolor="#FAFAF1" height="22">
	<td width="4%">选择</td>
	<td width="20%">编号</td>
	<td width="6%">总金额</td>
	<td width="10%">使用时间</td>
	<td width="40%">备注信息</td>
	<td width="10%">审批状态</td>
	<td width="10%">操作</td>
</tr>
	


<tr align="right" bgcolor="#EEF4EA">
	<td id="pagetd" height="36" colspan="12" align="center"><!--翻页代码 --></td>
</tr>
</table>

</form>
  

</body>
</html>