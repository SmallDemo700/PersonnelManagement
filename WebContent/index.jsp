<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>人力资源管理系统</title>
<link rel="shortcut icon"  href="images/block.ico" type="image/x-icon" />
<link rel="stylesheet" href="js/morris-chart/morris.css">
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">
<style type="text/css">
#three:hover{
	background-color:#65cea7;
}
.left-side-inner{
	padding-top:15px
}
</style>
</head>
<body class="sticky-header">

<nav class="navbar navbar-inverse navbar-fixed-top"  style="background-color: #353f4f;" role="navigation">
    <div class="container-fluid">
		<a class="navbar-brand" style="background-color: #353f4f; color:#00ff99;padding-top: 25px" href="HomePage.jsp">人力资源管理系统</a>
		<form class="navbar-form navbar-right" role="search">
			<a class="navbar-brand" id="mytime" style="color:#00ff99"></a>
		</form>
    </div>
</nav>
<!-- 左边导航栏-->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2 sidebar">
			<div class="left-side sticky-left-side" >
		        <div class="logo">
		            <a href="<%=path%>/index.jsp"><img src=" " ></a>
		        </div>
		        <div class="left-side-inner" > 
		            <ul class="nav nav-pills nav-stacked custom-nav" > 
		            	<li class="active"><span> </span></li>
		                <li class="active"><a href="<%=path%>/index.jsp"><i class="fa fa-home"></i> <span>首页</span></a></li>
		                <li class="menu-list"><a href="#"><i class="fa fa-laptop"></i> <span>组织机构管理</span></a>
		                    <ul class="sub-menu-list">
		                        <li><a href="<%=path %>/ZongWuListAction" target="myframe">总务部 </a></li>
		                        <li><a href="<%=path %>/RengZiListAction" target="myframe">人资部  </a></li>
		                        <li><a href="<%=path %>/CaiWuListAction" target="myframe">财务部 </a></li>
		                        <li><a href="<%=path %>/NetListAction" target="myframe">网络部  </a></li>
		                    </ul>
		                </li>
		                <li class="menu-list"><a href="#" target="myframe"><i class="fa fa-cogs"></i> <span>员工管理</span></a>
		                    <ul class="sub-menu-list">
		                        <li><a href="<%=path %>/TitleListAction"target="myframe" > 职称信息管理</a></li>
		                        <li><a href="<%=path %>/PostListAction" target="myframe"> 岗位信息管理</a></li>
		                        <li><a href="<%=path %>/EmpListAction" target="myframe"> 员工信息管理</a></li>
		                    </ul>
		                </li>
		                <li class="menu-list"><a href=""><i class="fa fa-pencil fa-fw"></i> <span>员工信息查询统计</span></a>
		                    <ul class="sub-menu-list">
		                        <li><a href="<%=path %>/statistics/statistics_search.jsp" target="myframe"> 综合查询</a></li>
		                        <li><a href="<%=path %>/statistics/AllTable.jsp" target="myframe"> 汇总统计</a></li>
		                    </ul>
		                </li>
		                <li><a href="<%=path%>/login/login.jsp"><i class="fa fa-sign-in"></i> <span>Login</span></a></li>
		            </ul>
		        </div>
		    </div>
		</div>
		<!-- 界面显示区 -->
		<div class="main-content" >
			<iframe src="<%=path%>/welcome.jsp" name="myframe" width="100%" height="800" frameborder="0" scrolling="yes" style="padding-top: 16px"></iframe>
		</div>	
	</div>
</div>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- <script type="text/javascript">//动态显示时间
function showTime(){
	    nowtime=new Date();
	    year=nowtime.getFullYear();
	    month=nowtime.getMonth()+1;
	    date=nowtime.getDate();
	    document.getElementById("mytime").innerText=year+"年"+month+"月"+date+"日"+" "+nowtime.toLocaleTimeString();
	}
	setInterval("showTime()",1000);
</script> -->
</body>
</html>