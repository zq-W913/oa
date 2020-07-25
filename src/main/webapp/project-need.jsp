<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>需求分析管理</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <script src="js/jquery-2.1.1.min.js"></script>
    <script>
        $(function () {
            loadData(1,5);
        })
        //获取所有项目需求信息
        function loadData(pageNum,pageSize) {
            $.ajax({
                url : "any/showAll",
                type : "get",
                data : {"pageNum" : pageNum,"pageSize" : pageSize},
                dataTyepe : "json",
                success : function (data) {
                    var tr = "";
                    $(data.list).each(function (index,any) {
                        tr += "<tr class='newtr' align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
                            "\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
                            "\t<td>"+any.id+"</td>\n" +
                            "\t<td>"+any.title+"</td>\n" +
                            "\t<td align=\"center\"><a href=''><u>"+any.project.pname+"</u></a></td>\n" +
                            "\t<td>"+any.addtime+"</td>\n" +
                            "\t<td>"+any.updatetime+"</td>\n" +
                            "\t<td><a href=\"project-need-edit.jsp?aid="+any.id+"\">编辑</a> | <a href=\"project-need-look.jsp\">查看详情</a></td>\n" +
                            "</tr>";
                    })
                    $(".newtr").remove();
                    $("#trr").after(tr);

                    var bottom=" <ul class=\"pagination\">\n" +
                        "            <li><a href=\"javascript:loadData(1,5)\">首页</a></li>\n" +
                        "            <li><a href=\"javascript:loadData("+(data.isFirstPage?1:data.prePage)+",5)\">上一页</a></li>\n" +
                        "            <li><a href=\"javascript:loadData("+(data.isLastPage?data.pages:data.nextPage)+",5)\">下一页</a></li>\n" +
                        "            <li><a href=\"javascript:loadData("+data.pages+",5)\">尾页</a></li>\n" +
                        "            <li><span>总共"+data.pages+"页</span></li>\n" +
                        "            <li><span>当前第"+data.pageNum+"页</span></li>\n" +
                        "        </ul>";

                    $("#pagetd").html(bottom);
                }
            })
        }
        //全选全不选
        var checked = true;
        function checkAll() {
            $(":checkbox").prop("checked",checked)
            checked = !checked
        }
        //反选
        function decheckAll() {
            $(":checkbox").each(function () {
                $(this).prop("checked",!$(this).prop("checked"))
            })
        }

        //删除
        function delEmpById() {
            var pids = []
            $(":checkbox:checked").each(function () {
                pids.push($(this).val())
            })
            if (pids.length > 0){
                $.ajax({
                    url : "any/delById?eids="+pids,
                    type : "post",
                    dataType : "json",
                    success : function (data) {
                        if (data){
                            loadData(1,5);
                        }
                    },
                    error : function () {
                        alert("此数据为重要数据，无法删除")
                    }
                })
            }else {
                alert("请选择要删除的选项")
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
    当前位置:项目管理>>需求分析管理
 </td>
  <td>
    <input type='button' class="coolbg np" onClick="location='project-need-add.jsp';" value='添加新项目需求' />
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<!--  搜索表单  -->
<form name='form3' action='' method='get'>
<input type='hidden' name='dopost' value='' />
<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
  <tr bgcolor='#EEF4EA'>
    <td background='skin/images/wbg.gif' align='center'>
      <table border='0' cellpadding='0' cellspacing='0'>
        <tr>
          <td width='90' align='center'>搜索条件：</td>
          <td width='160'>
          <select name='cid' style='width:150'>
          <option value='0'>选择类型...</option>
          	<option value='1'>项目名称</option>
          	<option value='1'>标题</option>
          </select>
        </td>
        <td width='70'>
          关键字：
        </td>
        <td width='160'>
          	<input type='text' name='keyword' value='' style='width:120px' />
        </td>
        <td width='110'>
    		<select name='orderby' style='width:120px'>
            <option value='id'>排序...</option>
            <option value='pubdate'>添加时间</option>
            <option value='pubdate'>修改时间</option>
      	</select>
        </td>
        <td>
          &nbsp;&nbsp;&nbsp;<input name="imageField" type="image" src="skin/images/frame/search.gif" width="45" height="20" border="0" class="np" />
        </td>
       </tr>
      </table>
    </td>
  </tr>
</table>
</form>
<!--  内容列表   -->
<form name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;需求列表&nbsp;</td>
</tr>
<tr id="trr" align="center" bgcolor="#FAFAF1" height="22">
	<td width="4%">选择</td>
	<td width="6%">序号</td>
	<td width="10%">标题</td>
	<td width="10%">项目名称</td>
	<td width="8%">添加时间</td>
	<td width="8%">修改时间</td>
	<td width="10%">操作</td>
</tr>



<tr bgcolor="#FAFAF1">
<td height="28" colspan="12">
	&nbsp;
    <a href="javascript:checkAll()" class="coolbg">全选</a>
    <a href="javascript:decheckAll()" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="javascript:delEmpById()" class="coolbg">&nbsp;删除</a>
    <a href="" class="coolbg">&nbsp;导出Excel&nbsp;</a>
</td>
</tr>
<tr align="right" bgcolor="#EEF4EA">
	<td id="pagetd" height="36" colspan="12" align="center"><!--翻页代码 --></td>
</tr>
</table>

</form>
  

</body>
</html>