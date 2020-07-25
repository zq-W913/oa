<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>添加需求分析信息</title>
	<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/utf8-jsp/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/utf8-jsp/ueditor.all.min.js"> </script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
	<script src="js/urlparam.js"></script>
	<script type="application/javascript">
		var ue = UE.getEditor('editor');
		var fid=getUrlParam("fid");
		$(function(){
			$("#forumFk").val(fid);
			loadData();
		})


		//获取数据
		function loadData() {
			$.ajax({
				url:"forum/getForumByPk?fid="+fid,
				dataType:"json",
				type:"get",
				success:function (data) {
					var trs="<tr class='newtr'>\n" +
							"\t\t\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">\n" +
							"\t\t\t\t<span >\n" +
							"\t\t\t\t\t<img src='${pageContext.request.contextPath}/images/tx.png' height='50px' width='50px'/>\n" +
							"\t\t\t\t</span>\n" +
							"\t\t\t</td>\n" +
							"\t\t\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
							"\t\t\t\t<span>发布人："+data.emp.ename+"</span><br>\n" +
							"\t\t\t\t<span>发布时间："+data.createtime+" </span><br>\n" +
							"\t\t\t\t<span>标题："+data.forumtitle+" </span>\n" +
							"\t\t\t\t<span>内容："+data.forumcontent+"</span>\n" +
							"\t\t\t<div><a href='javascript:huifu()'>【回复】</a></div></td>\n" +
							"\t\t</tr>";

					$(data.pinglunList).each(function (i,pinglun) {
						trs+="<tr class='newtr'>\n" +
								"\t\t\t<td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">\n" +
								"\t\t\t\t\t<span >\n" +
								"\t\t\t\t\t\t<img src='${pageContext.request.contextPath}/images/tx.png' height='50px' width='50px'/>\n" +
								"\t\t\t\t\t</span>\n" +
								"\t\t\t</td>\n" +
								"\t\t\t<td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
								"\t\t\t\t<span>评论人："+pinglun.emp.ename+"</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
								"\t\t\t\t<span></span><br>\n" +
								"\t\t\t\t<span>评论内容："+pinglun.evacontent+" </span>\n" +
								"\t\t\t\t&nbsp;<span><a href=\"javascript:huifu("+pinglun.evaid+")\">【回复】</a></span>\n" +
								"\t\t\t</td>\n" +
								"\t\t  </tr>";
						trs+=getHuiFu(pinglun.emp,pinglun.huifuList);
					})


					$(".newtr").remove();//清空老数据
					$("#trr").after(trs);
				}
			});
		}
		//获取评论的回复，可能回复还有回复
		function getHuiFu(emp,repaly) {
			var data="";
			if (repaly&&repaly.length>0){//说明评论中有回复
				for(var i=0;i<repaly.length;i++){
					var re=repaly[i];
					data+="<tr class='newtr'>\n" +
							"\t\t\t  <td align=\"right\" bgcolor=\"#FAFAF1\" height=\"22\">\n" +
							"\t\t\t\t<span >\n" +
							"\t\t\t\t\t\t<img src='${pageContext.request.contextPath}/images/tx.png' height='50px' width='50px'/>\n" +
							"\t\t\t\t</span>\n" +
							"\t\t\t  </td>\n" +
							"\t\t\t  <td  align='left' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
							"\t\t\t\t\t<span>"+re.emp.ename+"&nbsp;回复了&nbsp;"+emp.ename+"</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
							"\t\t\t\t\t<span>回复时间："+re.evatime+"</span><br>\n" +
							"\t\t\t\t\t<span>回复内容:"+re.evacontent+"</span>\n" +
							"\t\t\t\t\t&nbsp;<span><a href=\"javascript:huifu("+re.evaid+")\">【回复】</a></span>\n" +
							"\t\t\t  </td>\n" +
							"\t\t  </tr>";
					//判断回复中有误回复，如果有递归再遍历
					if (re.huifuList&&re.huifuList.length>0){
						data+=getHuiFu(re.emp,re.huifuList);
					}
				}

			}
			return data;
		}
		//如果是回复的回复，取出回复的主键作为新的回复的外键
		function huifu(evaid) {
			$("#evaidFk").val(evaid);
		}

		//提交评论
		function commit() {
			$.post("forum/savaEvaid",$("#form15").serialize(),function (data) {
				if (data){
					loadData();
				}
			},"json")
		}
	</script>
	<style type="text/css">
		div{
			width:100%;
		}
	</style>
</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" c1ellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
		<td height="26" background="skin/images/newlinebg3.gif">
			<table width="58%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td >
						当前位置:论坛>>评论
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<div>

	<form name="form2" id="form15" method="post">

		<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
			<tr id="trr" bgcolor="#E7E7E7">
				<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;评论&nbsp;
					<input name="forumFk" id="forumFk" type="hidden"></td>
				<input name="evaidFk" id="evaidFk" type="hidden"/>
			</tr>
			<%--主贴内容--%>
			<%--<tr >
                <td align="right" bgcolor="#FAFAF1" height="22">
                    <span >
                        <img src='${pageContext.request.contextPath}/images/tx.png' height='50px' width='50px'/>
                    </span>
                </td>
                <td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                    <span>发布人：张三</span><br>
                    <span>发布时间：2019-09-09 </span><br>
                    <span>标题：租房 </span>
                    <span>内容：水电费第三方</span>
                </td>
            </tr>
    --%>
			<%--所有对于主贴的直接评论--%>
			<%--<tr >
                <td align="right" bgcolor="#FAFAF1" height="22">
                        <span >
                            <img src='${pageContext.request.contextPath}/images/tx.png' height='50px' width='50px'/>
                        </span>
                </td>
                <td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                    <span>评论人：李四</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span></span><br>
                    <span>评论内容：你好评论时间：2019-09-09 </span>
                    &nbsp;<span><a href="#">【回复】</a></span>
                </td>
              </tr>--%>
			<%-- 评论 的回复--%>
			<%--<tr>
                <td align="right" bgcolor="#FAFAF1" height="22">
                  <span >
                          <img src='${pageContext.request.contextPath}/images/tx.png' height='50px' width='50px'/>
                  </span>
                </td>
                <td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                      <span>张三&nbsp;回复了&nbsp;李四</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <span>回复时间：2019-09-09</span><br>
                      <span>回复内容:不好</span>
                      &nbsp;<span><a href="#">【回复】</a></span>
                </td>
            </tr>--%>









			<%  for(int i=0;i<3;i++){%>
			<tr>
				<td align="right" bgcolor="#FAFAF1" height="22"></td>
				<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				</td>
			</tr>
			<% } %>


			<tr >
				<td align="right" bgcolor="#FAFAF1" height="22">我也说两句：</td>
				<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<script id="editor" name="evacontent" type="text/plain" style="width:1024px;height:100px;"></script>
				</td>
			</tr>
			<tr bgcolor="#FAFAF1">
				<td height="28" colspan=4 align=center>
					&nbsp;
					<a href="javascript:commit()" class="coolbg">发布</a>
					<a href="project-need.jsp" class="coolbg">返回</a>
				</td>
			</tr>

		</table>
	</form>

</div>

</body>
</html>