package post;
 

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import common.*;
import organization.DeptInfo;
 
public class PostDB{
	private Connection con = null;
	
public ArrayList<PostInfo>getPostList(){
	ResultSet rs = null;
	Statement sql = null;
	ArrayList<PostInfo>postList = new ArrayList<PostInfo>();
	try {
		con = DBConnection.getConnection();
		sql=con.createStatement();
		//执行查询语句获取所有课程信息
		rs = sql.executeQuery("SELECT * FROM t_post");
		while(rs.next()){ 
			PostInfo postInfo=new PostInfo();
			
			postInfo.setPostid(rs.getInt("N_POST_ID"));
			postInfo.setPostname(rs.getString("VC_POST_NAME"));
			postInfo.setParentid(rs.getString("N_PARENT_ID"));
			postInfo.setDuty(rs.getString("VC_DUTY"));
			postInfo.setQualification(rs.getString("VC_QUALIFICATION"));
			postInfo.setPurview(rs.getString("VC_PURVIEW"));
			postInfo.setWorkcontent(rs.getString("VC_WORK_CONTENT"));
			 

			postList.add(postInfo);
		}
		rs.close();
		sql.close();
		//循环遍历课程信息结果集，将每条记录保存为一个课程信息对象，	
	}catch (Exception e) {
		System.out.println("获取所有岗位信息失败！");

		DBConnection.closeConnection();
	}
	
	return postList;
}

/*插入*/
public int insertPost(PostInfo postInfo) {
	PreparedStatement pStmt = null;
	int count=0;
	try {
		con = DBConnection.getConnection();
		
		pStmt =con.prepareStatement("insert into t_post(VC_POST_NAME,N_PARENT_ID,VC_DUTY,VC_QUALIFICATION,VC_PURVIEW,VC_WORK_CONTENT) values (?,?,?,?,?,?)");
	
		 
		pStmt.setString(1,postInfo.getPostname());		
		pStmt.setString(2,postInfo.getParentid());		
		pStmt.setString(3,postInfo.getDuty());		
		pStmt.setString(4,postInfo.getQualification());	
		pStmt.setString(5,postInfo.getPurview());	
		pStmt.setString(6,postInfo.getWorkcontent());	
		
		count=pStmt.executeUpdate();  
		pStmt.close();
			
							
						
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("添加岗位失败！");
	}finally {
		DBConnection.closeConnection();
	}
	
	return count;
}
/* 删除职称信息 */
public int deletePost(int postid) {
 	PreparedStatement pStmt=null; 
	int count=0;
    try {
    	con=DBConnection.getConnection();
		pStmt = con.prepareStatement("delete from  t_post  where N_POST_ID=?");
		pStmt.setInt(1,postid);		
		count=pStmt.executeUpdate();
		pStmt.close();    		
    } catch (Exception e) {
       	e.printStackTrace();
        System.out.println("删除岗位信息失败！");
    } finally{
    	DBConnection.closeConnection();
	}		
    return count;
} 
/*通过id得到信息*/
public  PostInfo getPostByid(String id){
	 ResultSet rs=null;
 	PreparedStatement pStmt=null; 
 	PostInfo postInfo=null;
	try {
		con = DBConnection.getConnection();
		pStmt = con.prepareStatement("SELECT * FROM t_post where N_POST_ID=?");
		pStmt.setString(1,id);		
		rs = pStmt.executeQuery();
	 
		if(rs.next()){
			postInfo = new PostInfo();
			
			postInfo.setPostid(rs.getInt("N_POST_ID"));
			postInfo.setPostname(rs.getString("VC_POST_NAME"));
			postInfo.setParentid(rs.getString("N_PARENT_ID"));
			postInfo.setDuty(rs.getString("VC_DUTY"));
			postInfo.setQualification(rs.getString("VC_QUALIFICATION"));
			postInfo.setPurview(rs.getString("VC_PURVIEW"));
			postInfo.setWorkcontent(rs.getString("VC_WORK_CONTENT"));
		

	 
		}
		rs.close();
		pStmt.close();
		//循环遍历课程信息结果集，将每条记录保存为一个课程信息对象，并把课程信息对象添加到数组studentList		
	}catch (Exception e) {
		System.out.println("获取单个信息失败！");

		DBConnection.closeConnection();
	}
	
	return postInfo;
}
public int updatePost(PostInfo postInfo) {
	PreparedStatement pStmt=null; 
	int count=0;
    try {			 
    	con=DBConnection.getConnection();
		
    	pStmt = con.prepareStatement("update t_post set N_POST_ID=?,VC_POST_NAME=?,N_PARENT_ID=?,VC_DUTY=?,VC_QUALIFICATION=?,VC_PURVIEW=?,VC_WORK_CONTENT=? where N_POST_ID=?");
		pStmt.setInt(1,postInfo.getPostid());
		pStmt.setString(2,postInfo.getPostname());		
		pStmt.setString(3,postInfo.getParentid());		
		pStmt.setString(4,postInfo.getDuty());		
		pStmt.setString(5,postInfo.getQualification());	
		pStmt.setString(6,postInfo.getPurview());	
		pStmt.setString(7,postInfo.getWorkcontent());	
		pStmt.setInt(8,postInfo.getPostid());
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
 
