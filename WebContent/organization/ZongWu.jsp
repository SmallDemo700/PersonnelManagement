<%@page import="java.io.Console"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=gbk" import="organization.*,java.util.*"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	
	ArrayList<DeptInfo> reclist=(ArrayList<DeptInfo>)session.getAttribute("DeptList");
	session.removeAttribute("DeptList");
	if(reclist==null){//测试数据还未构建
		reclist=new ArrayList<DeptInfo>();
	}
%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/student.css">

<title>Course_list</title>
</head>
<body>
<div class="container-fluid" >
	<div class="row">
		<div class="col-md-3">
			<iframe src="<%=path%>/organization/ZWTree.jsp" name="myframe" width="100%" height="500" frameborder="0" scrolling="yes" style="padding-top: 16px"></iframe>
		</div>
		<div class="col-md-9" style="margin-top: 15px">
		<table class="table table-bordered" width="100%" height="100" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td  class="tb_showall" height="25" colspan="12" align="center">部门信息列表</td>
			</tr>
			<tr class="td_header">
				<td>部门ID</td>
				<td>部门编号</td>
				<td>上级部门</td>
				<td>部门名称</td>
				<td>部门类型</td>
				<td>部门地址</td>
				<td>邮政编码</td>
				<td>电话号码</td>
				<td>传真号码</td>
				<td>电子邮件</td>
				<td colspan="2" align="center">操作</td>	
			</tr>
		
	<% int count=reclist.size();
	request.setCharacterEncoding("utf-8");
	ArrayList<ArrayList<String>> zwArr = new ArrayList<ArrayList<String>>();//二维列表用于存储
	ArrayList<String> zwArr1 = new ArrayList<String>();
		for(int i=0;i<count;i++){
	   		DeptInfo deptInfo = reclist.get(i);
	   		if(deptInfo.getParentid().equals("总务部") && deptInfo.getDepttype() == 2){//用于存储二级部门
	   			zwArr1.add(deptInfo.getDeptname());
	   		}
		}
		for(int i=0;i<zwArr1.size();i++){//将二级部门分别存储在二维列表的首位
			ArrayList<String> arr = new ArrayList<String>();
			arr.add(zwArr1.get(i));
			zwArr.add(arr);
		}
	   for(int i=0;i<count;i++){
	   		DeptInfo deptInfo = reclist.get(i);//再次获取数据库中的每一行
	   		 for(int j=0;j<zwArr.size();j++)
	   			if(deptInfo.getParentid().equals(zwArr.get(j).get(0)) && deptInfo.getDepttype() == 3){//用于存储三级部门
	   				/* ArrayList<String> temp=zwArr.get(j);
	   				temp.add(deptInfo.getDeptname()); */
	   				zwArr.get(j).add(deptInfo.getDeptname());
	   			} 
	   		char s = deptInfo.getDeptcode().charAt(0);//根据编号首位输出部门
	   		  if(s == '1'){ 
	%>
	
			<tr class="td_<%=i%2+1%>">
				<td><%=deptInfo.getDeptid() %></td>
				<td><%=deptInfo.getDeptcode() %></td>
				<td><%=deptInfo.getParentid() %> </td>
				<td><%=deptInfo.getDeptname() %></td>
				<td><%=deptInfo.getDepttype() %></td>
				<td><%=deptInfo.getLocation() %> </td>
				<td><%=deptInfo.getPostcode() %></td>
				<td><%=deptInfo.getTelephone() %></td>
				<td><%=deptInfo.getFax() %></td>
				<td><%=deptInfo.getMail()%></td>
				<td>
					<a href="<%=path %>/ZWGetCodeAction?deptcode=<%=deptInfo.getDeptcode()%>">编辑</a>
				</td>
				<td>
					<a href="<%=path %>/ZongWuDelAction?deptcode=<%=deptInfo.getDeptcode()%>" onclick="return del()">删除</a>
				</td>

			</tr>
	<%
	   		  }
		}
/* 	   for(int i=0;i<zwArr.size();i++){
		   for(int j=0;j<zwArr.get(i).size();j++){
		   out.println(zwArr.get(i).get(j));
		   }
	   } */
	   session.setAttribute("zwArr", zwArr);
 	%>
 		
		</table>
		  <div><a href="<%=path %>/organization/ZongWu_insert.jsp">添加部门信息</a></div>
		  <div align="center"><a href="<%=path %>/ZongWuListAction"><h2>刷新数据列表<h2></a></div>
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