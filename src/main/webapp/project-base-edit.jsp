<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>编辑项目信息</title>
	<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/urlparam.js"></script>
	<script src="My97DatePicker/WdatePicker.js"></script>
	<script>
		$(function () {
			loadData();
			getCusList();
			getEmpByPfk();
		})
		function loadData() {
			$.ajax({
				url : "pro/getProById",
				type : "get",
				data : {"pid" : getUrlParam("pid")},
				async : false,
				dataType : "json",
				success : function (data) {
					pro=data;
					var tr="<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">项目名称：<input type='hidden' name='pid' value='"+data.pid+"'></td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name=\"pname\" value=\""+data.pname+"\"/></td>\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">客户公司名称：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
							"\t\t<select id=\"com\" name=\"comname\" onchange=\"getCusByPk(this.value)\"></select>\n" +
							"\t</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">客户方负责人：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input id=\"cp\" disabled/></td>\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">项目经理：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
							"\t\t<select id=\"emp\" name=\"empFk\"></select>\n" +
							"\t</td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">开发人数：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name=\"empcount\" value=\""+data.empcount+"\">人</td>\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">开始时间：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input onClick=\"WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})\" name=\"starttime\" value=\""+data.starttime+"\"/></td>\n" +
							"</tr>\n" +
							"<tr >\n" +
							"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">立项时间：</td>\n" +
							"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input onClick=\"WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})\" name=\"buildtime\" value=\""+data.buildtime+"\"/></td>\n" +
					"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">预估成本：</td>\n" +
					"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name=\"cost\" value=\""+data.cost+"\"/>万</td>\n" +
					"</tr>\n" +
					"<tr >\n" +
					"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">级别：</td>\n" +
					"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><select id=\"level\" name=\"level\"><option value=1>紧急</option><option value=2>一般</option><option value=3>暂缓</option></select></td>\n" +
					"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">计划完成时间：</td>\n" +
					"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input onClick=\"WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})\" name=\"endtime\" value=\""+data.endtime+"\"/></td>\n" +
					"</tr>\n" +
					"\n" +
					"<tr >\n" +
					"\t<td align=\"right\" bgcolor=\"#FAFAF1\" >备注：</td>\n" +
					"\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >\n" +
					"\t\t<textarea name=\"remark\" rows=15 cols=130>"+data.remark+"</textarea>\n" +
					"\t</td>\n" +
					"</tr>"
					$("#trr").after(tr);
					$("#level").val(data.level);
				}
			})
		}
		//获取客户信息的下拉选择框
		function getCusList() {
			$.ajax({
				url : "cus/showAll",
				data : {"pageSize" : 20},
				type : "get",
				async : false,
				dataType : "json",
				success : function (data) {
					var op = "";
					$(data.list).each(function (index,cus) {
						op+="<option value='"+cus.id+"'>"+cus.comname+"</option>";
					})
					$("#com").append(op);
					$("#com").val(pro.comname);
					$("#com").change();
				}
			})
		}
		//通过客户信息的id获取客户姓名
		function getCusByPk(id) {
			$.ajax({
				url : "cus/getCusByPk",
				type : "get",
				data : {"id" : id},
				async : false,
				datatype : "json",
				success : function (data) {
					$("#cp").val(data.companyperson)
				}
			})
		}
		//获取项目经理的下拉选择框
		function getEmpByPfk() {
			var op = "";
			$.ajax({
				url : "emp/getEmpByPfk",
				type : "get",
				data : {"pFk" : "4"},
				async : false,
				dataType : "json",
				success : function (data) {
					$(data).each(function (index,emp) {
						op+="<option value='"+emp.eid+"'>"+emp.ename+"</option>";
					})
					$("#emp").append(op);
					$("#emp").val(pro.empFk)
				}
			})
		}
		//修改保存
		function connet() {
			$.ajax({
				url : "pro/connet",
				type : "post",
				data : $("#form2").serialize(),
				dataTyoe : "json",
				success : function (data) {
					location.href = "project-base.jsp"
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
						当前位置:项目管理>>编辑项目基本信息
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<form id="form2" name="form2">

	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr id="trr" bgcolor="#E7E7E7">
			<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;编辑项目信息&nbsp;</td>
		</tr>



		<tr bgcolor="#FAFAF1">
			<td height="28" colspan=4 align=center>
				&nbsp;
				<a href="javascript:connet()" class="coolbg">保存</a>
				<a href="project-base.jsp" class="coolbg">返回</a>
			</td>
		</tr>
	</table>

</form>

</body>

</html>