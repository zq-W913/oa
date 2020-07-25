<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>编辑模块信息</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/urlparam.js"></script>
	<script>
		$(function () {
			$.ajax({
				url:"mod/getModuleByPk?id="+getUrlParam("mid"),
				type:"get",
				dataType:"json",
				success:function (data) {
					var tr="<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">选择项目：<input type='hidden' name='id' value='"+data.id+"'></td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">"+data.project.pname+"</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">选择需求：</td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">"+data.analysis.title+"</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">模块名称：</td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='modname' value=\""+data.modname+"\"/></td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">优先级：</td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">" +
							"<select id='level' name='level'>" +
							"<option value='高'>高</option>" +
							"<option value='中'>中</option>" +
							"<option value='低'>低</option>" +
							"<option value='暂缓'>暂缓</option>" +
							"</select></td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">简单描述：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><textarea name='simpledis' rows=10 cols=130>"+data.simpledis+"</textarea></td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">详细描述：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><textarea name='detaileddis' rows=15 cols=130>"+data.detaileddis+"</textarea></td>\n" +
							"</tr>\n" +
							"\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" >备注：</td>\n" +
							"\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >\n" +
							"\t\t<textarea name='remark' rows=10 cols=130>"+data.remark+"</textarea>\n" +
							"\t</td>\n" +
							"</tr>";
					$("#trr").after(tr);
					$("#level").val(data.level);//默认选中等级
				}
			})
		});

		function submit() {
			$.ajax({
				url:"mod/update",
				data:$("#form2").serialize(),
				type:"get",
				dataType:"json",
				success:function (data) {
					if (data){
						location.href="project-model.jsp";
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
    当前位置:项目管理>>编辑模块信息
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form id="form2" name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr id="trr" bgcolor="#E7E7E7">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;编辑模块&nbsp;</td>
</tr>


<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a href="javascript:submit()" class="coolbg">保存</a>
	<a href="project-model.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>