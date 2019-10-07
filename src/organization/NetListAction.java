package organization;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NetListAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	  DeptDB deptDB = new DeptDB();
	  
	  request.getSession().setAttribute("DeptList",deptDB.getZongWuList());
	  response.sendRedirect(request.getContextPath()+"/organization/Net.jsp");
	  
	  
	}

}
