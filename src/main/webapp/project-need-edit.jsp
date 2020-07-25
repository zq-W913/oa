<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>编辑需求分析信息</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/urlparam.js"></script>
	<script>
		$(function () {
			$.ajax({
				url : "any/getAnyByPK",
				type : "get",
				data : {"id" : getUrlParam("aid")},
				dataType : "json",
				success : function (data) {
					var tr = "";
					tr += "<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">项目：<input type='hidden' name='id' value='"+data.id+"'></td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">"+data.project.pname+"</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">标题：</td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='title' value=\""+data.title+"\"/></td>\n" +
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
				}
			})
		})
		function updata() {
			$.ajax({
				url : "any/updata",
				type : "post",
				data : $("#form2").serialize(),
				dataType : "json",
				success : function (data) {
					if (data){
						location.href = "project-need.jsp";
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
    当前位置:项目管理>>编辑需求分析信息
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form id="form2" name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr id="trr" bgcolor="#E7E7E7">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;编辑需求信息&nbsp;</td>
</tr>



<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a href="javascript:updata()" class="coolbg">保存</a>
	<a href="project-need.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>