package organization;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import common.DBConnection;
 
public class DeptDB {
	private Connection con = null;
	//插入操作
	public int insertdept(DeptInfo deptInfo) {
		PreparedStatement pStmt = null;
		int count=0;
		try {
			con = DBConnection.getConnection();
    		pStmt =con.prepareStatement("insert into t_dept(VC_MAIL,VC_DEPT_CODE,VC_DEPT_NAME,N_DEPT_TYPE,N_PARENT_ID,VC_LOCATION,VC_POST_CODE,VC_TELEPHONE,VC_FAX) values (?,?,?,?,?,?,?,?,?)");
    	
    		pStmt.setString(1,deptInfo.getMail());
    		pStmt.setString(2,deptInfo.getDeptcode());		
    		pStmt.setString(3,deptInfo.getDeptname());		
    		pStmt.setInt(4,deptInfo.getDepttype());		
    		pStmt.setString(5,deptInfo.getParentid());		
    		pStmt.setString(6,deptInfo.getLocation());
    		pStmt.setString(7,deptInfo.getPostcode());
    		pStmt.setString(8,deptInfo.getTelephone());
    		pStmt.setString(9,deptInfo.getFax());
    		
    		count=pStmt.executeUpdate();  
    		pStmt.close();											
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("插入成功！");
		}finally {
			DBConnection.closeConnection();
		}
		return count;
	}
    /* 删除指定数据*/
    public int deletedept(int deptcode) {
     	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("delete from  t_dept  where VC_DEPT_CODE=?");
    		pStmt.setInt(1,deptcode);
    		count=pStmt.executeUpdate();
    		
    		pStmt.close();    		
        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("删除成功！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    } 
    /*获取某部门所有信息*/
    public ArrayList<DeptInfo>getZongWuList(){
		ResultSet rs = null;
		Statement sql = null;
		ArrayList<DeptInfo>deptList = new ArrayList<DeptInfo>();
		try {
			con = DBConnection.getConnection();
			sql=con.createStatement();
			rs = sql.executeQuery("SELECT * FROM t_dept");
			while(rs.next()){
				DeptInfo deptInfo = new DeptInfo();
			 
				deptInfo.setDeptid(rs.getInt("N_DEPT_ID"));
				deptInfo.setDeptcode(rs.getString("VC_DEPT_CODE"));
				deptInfo.setDeptname(rs.getString("VC_DEPT_NAME"));
				deptInfo.setDepttype(rs.getInt("N_DEPT_TYPE"));
				deptInfo.setParentid(rs.getString("N_PARENT_ID"));
				deptInfo.setLocation(rs.getString("VC_LOCATION"));
				deptInfo.setPostcode(rs.getString("VC_POST_CODE"));
				deptInfo.setTelephone(rs.getString("VC_TELEPHONE"));
				deptInfo.setFax(rs.getString("VC_FAX"));
				deptInfo.setMail(rs.getString("VC_MAIL"));

				deptList.add(deptInfo);
			}
			rs.close();
			sql.close();
		}catch (Exception e) {
			System.out.println("获取成功！");
 
			DBConnection.closeConnection();
		}
		return deptList;
    }
    
    /*通过部门ID获取部门信息*/
    public  DeptInfo getdeptbycode(String code){
    	 ResultSet rs=null;
     	PreparedStatement pStmt=null; 
		DeptInfo deptInfo=null;
		try {
			con = DBConnection.getConnection();
			pStmt = con.prepareStatement("SELECT * FROM t_dept where VC_DEPT_CODE=?");
    		pStmt.setString(1,code);		
    		rs = pStmt.executeQuery();			
			if(rs.next()){
				 deptInfo = new DeptInfo();
				 deptInfo.setDeptid(rs.getInt("N_DEPT_ID"));
				deptInfo.setDeptcode(rs.getString("VC_DEPT_CODE"));
				deptInfo.setDeptname(rs.getString("VC_DEPT_NAME"));
				deptInfo.setDepttype(rs.getInt("N_DEPT_TYPE"));
				deptInfo.setParentid(rs.getString("N_PARENT_ID"));
				deptInfo.setLocation(rs.getString("VC_LOCATION"));
				deptInfo.setPostcode(rs.getString("VC_POST_CODE"));
				deptInfo.setTelephone(rs.getString("VC_TELEPHONE"));
				deptInfo.setFax(rs.getString("VC_FAX"));
				deptInfo.setMail(rs.getString("VC_MAIL"));		 
			}
			rs.close();
			pStmt.close();
		}catch (Exception e) {
			System.out.println("获取成功！");
 
			DBConnection.closeConnection();
		}
		
		return deptInfo;
    }
    
    /* 更新数据 */
    public int updateDept(DeptInfo dept) {
    	PreparedStatement pStmt=null; 
    	int count=0;
        try {
        	con=DBConnection.getConnection();
    		pStmt = con.prepareStatement("update t_dept set VC_MAIL=?,VC_DEPT_CODE=?,VC_DEPT_NAME=?,N_DEPT_TYPE=?,N_PARENT_ID=?,VC_LOCATION=?,VC_POST_CODE=?,VC_TELEPHONE=?,VC_FAX=? ,VC_DEPT_CODE=? where N_DEPT_ID=?");
    		pStmt.setString(1,dept.getMail());
    		pStmt.setString(2, dept.getDeptcode());
    		pStmt.setString(3,dept.getDeptname());
    		pStmt.setInt(4,dept.getDepttype());
    		pStmt.setString(5,dept.getParentid());
    		pStmt.setString(6,dept.getLocation());
    		pStmt.setString(7,dept.getPostcode());
    		pStmt.setString(8,dept.getTelephone());
    		pStmt.setString(9,dept.getFax());
    		pStmt.setString(10, dept.getDeptcode());
    		pStmt.setInt(11,dept.getDeptid());;
    		count=pStmt.executeUpdate();
			pStmt.close();

        } catch (Exception e) {
           	e.printStackTrace();
            System.out.println("修改成功！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }  
}
