package staff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;
 

 
public class TitleInsertAction extends HttpServlet {
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TitleDB beanDB=new TitleDB();
		   //1銆佽幏鍙栧鎴风鎻愪氦鏁版嵁
		   TitleInfo titleInfo=new  TitleInfo();
	 
		   titleInfo.setTitlename(MyTools.toChinese(request.getParameter("titlename")));
		   titleInfo.setQualification(MyTools.toChinese(request.getParameter("qualification")));
		   titleInfo.setDuty(MyTools.toChinese(request.getParameter("duty")));
		   titleInfo.setWorktarget(MyTools.toChinese(request.getParameter("worktarget")));
		   
 
		   //2銆佸鐞嗗鎴风鎻愪氦鏁版嵁
			beanDB.insertTitle(titleInfo);		    
		   //3銆佸悜瀹㈡埛绔仛鍑哄搷搴� 
		   response.sendRedirect(request.getContextPath()+"/TitleListAction");
	}

}
