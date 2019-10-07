<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<form name="frm" method="post" action="<%=request.getContextPath() %>/PostInsertAction">
			<table  class="table table-bordered" >
				<tr align="center"  ><td colspan="4">录入职称信息</td>						</tr>
			
				<tr style="height:50px">   <td style="width: 300px" align="center"><span>岗位名称</span></td> <td><input name="postname" style="width: 600px; height:40px;"></td>    </tr>
				<tr style="height:50px">   <td align="center"><span>上级岗位</span></td> <td><input name="parentid" style="width: 600px; height:40px;"></td>  	  </tr>
				<tr style="height:50px">   <td align="center"><span>岗位职责</span></td> <td><input name="duty" style="width: 600px; height:40px;"></td>  		</tr>
				<tr style="height:50px">   <td align="center"><span>任职资格</span></td> <td><input name="qualification" style="width: 600px; height:40px;"></td>   			</tr>
				<tr style="height:50px">   <td align="center"><span>岗位权限</span></td> <td><input name="purview" style="width: 600px; height:40px;"></td>  		</tr>
				<tr style="height:50px">   <td align="center"><span>岗位工作内容</span></td> <td><input name="workcontent" style="width: 600px; height:40px;"></td>   			</tr>
				
				<tr class=" ">   <td colspan="4" align="center"><input type="submit" value="确定"style="height:30px;"> <input type="reset" value="取消"style="height:30px;" ><input type="button"    style="height:30px;"onclick="javascript:history.back(-1);" value="返回上一页"></td></tr>
			</table>
		
		
		</form>
		
		
		

		<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>