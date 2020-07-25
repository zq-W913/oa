<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>发件箱</title>
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
				url : "not/showAll",
				type : "get",
				data : {"pageNum" : pageNum,"pageSize" : pageSize},
				dataTyepe : "json",
				success : function (data) {
					var tr="";
					$(data.list).each(function (i,not) {
						tr+="<tr class='newtr' align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
								"\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
								"\t<td>"+not.nid+"</td>\n" +
								"\t<td>"+not.ntitle+"</td>\n" +
								"\t<td align=\"center\"><span >"+not.remark+"</span></td>\n" +
								"\t<td>"+not.ndate+"</td>\n" +
								"\t<td><a >删除</a></td>\n" +
								"</tr>";

					})
					$(".newtr").remove();
					$("#tr2").after(tr);

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
			var pids = []
			$(":checkbox:checked").each(function () {
				alert("222222")
				pids.push($(this).val())
			})
			if (pids.length > 0){
				$.ajax({
					url : "not/delById?eids="+pids,
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
    当前位置:信息箱>>通知公告
 </td>
	  <td>
		  <input type='button' class="coolbg np" onClick="location='notice-send.jsp';" value='发布新通告' />
	  </td>
 </tr>
</table>
</td>
</tr>
</table>

<!--  搜索表单  -->

<!--  内容列表   -->
<form name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;发件箱&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22" id="tr2">
	<td width="4%">选择</td>
	<td width="6%">序号</td>
	<td width="10%">标题</td>
	<td width="10%">内容</td>
	<td width="8%">发送时间</td>
	<td width="8%">操作</td>
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
	<td id="pagetd" height="36" colspan="12" align="center"><!--翻页代码 --></td>
</tr>
</table>

</form>
  

</body>
</html>