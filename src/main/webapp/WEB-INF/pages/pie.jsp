<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/10 0010
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>饼状图</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/eCharts/echarts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <!-- 饼状图容器 -->
    <div id="pid-div" style="width:600px; height:400px;"></div>
    <
    <script type="text/javascript">
        $(function() {
            //var echarts = echarts.init($('#pid-div')[0]);
            var myChart = echarts.init($('#pid-div')[0]);
            var option = {
                title : {
                    text: '手机销量',
                    subtext: '纯属虚构',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    /*data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']*/
                    data: []
                },
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius : '55%', // 饼状图的大小
                        center: ['50%', '60%'], // 饼状图的位置
                        data:[
                            /*{value:335, name:'直接访问'},
                            {value:310, name:'邮件营销'},
                            {value:234, name:'联盟广告'},
                            {value:135, name:'视频广告'},
                            {value:1548, name:'搜索引擎'}*/
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            myChart.setOption(option);
            myChart.showLoading(); // 显示动画

            $.ajax({
                url: '${pageContext.request.contextPath}/index/queryForList',
                type: 'post',
                dataType: 'json',
                success: function(data) {
                    var names = [];
                    var nums = [];
                    $.each(data, function(index, obj) {
                        names.push(obj.goodsName);
                        nums.push({name:obj.goodsName, value:obj.goodsTotal});
                    })

                    myChart.hideLoading(); // 隐藏加载动画
                    myChart.setOption({
                        legend: {
                            data: names
                        },
                        series: [{
                            name: '销量',
                            type: 'pie', // 设置图表类型为柱状图
                            data:  nums // 设置纵坐标的刻度
                        }]
                    });
                }
            });
        });
    </script>
</body>
</html>
