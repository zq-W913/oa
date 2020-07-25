<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>编辑用户信息</title>
	<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/urlparam.js"></script>
	<script>
		$(function () {
			//显示所有的职位
			$.get("emp/getAllPosition",function (data) {
				var opts="";
				$(data).each(function (i,positioin) {
					opts+="<option value='"+positioin.id+"'>"+positioin.name+"</option>"
				});
				$("#postision").html(opts);

			},"json");
			//获取所有的角色
			$.get("role/showAll",function (data) {
				var ck="";
				$(data.list).each(function (i,role) {
					ck+="<input name='roles' type=\"checkbox\" value='"+role.roleid+"'/>"+role.rolename+"";
				});
				$("#roletr").html(ck);
			},"json");

			//获取员工数据
			$.get("emp/getById?eid="+getUrlParam("eid"),function (data) {
				var tr="<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">姓名：<input type='hidden' name='eid' value='"+data.eid+"'></td>\n" +
						"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='ename' value=\""+data.ename+"\"/></td>\n" +
						"</tr>\n" +
						"<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">性别：</td>\n" +
						"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><select id='sex' name='esex'><option value=1>男</option><option value=0>女</option></select></td>\n" +
						"</tr>\n" +
						"<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">年龄：</td>\n" +
						"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='eage' value=\""+data.eage+"\"/></td>\n" +
						"</tr>\n" +
						"<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">联系电话：</td>\n" +
						"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='telephone' value=\""+data.telephone+"\"/></td>\n" +
						"</tr>\n" +
						"<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">入职时间：</td>\n" +
						"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='hiredate' value=\""+data.hiredate+"\"/></td>\n" +
						"</tr>\n" +
						"<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">身份证号码：</td>\n" +
						"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='pnum' value=\""+data.pnum+"\"/></td>\n" +
						"</tr>\n" +
						"<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">用户名：</td>\n" +
						"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='username' value='"+data.username+"'/></td>\n" +
						"</tr>\n" +
						"<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">密码：</td>\n" +
						"\t<td align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='password' type='password' value='"+data.password+"'/></td>\n" +
						"</tr>";
				$("#trr").after(tr);
				//选中职位
				$("#postision").val(data.pFk);
				//选中姓名
				$("#sex").val(data.esex);

				var remark="<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" >备注：</td>\n" +
						"\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >\n" +
						"\t\t<textarea name='remark' rows=10 cols=130>"+data.remark+"</textarea>\n" +
						"\t</td>";
				$("#tr2").after(remark);

				//选中用户的角色
				$(data.empRoleList).each(function (i,empRole) {
					$(":checkbox[value='"+empRole.roleFk+"']").prop("checked",true);
				})
			},"json");
		})
		function updateEmp() {
			$.ajax({
				url : "emp/updateEmp",
				type : "post",
				data : $("#form2").serialize(),
				dataType : "json",
				success : function (data) {
					if (data){
						location.href="user.jsp"
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
						当前位置:权限管理>>编辑用户
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<form name="form2" id="form2">

	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;编辑用户&nbsp;</td>
		</tr>
		<tr id="trr">
			<td align="right" bgcolor="#FAFAF1" height="22">职位：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<select id="postision" name="pFk"></select></td>
		</tr>

		<tr id="tr2">
			<td align="right" bgcolor="#FAFAF1" height="22">赋角色：</td>
			<td id="roletr" align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<%--<input type="checkbox"/>管理员
                <input type="checkbox"/>项目经理
                <input type="checkbox" checked/>程序员--%>
			</td>
		</tr>

		<%--<tr >
            <td align="right" bgcolor="#FAFAF1" >备注：</td>
            <td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
                <textarea rows=10 cols=130>暂无</textarea>
            </td>
        </tr>--%>


		<tr bgcolor="#FAFAF1">
			<td height="28" colspan=4 align=center>
				&nbsp;
				<a href="javascript:updateEmp()" class="coolbg">保存</a>
				<a href="user.jsp" class="coolbg">返回</a>
			</td>
		</tr>
	</table>

</form>


</body>
</html>