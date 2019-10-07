<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030" import="staff.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
 TitleInfo title=(TitleInfo)session.getAttribute("titleinfo");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>修改职称信息</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
</head>
<body>


<form name="frm" method="post" action="<%=request.getContextPath() %>/TitleModifyAction">
			<table  class="table table-bordered" >
				<tr align="center" style="height:50px" ><td colspan="4">录入职称信息</td>						</tr>
		  		<tr  style="height:50px">   <td style="width: 300px" align="center"><span>职称ID:</span></td> <td><input name="titleid" readonly="readonly" value="<%=title.getTitleid()%>" style="width: 600px ; height:40px;"></td>    </tr>
				<tr style="height:50px">   <td align="center"><span>职称名称:</span></td> <td><input name="titlename"  value="<%=title.getTitlename()%>"style="width: 600px ; height:40px;"></td>    </tr>
				<tr  style="height:50px">   <td align="center"><span>任职资格:</span></td> <td><input name="qualification" value="<%=title.getQualification() %>"style="width: 600px ; height:40px;"></td>  	  </tr>
				<tr  style="height:50px">   <td align="center"><span>职责:</span></td> <td><input name="duty"value="<%=title.getDuty()%>"style="width: 600px ; height:40px;"></td>  		</tr>
				<tr  style="height:50px">   <td align="center"><span>工作目标:</span></td> <td><input name="worktarget"value="<%=title.getWorktarget()%>"style="width: 600px ; height:40px;"></td>   			</tr>
				<tr  style="height:50px">   <td colspan="4" align="center"><input type="submit" value="确定" style="height:30px;"> <input type="reset" value="取消" style="height:30px;"><input type="button" style="height:30px;"  onclick="javascript:history.back(-1);" value="返回上一页"></td></tr>
			</table>
		
		
		</form>
		<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>