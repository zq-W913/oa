<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>编辑角色信息</title>
	<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/urlparam.js"></script>
	<script>
		var roleid=getUrlParam("roleid");
		$(function () {
			$.ajaxSettings.async=false;//变成同步加载
			//获取角色的数据
			$.get("role/getRoleByPk?roleid="+roleid,function (data) {
				var tr1="<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">角色编号：</td>\n" +
						"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='roleid' readonly value='"+data.roleid+"'></td>\n" +
						"</tr>\n" +
						"<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">角色名称：</td>\n" +
						"\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\"><input name='rolename' value=\""+data.rolename+"\"/></td>\n" +
						"</tr>";

				$("#tr1").after(tr1);

				//选择角色的状态
				$("#status").val(data.status);
				var  tr2="<tr >\n" +
						"\t<td align=\"right\" bgcolor=\"#FAFAF1\" >描述：</td>\n" +
						"\t<td colspan=3 align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" >\n" +
						"\t\t<textarea name='roledis' rows=10 cols=130>"+data.roledis+"</textarea>\n" +
						"\t</td>\n" +
						"</tr>";
				$("#tr2").after(tr2);
			},"json");

			//获取所有的权限
			$.get("source/showAll",function (data) {
				var td=showAllSource(data);
				$("#tdd").html(td);
			});
			//默认选中角色的权限
			$.get("source/getSourceByRoleid?roleid="+roleid,function (data) {
				$(data).each(function (i,role_source) {
					$(":checkbox[value='"+role_source.sid+"']").prop("checked",true);
				})
			})
		});


		//递归遍历权限树
		function showAllSource(data) {
			var src="";
			for (var i=0;i<data.length;i++){
				var source=data[i];
				if (source.children.length==0){//最小的子菜单
					src+="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
							"<input type=\"checkbox\" name='sources' value='"+source.id+"'/>"+source.name+"<br/>";
				}else if (source.pid==1){//二级菜单
					src+="&nbsp;&nbsp;&nbsp;&nbsp;" +
							"<input type=\"checkbox\" name='sources' value='"+source.id+"'/>"+source.name+"<br/>";
				}else{//一级菜单
					src+="&nbsp;" +
							"<input type=\"checkbox\" name='sources' value='"+source.id+"'/>"+source.name+"<br/>";
				}


				if (source.children.length>0){
					src+=showAllSource(source.children);
				}
			}
			return src;
		}

		//保存数据
		function commit() {
			$.post("role/updateRole",$("#form2").serialize(),function (data) {
				if (data){
					location.href="role.jsp";
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
						当前位置:权限管理>>编辑角色
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<form name="form2" id="form2">

	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr id="tr1" bgcolor="#E7E7E7">
			<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;编辑角色&nbsp;</td>
		</tr>

		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">状态：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<select name="status" id="status">
					<option value=1>启用</option>
					<option value=0>禁用</option>
				</select></td>
		</tr>
		<tr  id="tr2">
			<td align="right" bgcolor="#FAFAF1" height="22">赋菜单资源：</td>
			<td id="tdd" align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<%--
                <input type="checkbox" checked/>项目管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>基本信息管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>需求分析管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>模块管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>功能管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>附件管理<br/>

                <input type="checkbox" checked/>任务管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>创建任务<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>任务信息<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>我的任务<br/>
                --%>
			</td>
		</tr>




		<tr bgcolor="#FAFAF1">
			<td height="28" colspan=4 align=center>
				&nbsp;
				<a href="javascript:commit()" class="coolbg">保存</a>
				<a href="role.jsp" class="coolbg">返回</a>
			</td>
		</tr>
	</table>

</form>


</body>
</html>