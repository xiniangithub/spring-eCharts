<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/10 0010
  Time: 09:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>柱状图</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/eCharts/echarts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <!-- 柱状图容器 -->
    <div id="main" style="width:600px; height:400px;"></div>
    <script type="text/javascript">
        $(function() {
            // 初始化
            //var myChart = echarts.init(document.getElementById('main'));
            var myChart = echarts.init($('#main')[0]);
            // 配置图标参数
            var options = {
                title: {
                    text: '手机销量',
                    show: true, // 是否显示标题
                    subtext: '测试数据',
                    textStyle: {
                        fontSize: 18 // 标题文字大小
                    }
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                legend: {
                    data: ['销量']
                },
                // X轴
                xAxis: {
                    data: [] // 异步请求时,这里要置空
                },
                // Y轴
                yAxis: {},
                series: [{
                    name: '销量',
                    type: 'bar', // 设置图表类型为柱状图
                    data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)
                }]
            };
            // 给图标设置配置的参数
            myChart.setOption(options);
            myChart.showLoading(); // 显示加载动画
            $.ajax({
                url: '${pageContext.request.contextPath}/index/queryForList',
                type: 'post',
                dataType: 'json',
                success: function(data) {
                    var names = [];
                    var nums = [];
                    $.each(data, function(index, obj) {
                        names.push(obj.goodsName);
                        nums.push(obj.goodsTotal);
                    })

                    myChart.hideLoading(); // 隐藏加载动画
                    myChart.setOption({
                        legend: {
                            data: ['销量']
                        },
                        xAxis: {
                            data: names
                        },
                        series: [{
                            name: '销量',
                            type: 'bar', // 设置图表类型为柱状图
                            data: nums // 设置纵坐标的刻度
                        }]
                    });
                }
            });
        });
    </script>
</body>
</html>
