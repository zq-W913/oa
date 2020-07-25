<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>客户信息管理</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

    <script type="application/javascript">
        $(function () {
            loadData(1,5);
        })
        //获取所有员工信息
        function loadData(pageNum,pageSize) {
            $.ajax({
                url : "cus/showAll",
                type : "post",
                data : {"pageNum" : pageNum,"pageSize" : pageSize, "type" : $("#mt").val(), "keyword":$("#info").val(),"orderby":$("#mtime").val()},
                dataTyepe : "json",
                success : function (data) {
                    var tr = "";
                    $(data.list).each(function (index,cus) {
                        tr += "<tr class='newtr' align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
                            "\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
                            "\t<td>"+cus.id+"</td>\n" +
                            "\t<td>"+cus.companyperson+"</td>\n" +
                            "\t<td align=\"center\">"+cus.comname+"</td>\n" +
                            "\t<td>"+cus.addtime+"</td>\n" +
                            "\t<td>"+cus.comphone+"</td>\n" +
                            "\t<td><a href=\"customer-edit.jsp\">编辑</a> | <a href=\"customer-look.jsp\">查看详情</a></td>\n" +
                            "</tr>"
                    })
                    $(".newtr").remove();
                    $("#tr2").after(tr);
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
        function delCusById() {
            var ids = []
            $(":checkbox:checked").each(function () {
                ids.push($(this).val())
            })
            if (ids.length > 0){
                $.ajax({
                    url : "cus/delById?ids="+ids,
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

        //导入
        function importExcle() {
            var formData = new FormData($('#cusexcel')[0]);
            $.ajax({
                url : "cus/uploadExcel",
                type : "post",
                data : formData,
                dataType : "json",
                cache: false,//不适用缓存
                processData: false,//必须false才会避开jQuery对 formdata 的默认处理, XMLHttpRequest会对 formdata 进行正确的处理
                contentType: false,   //必须false才会自动加上正确的Content-Type
                success : function (data) {
                    if (data){
                        loadData(1,5);
                    }
                }
            })
        }
        //excel导出
        function downExcel() {
            $.ajax({
                url:"cus/downExcel",
                type:"get",
                dataType:"text",  //不让js将返回的数据解析成json
                success:function (data) {
                    location.href="/"+data;
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
    当前位置:客户信息管理>>客户信息
 </td>
  <td>
    <input type='button' class="coolbg np" onClick="location='customer-add.jsp';" value='添加客户信息' />
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<!--  搜索表单  -->

<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
  <tr bgcolor='#EEF4EA'>
    <td background='skin/images/wbg.gif' align='center'>
      <table border='0' cellpadding='0' cellspacing='0'>
        <tr>
          <td width='90' align='center'>搜索条件：</td>
          <td width='160'>
          <select id="mt" name='cid' style='width:150'>
            <option value='0'>选择类型...</option>
          	<option value='1'>客户所在公司名称</option>
          	<option value='2'>联系人姓名</option>
          </select>
        </td>
        <td width='70'>
          关键字：
        </td>
        <td width='160'>
          	<input type='text' id="info"  name='keyword' style='width:120px' />
        </td>
        <td width='110'>
    		<select id="mtime" name='orderby' style='width:120px'>
                <option value='1'>编号升序</option>
                <option value='2'>编号降序</option>
      	    </select>
        </td>
        <td>
          &nbsp;&nbsp;&nbsp;<input name="imageField" onclick="loadData()" type="image" src="skin/images/frame/search.gif" width="45" height="20" border="0" class="np" />
        </td>
       </tr>
      </table>
    </td>
  </tr>
</table>

<!--  内容列表   -->


<table id="infotb" width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7" >
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;需求列表&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22" id="tr2">
	<td width="4%">选择</td>
	<td width="6%">序号</td>
	<td width="10%">联系人</td>
	<td width="10%">公司名称</td>
	<td width="8%">添加时间</td>
	<td width="8%">联系电话</td>
	<td width="10%">操作</td>
</tr>










<tr bgcolor="#FAFAF1">
<td height="28" colspan="12">
	&nbsp;
    <a href="javascript:checkAll()" class="coolbg">全选</a>
    <a href="javascript:decheckAll()" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="javascript:delCusById()" class="coolbg">&nbsp;删除</a>
    <form id="cusexcel">
        <input type="file" name="file">
        <a href="javascript:importExcle()" class="coolbg">导入Excel</a>
    </form>
    <a href="javascript:downExcel()" class="coolbg">&nbsp;导出Excel&nbsp;</a>
</td>
</tr>
<tr align="right" bgcolor="#EEF4EA">
	<td id="pagetd" height="36" colspan="12" align="center"><!--翻页代码 --></td>
</tr>
</table>


  

</body>
</html>