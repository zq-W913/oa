<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>编辑附件</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="js/urlparam.js"></script>


   <script type="application/javascript">

	   $(function () {
		   //加载报销数据
		   $.get("bao/getBxById?bxid="+getUrlParam("bxid"),function (bx) {
					var tr="<tr >\n" +
							"\t<td colspan=\"2\"  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
							"\t\t<input  type=\"hidden\" name=\"bxid\" id=\"bxid\" value='"+bx.bxid+"'/>\n" +
							"\t</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">金额：</td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
							"\t\t<input  readonly=\"true\" value='"+bx.totalmoney+"'/></td>\n" +
							"</tr>\n" +
							"<tr>\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">使用时间</td>\n" +
							"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
							"\n" +
							"\t\t<input readonly=\"true\" value='"+bx.bxtime+"' /></td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" >备注：</td>\n" +
							"\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >\n" +
							"\t\t<textarea rows=10 cols=130 readonly=\"true\">"+bx.bxremark+"</textarea>\n" +
							"\t</td>\n" +
							"</tr>\n" +
							"\t<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" >批准信息：</td>\n" +
							"\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >\n" +
							"\t\t<!-- 批注信息 -->\n" +
							"\t\t<textarea rows=10 id=\"pizhu\" cols=130 name=\"result\" ></textarea>\n" +
							"\t</td>\n" +
							"</tr >";

							$("#trr").before(tr);

		   },"json")
	   })

	   function commit(obj){
	   		$("#bxstatus").val(obj);
			$.ajax({
				url:"bao/commit",
				data:$("#form10").serialize(),
				type:"post",
				success:function (data) {
					if (data){
						location.href="baoxiao-task.jsp";
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
    当前位置:项目管理>>报销审批
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" id="form10">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">


<tr id="trr" bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a href="javascript:commit(1)" class="coolbg">同意</a>
	<a href="javascript:commit(2)" class="coolbg">驳回</a>
</td>
</tr>
</table>
<input name="bxstatus" id="bxstatus" type="hidden" >
</form>
  

</body>
</html>