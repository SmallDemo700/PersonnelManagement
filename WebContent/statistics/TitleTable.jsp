<%@page import="employee.EmployeeInfo"%>
<%@ page language="java" contentType="text/html; charset=gbk" import="employee.*,java.util.*"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<%
	EmpDB empDB = new  EmpDB();
	String path = request.getContextPath();
	ArrayList<EmployeeInfo> reclist = empDB.getEmpList();
	if(reclist==null){//测试数据还未构建
		reclist=new ArrayList<EmployeeInfo>();
	}
    %>
<%
	int a=0,b=0,c=0,sum=0;
	ArrayList<Integer>title = new ArrayList<Integer>();

	for(int j=0;j<reclist.size();j++){
		EmployeeInfo sInfo = reclist.get(j);  
		 if(sInfo.getTitlename().equals("初级工程师")){ //高中
			 a++;
		 }else if(sInfo.getTitlename().equals("中级工程师")){ //专科
			 b++;
		 }else if(sInfo.getTitlename().equals("高级工程师")){ //本科
			 c++;
		 } 
	 }
		sum = a+b+c;
		title.add(a);
		title.add(b);
		title.add(c);
 
		title.add(sum);
	%>
<html>
<head>
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <script src="<%=path %>/js/a.js"></script>
     
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
 
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
</head>
<body>
<table>

   <tr> <table class="table table-bordered">
            <tr align="center"><td colspan="7">职称</td> </tr>
               <tr><td>序号</td><td>职称名</td><td >人数</td><td>百分比</td><td align="center">饼状图</td></tr>
            <tr><td width="15%">1</td><td width="15%">初级工程师</td><td width="15%"><%=title.get(0) %></td><td width="15%"><%=String.format("%.2f",(((double)title.get(0))/title.get(3)*100 )) %>%</td><td colspan="3" rowspan="5">   <div id="main" style="width: 600px;height:400px;"></div></td></tr>
            <tr><td>2</td><td>中级工程师</td><td><%=title.get(1) %></td><td><%=String.format("%.2f",(((double)title.get(1))/title.get(3)*100 ))%>%</td></tr>
            <tr><td>3</td><td>高级工程师</td><td><%=title.get(2) %></td><td><%=String.format("%.2f",(((double)title.get(2))/title.get(3)*100 )) %>%</td></tr>
	      </table>

   </tr>
  
</table>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    option = {
        //提示框组件,鼠标移动上去显示的提示内容
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"//模板变量有 {a}、{b}、{c}、{d}，分别表示系列名，数据名，数据值，百分比。
        },
        //图例
        legend: {
            //图例垂直排列
            orient: 'vertical',
            x: 'left',
            //data中的名字要与series-data中的列名对应，方可点击操控
            data:['初级工程师','中级工程师','高级工程师']
        },
        series: [
            {
                name:' ',
                type:'pie',
                //饼状图
                // radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                //标签
                label: {
                    normal: {
                        show: true,
                        position: 'inside',
                        formatter: '{d}%',//模板变量有 {a}、{b}、{c}、{d}，分别表示系列名，数据名，数据值，百分比。{d}数据会根据value值计算百分比

                        textStyle : {
                            align : 'center',
                            baseline : 'middle',
                            fontFamily : '微软雅黑',
                            fontSize : 15,
                            fontWeight : 'bolder'
                        }
                    },
                },
                data:[
                    {value:<%=title.get(0) %>, name:'初级工程师'},
                    {value:<%=title.get(1) %>, name:'中级工程师'},
                    {value:<%=title.get(2) %>, name:'高级工程师'},
 
                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>