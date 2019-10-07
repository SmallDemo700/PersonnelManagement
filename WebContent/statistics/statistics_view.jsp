<%@ page language="java" contentType="text/html; charset=gbk" import="employee.*,java.util.*"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	EmpDB empDB = new  EmpDB();
	String path = request.getContextPath();
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("info");
 	/* System.out.println(list.size());  */
	ArrayList<EmployeeInfo> reclist = empDB.getEmpList();
	if(reclist==null){//测试数据还未构建
		reclist=new ArrayList<EmployeeInfo>();
	}
	ArrayList<ArrayList<String>> list1 = new ArrayList<ArrayList<String>>();
	for(int j=0;j<reclist.size();j++){
		 EmployeeInfo sInfo = reclist.get(j); 
		 ArrayList<String> list2 = new ArrayList<String>();
		 list2.add(sInfo.getEmpname());
		 list2.add(sInfo.getEmpcode());
		 list2.add(String.valueOf(sInfo.getSex()));
		 list2.add(sInfo.getDeptname());
		 list2.add(sInfo.getTitlename());
		 list2.add(sInfo.getPostname());
		 list2.add(sInfo.getBirthday());
		 list2.add(String.valueOf(sInfo.getEdulevel()));
		 list2.add(String.valueOf(sInfo.getHealth()));
		 list2.add(String.valueOf(sInfo.getEmpid()));

		 if(list2.containsAll(list)){
			list1.add(list2); 
		 } 
		
	}
%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/student.css">

<title> </title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		<table class="table table-bordered" width="100%" height="100" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td  class="tb_showall" height="25" colspan="12" align="center">组织机构信息列表</td>
			</tr>
			<tr class="td_header" align="center" style="font-weight:bold;">
				<td>姓名</td>
				<td>工号</td>
				<td>性别</td>
				<td>部门</td>
				<td>职称</td>
				<td>岗位</td>
				<td>出生日期</td>
				<td>最高学历</td>
				<td>健康状况</td>
				<td colspan="2" align="center">操作</td>
	 		
			</tr>
		
	<% 
	request.setCharacterEncoding("utf-8");
	for(int i=0;i<list1.size();i++){
/* 	System.out.println(list1.get(i).get(2)+"                        123454"); */
	%>
			<tr class="td_<%=i%2+1%>" align="center">
				<td><%=list1.get(i).get(0) %></td>
				<td><%=list1.get(i).get(1)%></td>
				<td><% 
				if(list1.get(i).get(2).equals("1"))  
					{out.println("男"); }
		     	else if(list1.get(i).get(2).equals("2"))
		      		{out.println("女");}
			  	%></td>
				<td><%=list1.get(i).get(3)%></td>
				<td><%=list1.get(i).get(4) %></td>
				<td><%=list1.get(i).get(5)%> </td>
				<td><%=list1.get(i).get(6)%></td>
			<td><% 
				if(list1.get(i).get(7).equals("3"))  
					{out.print("高中"); }
		     	 else if(list1.get(i).get(7).equals("4"))
		      		{out.print("专科");}
		      	else if(list1.get(i).get(7).equals("5"))
					{out.print("本科");}
		     	 else if(list1.get(i).get(7).equals("6"))
					{out.print("硕士");}
		      	else if(list1.get(i).get(7).equals("7"))
					{out.print("博士");}
			 %></td>
			<td><%
				if(list1.get(i).get(8).equals("8"))  
					{out.print("良好"); }
		      	else if(list1.get(i).get(8).equals("9"))
		     		 {out.print("健康");}
		      	else if(list1.get(i).get(8).equals("10"))
					{out.print("一般");}
		      	else if(list1.get(i).get(8).equals("11"))
					{out.print("有慢性病");}
			  %></td>
			   <td><a href="<%=path %>/DetailAction?empidA=<%=list1.get(i).get(9)%>">查看</a></td>
			</tr>
	<%
}
 %>		

			</table>
		  </div>
	</div>
</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</html>