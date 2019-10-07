package statistics;
import java.sql.*;

import java.util.HashMap;

import common.*;
public class UserDB {
	private Connection con = null;
	public UserInfo GetUserbyName(String userName) {
		UserInfo user = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		try {
			con = DBConnection.getConnection();
			pStmt = (PreparedStatement) con.prepareStatement("select * from t_user where VC_LOGIN_NAME=?");
			pStmt.setString(1,userName);
			rs = pStmt.executeQuery();
			if(rs.next()) {
				user = new UserInfo();
				user.setUserID(rs.getInt("N_USER_ID"));
				user.setUserName(rs.getString("VC_LOGIN_NAME"));
				user.setUserPwd(rs.getString("VC_PASSWORD"));
			}
			rs.close();
			pStmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("��ȡ�û���Ϣʧ�ܣ�");
		} finally {
			DBConnection.closeConnection();
		}
		return user;
	}
	
	public HashMap<Integer, Integer> GetEducation() {
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		HashMap<Integer, Integer> hm = new HashMap<Integer, Integer>();
		try {
			con = DBConnection.getConnection();
			pStmt = (PreparedStatement) con.prepareStatement("select N_EDU_LEVEL,count(N_EDU_LEVEL) as count from t_employee group by N_EDU_LEVEL desc");
			rs = pStmt.executeQuery();			
			if(rs.next()) {
				hm.put(rs.getInt("N_EDU_LEVEL"), rs.getInt("count"));
			}
			rs.close();
			pStmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("��ȡ�û���Ϣʧ�ܣ�");
		} finally {
			DBConnection.closeConnection();
			System.out.println(hm.get(3));
		}
		return hm;
	}
	public void main(String[] args) {
		UserDB db = new UserDB();
		db.GetEducation();
	}
}
