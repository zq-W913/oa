<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>main</title>
    <base target="_self">
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
    <link rel="stylesheet" type="text/css" href="skin/css/main.css" />

    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //获取所有的帖子
            $.get("forum/showAll",function (data) {
                var lis="";
                $(data).each(function (i,forum) {
                    lis+=" <li class=\"ue-clear\">\n" +
                        "                    <a href=\"forum-reply.jsp?fid="+forum.forumid+"\">\n" +
                        "                        <h3>"+forum.forumtitle+"</h3>\n" +
                        "                        <span><img src=\"${pageContext.request.contextPath}/images/tx.png\" height=\"50px\" width=\"50px\"/></span>\n" +
                        "                        <div class=\"out\">\n" +
                        "                            <div>"+forum.forumcontent+"</div>\n" +
                        "                            <div>发布时间："+forum.createtime+"</div>\n" +
                        "                        </div>\n" +
                        "                    </a>\n" +
                        "                </li>";
                });
                $(".notice-list").html(lis);
            },"json");
        })
    </script>

    <style type="text/css">
        *{overflow: auto;}
        ul li a .out,ul li a span{float: left;margin: 3px}
        ul li{border: 1px solid lightgray;margin: 10px;padding: 5px;}
        a:hover{color: black;}
    </style>
</head>
<body leftmargin="8" topmargin='8'>


<div colspan="3" background="skin/images/frame/wbg.gif" bgcolor="#EEF4EA"
     class='title'>
    <span>论坛分类</span> &nbsp; &nbsp;&nbsp;|<span>生活广场</span> |<span>租房信息</span>
    <a href='forum-add.jsp' style='margin-left: 60px'>
        <font size="5">发帖</font></a>
</div>

<ul class="notice-list">

</ul>

</body>
</html>