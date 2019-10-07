<%@page import="employee.EmployeeInfo"%>
<%@ page language="java" contentType="text/html; charset=gbk" import="post.*,java.util.*"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	ArrayList<EmployeeInfo> reclist=(ArrayList<EmployeeInfo>)session.getAttribute("empList");
	session.removeAttribute("empList");
	if(reclist==null){//测试数据还未构建
		reclist=new ArrayList<EmployeeInfo>();
	}
%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/student.css">
<title>Title_list</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		<table class="table table-bordered" width="100%" height="100" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td  class="tb_showall" height="25" colspan="18" align="center">雇员信息列表</td>
			</tr>
			<tr class="td_header">
				<td>员工信息ID</td>
				<td>部门</td>
				<td>职称</td>
				<td>岗位</td>
				<td>员工姓名</td>
				<td>员工工号</td>
				<td>员工性别</td>
				<td>身份证号</td>
				<td>出生年月</td>
				<td>籍贯</td>
				<td>学历</td>
				<td>民族</td>
				<td>政治面貌</td>
				<td>健康状况</td>
				<td>户口类型</td>
				<td>工作状态</td>
				<td colspan="2" align="center">操作</td>		
		</tr>	
			
			<% int count=reclist.size();
	request.setCharacterEncoding("utf-8");
	   for(int i=0;i<count;i++){
		  EmployeeInfo empInfo =reclist.get(i);
	%>
			<tr class="td_<%=i%2+1%>">
				
				<td><%=empInfo.getEmpid() %></td>
				<td><%=empInfo.getDeptname() %></td>
				<td><%=empInfo.getTitlename() %></td>
				<td><%=empInfo.getPostname() %></td>
				<td><%=empInfo.getEmpname() %></td>
				<td><%=empInfo.getEmpcode() %></td>
				<% if(empInfo.getSex()==1)  
				{out.print("<td>男</td>"); }
		      else if(empInfo.getSex()==2)
		      {out.print("<td>女</td>");}
			  %>
				<td><%=empInfo.getIdcard() %></td>
				<td><%=empInfo.getBirthday() %></td>
				<td><%=empInfo.getNativeplace() %></td>
	 	
				<% if(empInfo.getEdulevel()==3)  
				{out.print("<td>高中</td>"); }
		      else if(empInfo.getEdulevel()==4)
		      {out.print("<td>专科</td>");}
		      else if(empInfo.getEdulevel()==5)
				{out.print("<td>本科</td>");}
		      else if(empInfo.getEdulevel()==6)
				{out.print("<td>硕士</td>");}
		      else if(empInfo.getEdulevel()==7)
				{out.print("<td>博士</td>");}
			  %>
				
				
				<td><%=empInfo.getNantion() %></td>
				<% if(empInfo.getParty()==1)  
						{out.print("<td>中共党员</td>"); }
				      else if(empInfo.getParty()==2)
				      {out.print("<td>中共预备党员</td>");}
				      else if(empInfo.getParty()==3)
						{out.print("<td>共青团员</td>");}
				      else if(empInfo.getParty()==4)
						{out.print("<td>民主党派</td>");}
				      else if(empInfo.getParty()==5)
				      {out.print("<td>群众</td>");}
				%>
				<% if(empInfo.getHealth()==8)  
				{out.print("<td>良好</td>"); }
		      else if(empInfo.getHealth()==9)
		      {out.print("<td>健康</td>");}
		      else if(empInfo.getHealth()==10)
				{out.print("<td>一般</td>");}
		      else if(empInfo.getHealth()==11)
				{out.print("<td>有慢性病</td>");}
			  %>
			  	<% if(empInfo.getRegtype()==1)  
				{out.print("<td>农村户口</td>"); }
		      else if(empInfo.getRegtype()==2)
		      {out.print("<td>城市居民</td>");}
			  %>
			  			<% if(empInfo.getStatus()==1)  
				{out.print("<td>试用</td>"); }
		      else if(empInfo.getStatus()==2)
		      {out.print("<td>转正</td>");}
		      else if(empInfo.getStatus()==3)
				{out.print("<td>挂靠</td>");}
		      else if(empInfo.getStatus()==4)
				{out.print("<td>自动离职</td>");}
		      else if(empInfo.getStatus()==5)
				{out.print("<td>辞退</td>");}
			  %>

					<td>
					<a href="<%=path %>/GetEmpidAction?empidA=<%=empInfo.getEmpid()  %>">编辑</a>
				</td>
				<td>
					<a href="<%=path %>/EmpDelAction?empid=<%=empInfo.getEmpid()  %>" onclick="return del()">删除</a>
				</td>

			</tr>
	<%
}
 %>		
		</table>
		  <div><a href="<%=path %>/GetDeptPostTitleAction">添加雇员信息</a></div>
		  <div align="center"><a href="<%=path %>/EmpListAction"><h2>刷新数据列表<h2></a></div>
		  </div>
		  </div>
</div>
<script>
    function del()
    {
        if(confirm("确定要删除吗？"))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
</script>
</body>

<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</html>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
				