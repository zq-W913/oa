<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加附件</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="js/urlparam.js"></script>


	<script type="application/javascript">
		$(function () {
			$.ajaxSettings.async = false;// 设置ajax同步
			getAllPayModel();
			var bxid=getUrlParam("bxid");//接收报销单主键
			$.get("bao/getBxById?bxid="+bxid,function (data) {
				var tr="<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">总金额：</td>\n" +
						"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
						"\t\t<input size=\"26\"  id=\"totalmoney\" name=\"totalmoney\" value=\""+data.totalmoney+"\"/>\n" +
						"\t</td>\n" +
						"</tr>\n" +
						"<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">使用时间：</td>\n" +
						"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
						"\t\t<input size=\"52\" name=\"bxtime\" id=\"bxtime\" value=\""+data.bxtime+"\"/>\n" +
						"\t</td>\n" +
						"</tr>\n" +
						"<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" >备注：</td>\n" +
						"\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >\n" +
						"\t\t<textarea rows=10 cols=130  id=\"bxremark\" name=\"bxremark\">"+data.bxremark+"</textarea>\n" +
						"\t</td>\n" +
						"</tr>\n" ;
						if (data.bxstatus==1){
							$("#a").hide()
						}
						$("#bxid").val(data.bxid);
				var replayTr="";
				//遍历审批记录字段
				$(data.replayList).each(function (i,replay) {
					replayTr+="<tr >\n" +
							"\t\t<td align=\"right\" bgcolor=\"#FAFAF1\" >审批记录：</td>\n" +
							"\t\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >"+replay.content+
							"审批时间："+replay.replytime+" 审批结果："+(replay.bxstatus==1?"<font color='green'>通过</font>":"<font color='red'>驳回</font>")+"</td></tr>" ;
				})
				$("#trr").after(tr+replayTr);

				$("#paymode").val(data.paymode);

			},"json")
		});


		//获取所有的报销类型
		function getAllPayModel() {
			$.get("bao/getAllBxModel",function (data) {
				var opts="";
				$(data).each(function (i,model) {
					opts+="<option value='"+model.etid+"'>"+model.etname+"</option>";
				});
				$("#paymode").html(opts);
			},"json")
		}
		function commit() {
			$.ajax({
				url : "bao/updata",
				type : "get",
				data : $("#form11").serialize(),
				dataType : "json",
				success : function (data) {
					if (data){
						location.href="mybaoxiao-base.jsp";
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
    当前位置:报销管理>>添加新的报销
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" id="form11" >
	<input name="bxid" id="bxid" type="hidden" >
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;添加新的报销单&nbsp;</td>
</tr>
<tr id="trr">
	<td align="right" bgcolor="#FAFAF1" height="22">支出类型：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select name="paymode" id="paymode">
		</select>
	</td>
</tr>
<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a id="a" href="javascript:commit()" class="coolbg">保存</a>
	<a href="mybaoxiao-base.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>