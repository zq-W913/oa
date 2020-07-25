<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>创建任务</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="My97DatePicker/WdatePicker.js"></script>
	<script type="application/javascript">
		$(function () {
			getAllEmp();//调用所有员工
			$.ajax({
				url:"pro/showAll?make=2",//查询所有含有需求分析的项目
				dataType:"json",
				type:"get",
				success:function (data) {
					var  opts="";
					$(data.list).each(function (i,pro) {
						opts+="<option value='"+pro.pid+"'>"+pro.pname+"</option>";
					});
					$("#pro").append(opts);
					$("#pro").change();//模拟点击一次获取初始值
				}
			})
		})
		//根据项目主键获取需求分析
		function addayalisys(pid) {
			$.get("any/getAnyByPK?id="+pid,function (data) {
				$("#analysis").val(data.title);
			},"json");

			//选中完项目，跟项目的id查询该项目下面模块信息
			$.get("mod/getModuleByid?id="+pid,function (data) {
				var opts="";
				$(data).each(function (i,module) {
					opts+="<option value='"+module.id+"'>"+module.modname+"</option>";
				});
				$("#mod").html(opts);
				$("#mod").change();//模拟点击模块显示功能的初识值
			},"json")
		}
		//根据选中模块id查询功能列表
		function addfunc(mid) {
			$.get("fun/getFunByMid?id="+mid,function (data) {
				var opts="";
				$(data).each(function (i,fun) {
					opts+="<option value='"+fun.id+"'>"+fun.functionname+"</option>";
				});
				$("#fun").html(opts);

			},"json");
		}
		//获取所有的员工
		function getAllEmp() {
			$.get("emp/user?pageSize=50",function (data) {
				var opts="";
				$(data.list).each(function (i,emp) {
					opts+="<option value='"+emp.eid+"'>"+emp.ename+"</option>";
				});
				$("#emp").html(opts);
			},"json");
		}
		//保存
		function commit() {
			//取出功能id，判断有没有值，没有值不让提交
			var funid=$("#fun").val();
			if(funid!=null){
				$.post("task/commit",$("#form7").serialize(),function (data) {
					if (data){
						location.href="task.jsp";
					}
				},"json")
			}else{
				alert("没有选择功能");
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
    当前位置:任务管理>>创建任务
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" id="form7" action="${pageContext.request.contextPath}/task/addInfo" method="post">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;创建任务&nbsp;</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">参考位置：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select id="pro" onchange="addayalisys(this.value)">
		</select>-
		<input disabled id="analysis">
		-<select id="mod" onchange="addfunc(this.value)">
		</select>-
		<select id="fun" name="funFk">
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">任务标题：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="tasktitle"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">开始时间：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="starttime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">结束时间：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="endtime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">执行者：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select id="emp" name="empFk2">
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">优先级：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select name="level"><option value="高">高</option><option value="中">中</option><option value="低">低</option></select></td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" >详细说明：</td>
	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
		<textarea rows=10 cols=130 name="remark"></textarea>
	</td>
</tr>


<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a href="javascript:commit()" class="coolbg">保存</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>