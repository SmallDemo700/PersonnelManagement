<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312" import="statistics.*,java.util.*"
 %>
<%
	String path = request.getContextPath(); 
	request.setCharacterEncoding("gb2312");
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="gb2312">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
</head>
<body>
<div style="margin: 5px auto;">
    <form name="frm" action="<%=path%>/SearchAction" method="post">
        <table class="table table-bordered table-striped">
            <tr align="center"><td colspan="4">员工信息查询</td></tr>
            <tr><td>姓名：</td><td><input class="form-control" style="width:200px" name="name"></td> <td>员工号：</td><td><input  class="form-control" style="width:200px" name="number"></td></tr>
            <tr><td>性别：</td><td><select class="form-control" style="width:80px" name="sex"><option value="1">男</option><option value="2">女</option></select></td><td>部门：</td><td><input class="form-control" style="width:200px" name="department"></td></tr>
            <tr><td>职称：</td><td><input class="form-control" style="width:200px" name="title"></td><td>岗位：</td><td><input class="form-control" style="width:200px" name="post"></td></tr>
            <tr><td>出生日期：</td>
                <td>
                    <input  class="form-control" style="width:200px" type="date" name="date" />
                </td> <td>最高学历：</td>
                <td><select class="form-control" style="width:100px" name="education">
                    <option value="7">博士</option>
                    <option value="6">硕士</option>
                    <option value="5">本科</option>
                    <option value="4">专科</option>
                    <option value="3">高中</option>
                </select></td></tr>
            <tr><td>健康状况：</td>
                <td colspan="3"><select class="form-control" style="width:100px" name="health">
                	<option value="9">健康</option>
                    <option value="8">良好</option>
                    <option value="10">一般</option>
                    <option value="11">有慢性疾病</option>
                </select></td> </tr>
            <tr align="center"><td colspan="4"><input class="btn btn-default" type="submit" value="查询"> <input class="btn btn-default" type="reset" value="取消"></td></tr>
        </table>

    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>