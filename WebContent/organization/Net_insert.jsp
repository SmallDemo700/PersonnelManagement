<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<% String path = request.getContextPath(); %>
<body>
<form name="frm" method="post" action="<%=path %>/NetInsertAction">
	<table  class="table table-bordered">
				<tr align="center" class="success"><td colspan="4">添加子部门</td></tr>
				<tr class="">   <td><span>部门编号</span></td> <td><input name="deptcode"><span><span style="color:red">* 要求:</span> 总务部以1,人资部以2,财务部以3,网络部以4开头</span> </td>   </tr>
				<tr class="info">   <td><span>上级部门名称</span></td> <td><input name="parentid"></td> <td><span>部门名称</span></td> <td><input name="deptname"></td>     </tr>
				<tr class=" ">   <td><span>部门类型</span></td> <td><input name="depttype"></td><td ><span>部门地址</span></td> <td><input name="location"></td> <td></td><td></td> 																</tr>
				<tr class="info">   <td><span>邮政编码</span></td> <td><input name="postcode"></td> <td><span>电话号码</span></td> <td><input name="telephone"></td> </tr>
				<tr class=" ">   <td><span>传真号码</span></td> <td><input name="fax"></td>  <td><span>电子邮件</span></td> <td><input name="mail"></td></tr>
				<tr class="danger">   <td colspan="4" align="center"><input type="submit" value="确定"> <input type="reset" value="取消" ><input type="button"   onclick="javascript:history.back(-1);" value="返回上一页"></td></tr>
			</table>
</form>
</body>
</html>