package employee;
 

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import common.*;
import organization.DeptInfo;
import post.PostInfo;
import staff.TitleInfo;
 
public class EmpDB{
	private Connection con = null;
	
public  ArrayList<DeptInfo>getDept(){
	
	ResultSet rs = null;
	Statement sql = null;
	ArrayList<DeptInfo> deptList = new ArrayList<DeptInfo>();
	try {
		con = DBConnection.getConnection();
		sql=con.createStatement();
		//执行查询语句获取所有课程信息
		rs = sql.executeQuery("SELECT  DISTINCT  VC_DEPT_NAME FROM t_dept  ");
		while(rs.next()){ 
			DeptInfo deptInfo=new DeptInfo();
			  deptInfo.setDeptname(rs.getString("VC_DEPT_NAME"));
			deptList .add(deptInfo);
		}
		rs.close();
		sql.close();
		//循环遍历课程信息结果集，将每条记录保存为一个课程信息对象，	
	}catch (Exception e) {
		System.out.println("获取所有雇员信息失败！");

		DBConnection.closeConnection();
	}
	
	return deptList;
}
	
public  ArrayList<TitleInfo>getTitle(){
	
	ResultSet rs = null;
	Statement sql = null;
	ArrayList<TitleInfo>titleList = new ArrayList<TitleInfo>();
	try {
		con = DBConnection.getConnection();
		sql=con.createStatement();
		//执行查询语句获取所有课程信息
		rs = sql.executeQuery("SELECT  DISTINCT  VC_TITLE_NAME FROM t_title  ");
		while(rs.next()){ 
			TitleInfo titleInfo=new TitleInfo();
			 titleInfo.setTitlename(rs.getString("VC_TITLE_NAME"));
			titleList .add(titleInfo);
		}
		rs.close();
		sql.close();
		//循环遍历课程信息结果集，将每条记录保存为一个课程信息对象，	
	}catch (Exception e) {
		System.out.println("获取所有雇员信息失败！");

		DBConnection.closeConnection();
	}
	
	return titleList;
}
public  ArrayList<PostInfo>getPost(){
	
	ResultSet rs = null;
	Statement sql = null;
	ArrayList<PostInfo>postList = new ArrayList<PostInfo>();
	try {
		con = DBConnection.getConnection();
		sql=con.createStatement();
		//执行查询语句获取所有课程信息
		rs = sql.executeQuery("SELECT  DISTINCT  VC_POST_NAME FROM t_post  ");
		while(rs.next()){ 
			PostInfo postInfo=new PostInfo();
			postInfo.setPostname(rs.getString("VC_POST_NAME"));
			postList .add(postInfo);
		}
		rs.close();
		sql.close();
		//循环遍历课程信息结果集，将每条记录保存为一个课程信息对象，	
	}catch (Exception e) {
		System.out.println("获取所有雇员信息失败！");

		DBConnection.closeConnection();
	}
	
	return postList;
}
	
	
	
	
	
	
	
public ArrayList<EmployeeInfo>getEmpList(){
	ResultSet rs = null;
	Statement sql = null;
	ArrayList<EmployeeInfo> empList = new ArrayList<EmployeeInfo>();
	try {
		con = DBConnection.getConnection();
		sql=con.createStatement();
		//执行查询语句获取所有课程信息
		rs = sql.executeQuery("SELECT * FROM t_employee");
		while(rs.next()){ 
			EmployeeInfo empInfo=new EmployeeInfo();
			
			empInfo.setEmpid(rs.getInt("N_EMP_ID"));
			empInfo.setDeptname(rs.getString("VC_DEPT_NAME"));
			empInfo.setTitlename(rs.getString("VC_TITLE_NAME"));
			empInfo.setPostname(rs.getString("VC_POST_NAME"));
			empInfo.setEmpname(rs.getString("VC_EMP_NAME"));
			empInfo.setEmpcode(rs.getString("VC_EMP_CODE"));
			empInfo.setSex(rs.getInt("N_GENDER"));
			empInfo.setIdcard(rs.getString("VC_IDCARD_CODE"));
			empInfo.setBirthday(rs.getString("D_BIRTHDAY"));
			empInfo.setNativeplace(rs.getString("VC_NATIVE_PLACE"));
			empInfo.setEdulevel(rs.getInt("N_EDU_LEVEL"));
			empInfo.setNantion(rs.getString("N_NANTION"));
			empInfo.setParty(rs.getInt("N_PARTY"));
			empInfo.setHealth(rs.getInt("N_HEALTH"));
			empInfo.setRegtype(rs.getInt("N_REG_TYPE"));
			empInfo.setStatus(rs.getInt("N_STATUS"));
		

			empList.add(empInfo);
		}
		rs.close();
		sql.close();
		//循环遍历课程信息结果集，将每条记录保存为一个课程信息对象，	
	}catch (Exception e) {
		System.out.println("获取所有雇员信息失败！");

		DBConnection.closeConnection();
	}
	
	return empList;
}

/*插入*/
public int insertEmp(EmployeeInfo empInfo) {
	PreparedStatement pStmt = null;
	int count=0;
	try {
		con = DBConnection.getConnection();
		
		pStmt =con.prepareStatement("insert into t_employee(VC_DEPT_NAME,VC_TITLE_NAME,VC_POST_NAME,VC_EMP_NAME,VC_EMP_CODE,N_GENDER,VC_IDCARD_CODE,D_BIRTHDAY,VC_NATIVE_PLACE,N_EDU_LEVEL,N_NANTION,N_PARTY,N_HEALTH,N_REG_TYPE,N_STATUS) values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	
		
//		pStmt.setInt(1, empInfo.getEmpid());
		pStmt.setString(1,empInfo.getDeptname());
		pStmt.setString(2,empInfo.getTitlename());
		pStmt.setString(3,empInfo.getPostname());
		pStmt.setString(4,empInfo.getEmpname());
		pStmt.setString(5,empInfo.getEmpcode());
		pStmt.setInt(6,empInfo.getSex());
		pStmt.setString(7,empInfo.getIdcard());
		pStmt.setString(8,empInfo.getBirthday());
		pStmt.setString(9,empInfo.getNativeplace());
		pStmt.setInt(10,empInfo.getEdulevel());
		pStmt.setString(11,empInfo.getNantion());
		pStmt.setInt(12,empInfo.getParty());
		pStmt.setInt(13,empInfo.getHealth());
		pStmt.setInt(14,empInfo.getRegtype());
		pStmt.setInt(15,empInfo.getStatus());
		
		
	
		
		count=pStmt.executeUpdate();  
		pStmt.close();
			
							
						
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("添加雇员失败！");
	}finally {
		DBConnection.closeConnection();
	}
	
	return count;
}
/* 删除职称信息 */
public int deleteEmp(int emptid) {
 	PreparedStatement pStmt=null; 
	int count=0;
    try {
    	con=DBConnection.getConnection();
		pStmt = con.prepareStatement("delete from  t_employee  where N_EMP_ID=?");
		pStmt.setInt(1,emptid);		
		count=pStmt.executeUpdate();
		pStmt.close();    		
    } catch (Exception e) {
       	e.printStackTrace();
        System.out.println("删除雇员信息失败！");
    } finally{
    	DBConnection.closeConnection();
	}		
    return count;
} 
/*通过id得到信息*/
public  EmployeeInfo getEmpByid(String id){
	 ResultSet rs=null;
 	PreparedStatement pStmt=null; 
 	EmployeeInfo empInfo=null;
	try {
		con = DBConnection.getConnection();
		pStmt = con.prepareStatement("SELECT * FROM t_employee where N_EMP_ID=?");
		pStmt.setString(1,id);		
		rs = pStmt.executeQuery();
	 
		if(rs.next()){
			empInfo = new EmployeeInfo();
	
			empInfo.setEmpid(rs.getInt("N_EMP_ID"));
			empInfo.setDeptname(rs.getString("VC_DEPT_NAME"));
			empInfo.setTitlename(rs.getString("VC_TITLE_NAME"));
			empInfo.setPostname(rs.getString("VC_POST_NAME"));
			empInfo.setEmpname(rs.getString("VC_EMP_NAME"));
			empInfo.setEmpcode(rs.getString("VC_EMP_CODE"));
			empInfo.setSex(rs.getInt("N_GENDER"));
			empInfo.setIdcard(rs.getString("VC_IDCARD_CODE"));
			empInfo.setBirthday(rs.getString("D_BIRTHDAY"));
			empInfo.setNativeplace(rs.getString("VC_NATIVE_PLACE"));
			empInfo.setEdulevel(rs.getInt("N_EDU_LEVEL"));
			empInfo.setNantion(rs.getString("N_NANTION"));
			empInfo.setParty(rs.getInt("N_PARTY"));
			empInfo.setHealth(rs.getInt("N_HEALTH"));
			empInfo.setRegtype(rs.getInt("N_REG_TYPE"));
			empInfo.setStatus(rs.getInt("N_STATUS"));
	 
		}
		rs.close();
		pStmt.close();
		//循环遍历课程信息结果集，将每条记录保存为一个课程信息对象，并把课程信息对象添加到数组studentList		
	}catch (Exception e) {
		System.out.println("获取单个信息失败！");

		DBConnection.closeConnection();
	}
	
	return empInfo;
}
public int updateEmp(EmployeeInfo empInfo) {
	PreparedStatement pStmt=null; 
	int count=0;
    try {			 
    	con=DBConnection.getConnection();
		
    	pStmt = con.prepareStatement("update t_employee set VC_DEPT_NAME=?,VC_TITLE_NAME=?,VC_POST_NAME=?,VC_EMP_NAME=?,VC_EMP_CODE=?,N_GENDER=?,VC_IDCARD_CODE=?,D_BIRTHDAY=?,VC_NATIVE_PLACE=?,N_EDU_LEVEL=?,N_NANTION=?,N_PARTY=?,N_HEALTH=?,N_REG_TYPE=?,N_STATUS=? where N_EMP_ID=?");
 		
		 
		pStmt.setString(1,empInfo.getDeptname());
		pStmt.setString(2,empInfo.getTitlename());
		pStmt.setString(3,empInfo.getPostname());
		pStmt.setString(4,empInfo.getEmpname());
		pStmt.setString(5,empInfo.getEmpcode());
		pStmt.setInt(6,empInfo.getSex());
		pStmt.setString(7,empInfo.getIdcard());
		pStmt.setString(8,empInfo.getBirthday());
		pStmt.setString(9,empInfo.getNativeplace());
		pStmt.setInt(10,empInfo.getEdulevel());
		pStmt.setString(11,empInfo.getNantion());
		pStmt.setInt(12,empInfo.getParty());
		pStmt.setInt(13,empInfo.getHealth());
		pStmt.setInt(14,empInfo.getRegtype());
		pStmt.setInt(15,empInfo.getStatus());
		pStmt.setInt(16,empInfo.getEmpid());
		count=pStmt.executeUpdate();
		pStmt.close();

    } catch (Exception e) {
       	e.printStackTrace();
        System.out.println("修改岗位信息失败！");
    } finally{
    	DBConnection.closeConnection();
	}		
    return count;
}  
	
}
 
