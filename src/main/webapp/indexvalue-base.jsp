<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>对标管理</title>
	<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<script src="js/jquery-2.1.1.min.js"></script>
	<script>
		$(function () {
			loadData();
		})
		//获取所有项目信息
		function loadData(pageNum,pageSize) {
			$.get("duibiao/showAll",function (data) {
				var trs="";
				$(data.list).each(function (i,iv) {
					trs+="<tr class='newtr' align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
							"\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
							"\t<td>"+iv.inId+"</td>\n" +
							"\t<td><a href=''><u>"+iv.company.dacname+"</u></a></td>\n" +
							"\t<td>"+iv.inTurnover+"</td>\n" +
							"\t<td>"+iv.emp.ename+"</td>\n" +
							"\t<td>"+iv.inStarttime+"</td>\n" +
							"\t<td>"+iv.inEndtime+"</td>\n" +
							"\t<td><a href=\"/"+iv.inFile+"\">附件下载</a> |<a href=\"project-base-edit.jsp\">编辑</a> | <a href=\"project-base-look.jsp\">查看详情</a></td>\n" +
							"</tr>\n";
				});
				$(".newtr").remove();
				$("#trr").after(trs);
				var bottom=" <ul class=\"pagination\">\n" +
						"            <li><a href=\"javascript:loadData(1,5)\">首页</a></li>\n" +
						"            <li><a href=\"javascript:loadData("+(data.isFirstPage?1:data.prePage)+",5)\">上一页</a></li>\n" +
						"            <li><a href=\"javascript:loadData("+(data.isLastPage?data.pages:data.nextPage)+",5)\">下一页</a></li>\n" +
						"            <li><a href=\"javascript:loadData("+data.pages+",5)\">尾页</a></li>\n" +
						"            <li><span>总共"+data.pages+"页</span></li>\n" +
						"            <li><span>当前第"+data.pageNum+"页</span></li>\n" +
						"        </ul>";

				$("#pagetd").html(bottom);
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
				pids.push($(this).val())
			})
			if (pids.length > 0){
				$.ajax({
					url : "duibiao/delById?eids="+pids,
					type : "post",
					dataType : "json",
					success : function (data) {
						if (data){
							loadData();
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
						当前位置:对标管理>>添加指标信息
					</td>
					<td>
						<input type='button' class="coolbg np" onClick="location='indexvalue-add.jsp';" value='添加指标信息' />
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
			<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;指标信息列表&nbsp;</td>
		</tr>
		<tr id="trr" align="center" bgcolor="#FAFAF1" height="22">
			<td width="4%">选择</td>
			<td width="6%">序号</td>
			<td width="15%">目标公司</td>
			<td width="15%">目标营业额(亿)</td>
			<td width="15%">指标制定人</td>
			<td width="15%">指标开始时间</td>
			<td width="15%">指标截止时间</td>
			<td width="15%">操作</td>
		</tr>

		<%--
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
            <td><input name="id" type="checkbox" id="id" value="101" class="np"></td>
            <td>1</td>
            <td><a href=''><u>浪潮集团</u></a></td>
            <td>3亿</td>
            <td>张三丰</td>
            <td>2015-01-03</td>
            <td>2015-02-03</td>
            <td><a href="project-base-edit.jsp">附件下载</a> |<a href="project-base-edit.jsp">编辑</a> | <a href="project-base-look.jsp">查看详情</a></td>
        </tr>
        --%>


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