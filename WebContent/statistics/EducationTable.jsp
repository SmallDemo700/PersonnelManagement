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
	int a=0,b=0,c=0,d=0,e=0,sum=0;
	ArrayList<Integer> edu = new ArrayList<Integer>();
 
	for(int j=0;j<reclist.size();j++){
		 EmployeeInfo sInfo = reclist.get(j);  
		 if(sInfo.getEdulevel()==3){ //高中
			 a++;
		 }else if(sInfo.getEdulevel()==4){ //专科
			 b++;
		 }else if(sInfo.getEdulevel()==5){ //本科
			 c++;
		 }else if(sInfo.getEdulevel()==6){ //硕士
			 d++;
		 }else if(sInfo.getEdulevel()==7){  //博士
			 e++;
		 }
	 }
		sum = a+b+c+d+e;
		 edu.add(a);
		 edu.add(b);
		 edu.add(c);
		 edu.add(d);
		 edu.add(e);
		 edu.add(sum);
 
	%>
<html>
<head>
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script src="<%=path %>/js/a.js"></script>
</head>
<body>
<table>

   <tr> <table class="table table-bordered">
            <tr><td colspan="7" align="center">学历</td> </tr>
            <tr><td>序号</td> <td>年龄</td><td>人数</td><td>百分比</td><td align="center">饼状图</td></tr>
            <tr><td width="15%">1</td><td width="15%">高中</td><td width="15%"><%=edu.get(0) %></td><td width="15%"><%=String.format("%.2f",(((double)edu.get(0))/edu.get(5)*100 )) %>%</td><td colspan="3" rowspan="5"><div id="main" style="width: 600px;height:400px;"></div></td></tr>
            <tr><td>2</td><td>专科</td><td><%=edu.get(1) %></td><td><%=String.format("%.2f",(((double)edu.get(1))/edu.get(5)*100 ))%>%</td></tr>
            <tr><td>3</td><td>本科</td><td><%=edu.get(2) %></td><td><%=String.format("%.2f",(((double)edu.get(2))/edu.get(5)*100 )) %>%</td></tr>
            <tr><td>4</td><td>硕士</td><td><%=edu.get(3) %></td><td><%=String.format("%.2f",(((double)edu.get(3))/edu.get(5)*100 )) %>%</td></tr>
            <tr><td>5</td><td>博士</td><td><%=edu.get(4) %></td><td><%=String.format("%.2f",(((double)edu.get(4))/edu.get(5)*100 )) %>%</td></tr>
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
            data:['高中','专科','本科','硕士','博士']
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
                    {value:<%=edu.get(0) %>, name:'高中'},
                    {value:<%=edu.get(1) %>, name:'专科'},
                    {value:<%=edu.get(2) %>, name:'本科'},
                    {value:<%=edu.get(3) %>, name:'硕士'},
                    {value:<%=edu.get(4) %>, name:'博士'},
                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>