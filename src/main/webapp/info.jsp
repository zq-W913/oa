<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>我的信息</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" SRC="js/jquery-2.1.1.min.js"></script>
	<script type="application/javascript">
		$(function () {
			$.ajax({
				url : "emp/info",
				type : "post",
				dataType : "json",
				success : function (data) {
					var tr = "<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">职位：</td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">"+data.position.name+"</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">姓名：</td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">"+data.ename+"</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">性别：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">"+(data.esex == 0 ? "女" : "男")+"</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">年龄：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">"+data.eage+"</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">联系电话：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">"+data.telephone+"</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">入职时间：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">"+data.hiredate+"</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">身份证号码：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">"+data.pnum+"</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">状态：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">正常</td>\n" +
							"</tr>\n" +
							"\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" >备注：</td>\n" +
							"\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >\n" +
							"\t\t"+data.remark+"\n" +
							"\t</td>\n" +
							"</tr>";
					$("#trr").after(tr);
				}
			})
		})
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
    当前位置:我的信息>>我的信息
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr id="trr" bgcolor="#E7E7E7">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;我的信息&nbsp;</td>
</tr>


</table>

</form>
  

</body>
</html>