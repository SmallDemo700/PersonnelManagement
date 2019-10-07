package staff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;
 
 
public class TitleModifyAction extends HttpServlet {
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TitleDB titleDB=new TitleDB();
		TitleInfo titleInfo=new TitleInfo();
		
		titleInfo.setTitleid(MyTools.strToint(request.getParameter("titleid")));
		titleInfo.setTitlename(MyTools.toChinese(request.getParameter("titlename")));
		titleInfo.setQualification(MyTools.toChinese(request.getParameter("qualification")));
		titleInfo.setDuty(MyTools.toChinese(request.getParameter("duty")));
		titleInfo.setWorktarget(MyTools.toChinese(request.getParameter("worktarget")));
		
	 
			
			int count=titleDB.updatetitle(titleInfo);
			response.sendRedirect(request.getContextPath()+"/TitleListAction" );//閲嶅畾鍚�
	}

}
