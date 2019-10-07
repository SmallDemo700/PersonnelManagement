package post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import organization.DeptDB;
import organization.DeptInfo;

 
public class GetPostidAction extends HttpServlet {
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDB postDB = new PostDB();
		 
		 String id=request.getParameter("postidA");
		 PostInfo post = postDB.getPostByid(id);
		 request.getSession().setAttribute("postinfo",post);
		 response.sendRedirect(request.getContextPath()+"/post/Post_modify.jsp" );//重定向
	}

}
