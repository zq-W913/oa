<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>对标管理</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/eacharjs/echarts.common.min.js"></script>
    <script>
        $(function () {
            //获取公司
            $.ajax({
                type:'GET',
                url:'${pageContext.request.contextPath}/duibiao/getDistinctCompany',
                dataType:'json',
                success:function(resultData){
                    $(resultData).each(function(index,item){
                        var option="<option value="+item.dacname+">"+item.dacname+"</oiption>";
                        $("#com").append(option);
                        $("#com").change();//模拟自己点击
                    });
                },
            });
        })
        //根据公司名查询公司最近的营业额
        function getComByCname(cname) {
            $.get("duibiao/getComByCname?cname="+cname,function (data) {
                var times=[];
                var money=[];
                $(data).each(function (i,dc) {
                    times.push(dc.datime);
                    money.push(dc.daturnover);
                })

                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('box'));
                var option = {
                    title: {
                        text: cname
                    },
                    tooltip: {},
                    legend: {
                        data:['营业额']
                    },
                    xAxis: {
                        data: times
                    },
                    yAxis: {},
                    series: [{
                        name: '营业额',
                        type: 'bar',
                        data: money
                    }]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);

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
                        当前位置:对标管理>>对标分析
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<div>
    选择目标企业：<select id="com" onchange="getComByCname(this.value)"></select>
</div>
<div id="box" style="width:800px;height:400px;"></div>


</body>
</html>