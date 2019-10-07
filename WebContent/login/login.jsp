<%@ page contentType="text/html;charset=GB18030" language="java" %>
<% String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="GB18030">
    <title>login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="<%=path%>/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/test.css">
    <script type="text/javascript" src="<%=path%>/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/login.js"></script>
</head>
<body style="background-color:	ffff66">
<script type="text/javascript" src="https://cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
<div class="main" >
  <div class="login-form" style="background-color: 	#FFFFE0">
    <h1>登录界面</h1>
    <div class="head" > <img src="../images/user.png" alt=""/> </div>
    <form  style="background-color: 	#FFFFE0"id="loginForm" action="<%=path %>/LoginAction" method="post">
      <input type="text" class="text" name="userName" placeholder="用户名">
      <input type="password" name="password" placeholder="密码">
      <div class="submit" style="color:	ffff66">
        <input type="submit" value="LOGIN" id="submit" onclick="return judge();" style="width: 320px;"></input>
      </div>
    </form>   
  </div>
</div>
</body>
<script>
    /**
     * 该函数的功能为向服务器提交请求，利用返回的值判断账号和密码的正确性
     */
    	<%
    	String userName =(String) request.getSession().getAttribute("username");
        request.getSession().removeAttribute("username");
    	String loginFlag = request.getParameter("loginflag");
    	if(loginFlag==null){
    		loginFlag="";
    	}
    		if(loginFlag.equals("1")){
    	%>
    	$(function () {
    		alert("用户<%=userName%>不存在！");
    		changeState("login-title","login-msg");
    	});
    	<%
    		}else if(loginFlag.equals("2")){
    	%>
    	$(function () {
    			alert("密码错误!");
                changeState("login-title","login-msg");
    	});
    	<%
    	}
    	%>
</script>
</html>
