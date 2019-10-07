package staff;
 

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import common.*;
import organization.DeptInfo;
 
public class TitleDB{
	private Connection con = null;
	
public ArrayList<TitleInfo>getTitleList(){
	ResultSet rs = null;
	Statement sql = null;
	ArrayList<TitleInfo>titleList = new ArrayList<TitleInfo>();
	try {
		con = DBConnection.getConnection();
		sql=con.createStatement();
		//鎵ц鏌ヨ璇彞鑾峰彇鎵�鏈夎绋嬩俊鎭�
		rs = sql.executeQuery("SELECT * FROM t_title");
		while(rs.next()){ 
			TitleInfo titleInfo=new TitleInfo();
			
			titleInfo.setTitleid(rs.getInt("N_TITLE_ID"));
			titleInfo.setTitlename(rs.getString("VC_TITLE_NAME"));
			titleInfo.setQualification(rs.getString("VC_QUALIFICATION"));
			titleInfo.setDuty(rs.getString("VC_DUTY"));
			titleInfo.setWorktarget(rs.getString("VC_WORK_TARGET"));
			 

			titleList.add(titleInfo);
		}
		rs.close();
		sql.close();
		//寰幆閬嶅巻璇剧▼淇℃伅缁撴灉闆嗭紝灏嗘瘡鏉¤褰曚繚瀛樹负涓�涓绋嬩俊鎭璞★紝骞舵妸璇剧▼淇℃伅瀵硅薄娣诲姞鍒版暟缁剆tudentList		
	}catch (Exception e) {
		System.out.println("鑾峰彇鎵�鏈夎亴绉颁俊鎭け璐ワ紒");

		DBConnection.closeConnection();
	}
	
	return titleList;
}

/*鎻掑叆*/
public int insertTitle(TitleInfo titleInfo) {
	PreparedStatement pStmt = null;
	int count=0;
	try {
		con = DBConnection.getConnection();
		
		pStmt =con.prepareStatement("insert into t_title( VC_TITLE_NAME,VC_QUALIFICATION,VC_DUTY,VC_WORK_TARGET) values ( ?,?,?,?)");
	
 
		pStmt.setString(1,titleInfo.getTitlename());		
		pStmt.setString(2,titleInfo.getQualification());		
		pStmt.setString(3,titleInfo.getDuty());		
		pStmt.setString(4,titleInfo.getWorktarget());		
		
		count=pStmt.executeUpdate();  
		pStmt.close();
			
							
						
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("娣诲姞鑱岀О澶辫触锛�");
	}finally {
		DBConnection.closeConnection();
	}
	
	return count;
}
/* 鍒犻櫎鑱岀О淇℃伅 */
public int deletetitle(int titleid) {
 	PreparedStatement pStmt=null; 
	int count=0;
    try {
    	con=DBConnection.getConnection();
		pStmt = con.prepareStatement("delete from  t_title  where N_TITLE_ID=?");
		pStmt.setInt(1,titleid);		
		count=pStmt.executeUpdate();
		pStmt.close();    		
    } catch (Exception e) {
       	e.printStackTrace();
        System.out.println("鍒犻櫎鑱岀О淇℃伅澶辫触锛�");
    } finally{
    	DBConnection.closeConnection();
	}		
    return count;
} 
/*閫氳繃id寰楀埌淇℃伅*/
public  TitleInfo gettitlebyid(String id){
	 ResultSet rs=null;
 	PreparedStatement pStmt=null; 
	TitleInfo titleInfo=null;
	try {
		con = DBConnection.getConnection();
		pStmt = con.prepareStatement("SELECT * FROM t_title where N_TITLE_ID=?");
		pStmt.setString(1,id);		
		rs = pStmt.executeQuery();
	 
		if(rs.next()){
			titleInfo = new TitleInfo();
			titleInfo.setTitleid(rs.getInt("N_TITLE_ID"));
			titleInfo.setTitlename(rs.getString("VC_TITLE_NAME"));
			titleInfo.setQualification(rs.getString("VC_QUALIFICATION"));
			titleInfo.setDuty(rs.getString("VC_DUTY"));
			titleInfo.setWorktarget(rs.getString("VC_WORK_TARGET"));
		

	 
		}
		rs.close();
		pStmt.close();
		//寰幆閬嶅巻璇剧▼淇℃伅缁撴灉闆嗭紝灏嗘瘡鏉¤褰曚繚瀛樹负涓�涓绋嬩俊鎭璞★紝骞舵妸璇剧▼淇℃伅瀵硅薄娣诲姞鍒版暟缁剆tudentList		
	}catch (Exception e) {
		System.out.println("鑾峰彇鍗曚釜淇℃伅澶辫触锛�");

		DBConnection.closeConnection();
	}
	
	return titleInfo;
}
public int updatetitle(TitleInfo titleInfo) {
	PreparedStatement pStmt=null; 
	int count=0;
    try {			 
    	con=DBConnection.getConnection();
		pStmt = con.prepareStatement("update t_title set VC_TITLE_NAME=?,VC_QUALIFICATION=?,VC_DUTY=?,VC_WORK_TARGET=? where N_TITLE_ID=?");
		pStmt.setString(1,titleInfo.getTitlename());
		pStmt.setString(2,titleInfo.getQualification());
		pStmt.setString(3,titleInfo.getDuty());
		pStmt.setString(4,titleInfo.getWorktarget());
		pStmt.setInt(5,titleInfo.getTitleid());
		count=pStmt.executeUpdate();
		pStmt.close();

    } catch (Exception e) {
       	e.printStackTrace();
        System.out.println("淇敼鑱岀О淇℃伅澶辫触锛�");
    } finally{
    	DBConnection.closeConnection();
	}		
    return count;
}  
	
}
 
