<%@page import="employee.EmployeeInfo"%>
<%@ page language="java" contentType="text/html; charset=GB2312" import="employee.*"
    pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
 EmployeeInfo emp=(EmployeeInfo)session.getAttribute("empinfo");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>录入新岗位</title>
 <!-- Bootstrap -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
</head>
<body>
		<form name="frm" method="post" >
			<table  class="table table-bordered" align="center">
				<tr align="center"><td colspan="4">员工详细信息</td>						</tr>
				<tr><td align="center"><span>员工ID</span></td> <td align="center"><%=emp.getEmpid() %></td>          </tr>
				<tr><td align="center"><span>部门</span></td> <td align="center"><%=emp.getDeptname() %></td>    </tr>
				<tr><td align="center"><span>职称</span></td> <td align="center"><%=emp.getTitlename() %></td>  	  </tr>
				<tr><td align="center"><span>岗位</span></td> <td align="center"><%=emp.getPostname() %></td>  		</tr>
				<tr><td align="center"><span>姓名</span></td> <td align="center"><%=emp.getEmpname() %></td>   		</tr>
				<tr><td align="center"><span>工号</span></td> <td align="center"><%=emp.getEmpcode() %></td>  		</tr>
				<tr><td align="center"><span>性别</span></td><td align="center"><% 
						if(emp.getSex()==1)  
							{out.println("男"); }
				     	else if(emp.getSex()==2)
				      		{out.println("女");}
				%></td>  </tr>
				<tr><td align="center"><span>身份证号</span></td> <td align="center"><%=emp.getIdcard() %></td>  		</tr>
			    <tr><td align="center">出生日期</td> <td align="center"><%=emp.getBirthday() %></td>     </tr>
				<tr><td align="center"><span>籍贯</span></td> <td align="center"><%=emp.getNativeplace() %></td>  		</tr>
				<tr><td align="center">学历</td><td align="center"><% 
				if(emp.getEdulevel()==3)  
					{out.print("高中"); }
		     	 else if(emp.getEdulevel()==4)
		      		{out.print("专科");}
		      	else if(emp.getEdulevel()==5)
					{out.print("本科");}
		     	 else if(emp.getEdulevel()==6)
					{out.print("硕士");}
		      	else if(emp.getEdulevel()==7)
					{out.print("博士");}
			 %></td></tr>
				<tr><tr><td align="center">民族</td><td align="center"><%=emp.getNantion() %></td></tr>
		 		<tr><td align="center">政治面貌</td><td align="center"><% 
				if(emp.getParty()==1)  
					{out.print("中共党员"); }
		     	 else if(emp.getParty()==2)
		      		{out.print("中共预备党员");}
		      	else if(emp.getParty()==3)
					{out.print("共青团员");}
		      	 else if(emp.getParty()==4)
					{out.print("民主党派");}
		     	 else if(emp.getParty()==5)
					{out.print("群众");}
			 %></td></tr>
			    <tr><td align="center">健康状况</td><td align="center"><%
				if(emp.getHealth()==8)  
					{out.print("良好"); }
		      	else if(emp.getHealth()==9)
		     		 {out.print("健康");}
		      	else if(emp.getHealth()==10)
					{out.print("一般");}
		      	else if(emp.getHealth()==11)
					{out.print("有慢性病");}
			  %></td></tr>
			    <tr><td align="center">户口类型</td><td align="center">
			    <% if(emp.getRegtype()==1)  
					{out.print("农村户口"); }
		     	 else if(emp.getRegtype()==2)
		      		{out.print("城市居民");}
			  %></td></tr>
			    <tr><td align="center">任职状态</td><td align="center">
			    <% if(emp.getStatus()==1)  
				{out.print("试用"); }
		      else if(emp.getStatus()==2)
		      {out.print("转正");}
		      else if(emp.getStatus()==3)
				{out.print("挂靠");}
		      else if(emp.getStatus()==4)
				{out.print("自动离职");}
		      else if(emp.getStatus()==5)
				{out.print("辞退");}
			  %></td></tr>
			    <tr><td colspan="4" align="center"><input type="button"   onclick="javascript:history.back(-1);" value="返回上一页"></td></tr>
		</table>
		</form>
		<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>