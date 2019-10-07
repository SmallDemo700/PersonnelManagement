<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<style type="text/css">
	.btn btn-info{
		padding-top: 30px;
		
	}
</style>
</head>
<body>
<div class="container-fluid" >
	<div class="row">
		<div class="col-md-2" style="padding-top: 20px">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="<%=path %>/statistics/EducationTable.jsp" target="myframe1"><button class="btn btn-info" style="margin-top: 30px;" >学历统计</button></a></li>
			<li><a href="<%=path %>/statistics/AgeTable.jsp" target="myframe1"><button class="btn btn-info" style="margin-top: 30px;">年龄统计</button></a></li>
			<li><a href="<%=path %>/statistics/TitleTable.jsp" target="myframe1"><button class="btn btn-info" style="margin-top: 30px;">职称统计</button></a></li>
		</ul>	
		</div>
		<div class="col-md-10" style="margin-top: 15px">
			<iframe src="<%=path%>/statistics/EducationTable.jsp" name="myframe1" width="100%" height="800" frameborder="0" scrolling="yes" style="padding-top: 16px"></iframe>
		</div>
	</div>
</div>
</body>
</html>