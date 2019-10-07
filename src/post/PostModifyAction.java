 package post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;
 
 
public class PostModifyAction extends HttpServlet {
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDB postDB=new PostDB();
		PostInfo postInfo=new PostInfo();
		
		postInfo.setPostid(MyTools.strToint(request.getParameter("postid")));
		postInfo.setPostname(MyTools.toChinese(request.getParameter("postname")));
		postInfo.setParentid(MyTools.toChinese(request.getParameter("parentid")));
		postInfo.setDuty(MyTools.toChinese(request.getParameter("duty")));
		postInfo.setQualification(MyTools.toChinese(request.getParameter("qualification")));
		postInfo.setPurview(MyTools.toChinese(request.getParameter("purview")));
		postInfo.setWorkcontent(MyTools.toChinese(request.getParameter("workcontent")));
		 
	 
			
			int count=postDB.updatePost(postInfo);
			response.sendRedirect(request.getContextPath()+"/PostListAction" );//重定向
	}

}
