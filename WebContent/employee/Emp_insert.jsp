<%@ page language="java" contentType="text/html; charset=GB2312" import="post.*,organization.*,staff.*,java.util.*"
    pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	ArrayList<DeptInfo> reclist=(ArrayList<DeptInfo>)session.getAttribute("getdeptList");
	
	ArrayList<TitleInfo> reclistA=(ArrayList<TitleInfo>)session.getAttribute("gettitleList");
	
	ArrayList<PostInfo> reclistB=(ArrayList<PostInfo>)session.getAttribute("getpostList");
	
	
	session.removeAttribute("getdeptList");
	session.removeAttribute("gettitleList");
	session.removeAttribute("getpostList");
	if(reclist==null){//测试数据还未构建
		reclist=new ArrayList<DeptInfo>();
	}
	if(reclistA==null){//测试数据还未构建
		reclistA=new ArrayList<TitleInfo>();
	}
	if(reclistB==null){//测试数据还未构建
		reclistB=new ArrayList<PostInfo>();
	}
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
		<form name="frm" method="post" action="<%=request.getContextPath() %>/EmpInsertAction">
			<table  class="table table-bordered" >
				<tr align="center" class=" "><td colspan="4">添加雇员信息</td>						</tr>
				 
				<tr class=" ">   <td><span>部门</span></td>
				 <td><select  name="dept"  class="form-control" style="width:100px">
				 		<% 			 
				 		int count=reclist.size();
				 		request.setCharacterEncoding("utf-8");
				 		   for(int i=0;i<count;i++){
				 			 DeptInfo deptInfo =reclist.get(i);
				 		 	out.print("<option>"+deptInfo.getDeptname()+"</option>");
				 		   }
				 		%>	
				 </select></td>  
	     		  </tr>
				<tr class=" ">   <td ><span>职称</span></td> 
				 <td><select  name="title"  class="form-control" style="width:100px">
				 		<% 			 
				 		int countA=reclistA.size();
				 		request.setCharacterEncoding("utf-8");
				 		   for(int i=0;i<countA;i++){
				 			 TitleInfo titleInfo =reclistA.get(i);
				 		 	out.print("<option>"+titleInfo.getTitlename()+"</option>");
				 		   }
				 		%>	
				 </select></td>  
				
				
				
				
				 </tr>
				<tr class=" ">   <td><span>岗位</span></td> </td>  	
				 <td><select  name="post"  class="form-control" style="width:100px">
				 		<% 			 
				 		int countB=reclistB.size();
				 		request.setCharacterEncoding("utf-8");
				 		   for(int i=0;i<countB;i++){
				 			PostInfo postInfo =reclistB.get(i);
				 		 	out.print("<option>"+postInfo.getPostname()+"</option>");
				 		   }
				 		%>	
				 </select></td>  
	 
					</tr>
				
				<tr class=" ">   <td><span>姓名</span></td> <td><input name="empname"></td>   			</tr>
				<tr class=" ">   <td><span>工号</span></td> <td><input name="empcode"></td>  		</tr>
				<tr class=" ">   <td>性别：</td>   <td><select name="gender" class="form-control" style="width:100px" >
			        <option value="1">男</option>
			        <option value="2">女</option>
			      </select><font color="red">*</font></td></tr>
				<tr class=" ">  <td><span>身份证号</span></td> <td><input name="idcard"></td>  		</tr>
			   <tr class=" "> <td>出生日期：</td> <td><input type="date" name="birthday">	</td>     </tr>
				<tr class=" ">   <td><span>籍贯</span></td> <td><input name="nativeplace"></td>  		</tr>
				<tr class=" ">   <td>学历：</td>
			             <td><select name="edulevel"  class="form-control" style="width:100px" >
			                    <option value="3">高中</option>
			                    <option  value="4" >专科</option>
			                    <option  value="5">本科</option>
			                    <option  value="6">硕士</option>
			                    <option  value="7">博士</option>			              
			                 </select>
			             </td>	</tr>
					<tr class=" ">    <tr><td>民族：</td>
			            <td><select name="nantion" class="form-control" style="width:100px" >
			            <option value="汉族">汉族</option>
			            <option value="蒙古族">蒙古族</option>
			            <option value="回族">回族</option>
			            <option value="藏族">藏族</option>
			            <option value="维吾尔族">维吾尔族</option>
			            <option value="苗族">苗族</option>
			            <option value="彝族">彝族</option>
			            <option value="壮族">壮族</option>
			            <option value="布依族">布依族</option>
			            <option value="朝鲜族">朝鲜族</option>
			            <option value="满族">满族</option>
			            <option value="侗族">侗族</option>
			            <option value="瑶族">瑶族</option>
			            <option value="白族">白族</option>
			            <option value="土家族">土家族</option>
			            <option value="哈尼族">哈尼族</option>
			            <option value="哈萨克族">哈萨克族</option>
			            <option value="傣族">傣族</option>
			            <option value="黎族">黎族</option>
			            <option value="傈僳族">傈僳族</option>
			            <option value="佤族">佤族</option>
			            <option value="畲族">畲族</option>
			            <option value="高山族">高山族</option>
			            <option value="拉祜族">拉祜族</option>
			            <option value="水族">水族</option>
			            <option value="东乡族">东乡族</option>
			            <option value="纳西族">纳西族</option>
			            <option value="景颇族">景颇族</option>
			            <option value="柯尔克孜族">柯尔克孜族</option>
			            <option value="土族">土族</option>
			            <option value="达翰尔族">达翰尔族</option>
			            <option value="仫佬族">仫佬族</option>
			            <option value="羌族">羌族</option>
			            <option value="布朗族">布朗族</option>
			            <option value="撒拉族">撒拉族</option>
			            <option value="仡佬族">仡佬族</option>
			            <option value="锡伯族">锡伯族</option>
			            <option value="阿昌族">阿昌族</option>
			            <option value="撒拉族">撒拉族</option>
			            <option value="普米族">普米族</option>
			            <option value="塔吉克族">塔吉克族</option>
			            <option value="怒族">怒族</option>
			            <option value="乌孜别克族">乌孜别克族</option>
			            <option value="俄罗斯族">俄罗斯族</option>
			            <option value="鄂温克族">鄂温克族</option>
			            <option value="德昂族">德昂族</option>
			            <option value="保安族">保安族</option>
			            <option value="裕固族">裕固族</option>
			            <option value="京族">京族</option>
			            <option value="塔塔尔族">塔塔尔族</option>
			            <option value="独龙族">独龙族</option>
			            <option value="鄂伦春族">鄂伦春族</option>
			            <option value="赫哲族">赫哲族</option>
			            <option value="门巴族">门巴族</option>
			            <option value="珞巴族">珞巴族</option>
			            <option value="基诺族">基诺族</option> 	</select></td>	</tr>
				
			
			
		 <tr><td>政治面貌：</td>
			            <td><select name="party" class="form-control" style="width:100px">
			            <option value="1">中共党员</option>
			            <option value="2">中共预备党员</option>
			            <option value="3">共青团员</option>
			            <option value="4">民主党派</option>
			            <option value="5">群众</option>
			           </select></td>
			        </tr>
			         <tr><td>健康状况：</td>
			            <td><select name="health" class="form-control" style="width:100px">
			                <option value="8">良好</option>
			                <option value="9">健康</option>
			                <option value="10">一般</option>
			                <option value="11">有慢性疾病</option>
			            </select></td>
			        </tr>
			        <tr><td>户口类型</td>
			            <td><select name="regtype"class="form-control" style="width:100px">
			                <option value="1">农村户口</option>
			                <option value="2">城市居民</option>
			            </select></td>
			        </tr>
			        <tr><td>任职状态：</td>
			            <td><select name="status" class="form-control" style="width:100px">
			                <option value="1">试用</option>
			                <option value="2">转正</option>
			                <option value="3">挂靠</option>
			                <option value="4">自动离职</option>
			                <option value="5">辞退</option>
			             </select><font color="red">*</font></td> 
			         </tr>
			         	<tr class=" ">   <td colspan="4" align="center"><input type="submit" value="确定"> <input type="reset" value="取消" ><input type="button"   onclick="javascript:history.back(-1);" value="返回上一页"></td></tr>
		</table>
		</form>
		
		
		

		<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>