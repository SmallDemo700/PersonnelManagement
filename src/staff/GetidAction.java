package staff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import organization.DeptDB;
import organization.DeptInfo;

 
public class GetidAction extends HttpServlet {
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TitleDB titleDB = new TitleDB();
		 
		 String id=request.getParameter("titleid");
		 TitleInfo title = titleDB.gettitlebyid(id);
		 request.getSession().setAttribute("titleinfo",title);
		 response.sendRedirect(request.getContextPath()+"/staff/Title_modify.jsp" );//重定向
	}

}
