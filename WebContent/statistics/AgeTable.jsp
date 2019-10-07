<%@page import="employee.EmployeeInfo"%>
<%@ page language="java" contentType="text/html; charset=gbk" import="employee.*,java.util.*"
    pageEncoding="GB18030"%>
    <%
    EmpDB empDB = new  EmpDB();
	String path = request.getContextPath();
	ArrayList<EmployeeInfo> reclist = empDB.getEmpList();
	if(reclist==null){//测试数据还未构建
		reclist=new ArrayList<EmployeeInfo>();
	}
    %>
    <%
    int a=0,b=0,c=0,d=0,sum=0;
    ArrayList<Integer> alist = new ArrayList<Integer>();
	for(int j=0;j<reclist.size();j++){
		EmployeeInfo sInfo = reclist.get(j);
		String[] birth = sInfo.getBirthday().split("-");
		int year = Integer.parseInt(birth[0]);
		int age = 2019 - year;
		if(age>=0 && age<20){
			a++;
		}else if(age>=20 && age<40){
			b++;
		}else if(age>=40 && age<60){
			c++;
		}else if(age>60){
			d++;
		}
	}
	sum=a+b+c+d;
	alist.add(a);
	alist.add(b);
	alist.add(c);
	alist.add(d);
	alist.add(sum);
    %>
<!DOCTYPE html>
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
            <tr><td colspan="7" align="center">年龄</td> </tr>
            <tr><td>序号</td> <td>年龄</td><td>人数</td><td>百分比</td><td align="center">饼状图</td></tr>
            <tr><td width="15%">1</td><td width="15%">20岁以下</td><td width="15%"><%=alist.get(0) %></td><td width="15%"><%=String.format("%.2f",(((double)alist.get(0))/alist.get(4)*100 )) %>%</td><td colspan="3" rowspan="7"><div id="main" style="width: 600px;height:400px;"></div></td></tr>
            <tr><td>2</td><td>20~40岁</td><td><%=alist.get(1) %></td><td><%=String.format("%.2f",(((double)alist.get(1))/alist.get(4)*100 ))%>%</td></tr>
            <tr><td>3</td><td>40~60岁</td><td><%=alist.get(2) %></td><td><%=String.format("%.2f",(((double)alist.get(2))/alist.get(4)*100 )) %>%</td></tr>
            <tr><td>4</td><td>60岁以上</td><td><%=alist.get(3) %></td><td><%=String.format("%.2f",(((double)alist.get(3))/alist.get(4)*100 )) %>%</td></tr>
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
            data:['20岁以下','20~40岁','40~60岁','60岁以上']
        },
        series: [
            {
                name:'',
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
                    {value:<%=alist.get(0) %>, name:'20岁以下'},
                    {value:<%=alist.get(1) %>, name:'20~40岁'},
                    {value:<%=alist.get(2) %>, name:'40~60岁'},
                    {value:<%=alist.get(3) %>, name:'60岁以上'},
                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>