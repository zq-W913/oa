<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加功能信息</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="application/javascript">
		$(function () {
			//获取所有的有需求分析的项目
			$.ajax({
				url:"pro/showAll?make=2",
				dataType:"json",
				type:"get",
					success:function (data) {
					var  opts="";
					$(data.list).each(function (i,pro) {
						opts+="<option value='"+pro.pid+"'>"+pro.pname+"</option>";
					});
					$("#pro").append(opts);
					$("#pro").change();
				}
			})
		})
		//点击项目带出需求分析
		function addayalisys(pid) {
			$.ajax({
				url:"any/getAnyByPK?id="+pid,
				dataType:"json",
				type:"get",
				success:function (data) {
					var opt="<option value='"+data.id+"'>"+data.title+"</option>";
					$("#anid").html(opt);
					$("#anid").change();//模拟需求分析的点击事件
				}
			})
		}

		//根据需求分析的id查询该需求下面的模块
		function getModuleByAid(aid) {
			$.ajax({
				url:"mod/getModuleByid?id="+aid,
				dataType:"json",
				type:"get",
				success:function (data) {
					if (data.length==0){
						alert("当前需求分析下面没有模块，请先添加模块信息");
						$("#submit").hide();//让保存按钮消失
					}else{
						$("#submit").show();//让保存按钮显示
					}

					var opt="";
					$(data).each(function (i,module) {
						opt+="<option value='"+module.id+"'>"+module.modname+"</option>";
					});
					$("#mod").html(opt);
				}
			})
		}
		//保存提交
		function commit() {
			$.ajax({
				url:"fun/commit",
				data:$("#form5").serialize(),
				type:"post",
				dataType:"json",
				success:function (data) {
					if (data){
						location.href="project-function.jsp";
					}
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
    当前位置:项目管理>>添加功能信息
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" action="${pageContext.request.contextPath}/function/saveInfo" method="post" id="form5">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;添加新功能&nbsp;</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">选择项目：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select id="pro" name="proname" onchange="addayalisys(this.value)">
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">选择需求：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select id="anid" name="analysisname" onchange="getModuleByAid(this.value)">
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">选择模块：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select id="mod" name="modeleFk">
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">功能名称：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input type="text" name="functionname" id="gn" onblur="checkContent(this.value)" />
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">优先级：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><select name="level"><option value="高">高</option><option value="中">中</option ><option value="低">低</option><option value="暂缓">暂缓</option></select></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">简单描述：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><textarea rows=10 cols=130 name="simpledis"></textarea></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">详细描述：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><textarea rows=15 cols=130 name="detaileddis"></textarea></td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" >备注：</td>
	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
		<textarea rows=10 cols=130 name="remark"></textarea>
	</td>
</tr>


<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a id="submit" href="javascript:commit()" class="coolbg">保存</a>
	<a href="project-function.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>