package staff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class TitleDelAction extends HttpServlet {
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 TitleDB titleDB=new TitleDB();
		 TitleInfo titleInfo =new TitleInfo();
		 
		 int titleid=Integer.parseInt(request.getParameter("titleid"));
		 int count=titleDB.deletetitle(titleid);
		 response.sendRedirect(request.getContextPath()+"/TitleListAction");
	}

}
