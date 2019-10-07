<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>欢迎界面</title>
	<link href="<%=path%>/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="<%=path%>/static/css/main.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/login.js"></script>
        <style>
        body {
            background: url('../images/bk.jpg');
        }
    </style>
</head>
<body>
<script type="text/javascript" src="https://cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
<div class="container">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title"></h3>
		</div>
		<div class="panel-body" >
			<h2 align="center" style="padding-top:10px">欢迎访问人力资源管理系统</h2>
			<p align="center"><img src="<%=request.getContextPath() %>/images/welcome.png"></p>
		</div>
	</div>
</div>
</body>
</html>