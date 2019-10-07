package organization;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
public class ZongWuDelAction extends HttpServlet {
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeptDB deptDB =new DeptDB();
		DeptInfo deptInfo = new DeptInfo();
		int deptcode=Integer.parseInt(request.getParameter("deptcode"));		
		/* int type = Integer.parseInt(request.getParameter("type")); */
	 	int count=deptDB.deletedept(deptcode);						
		response.sendRedirect(request.getContextPath()+"/ZongWuListAction" );
	}

}
