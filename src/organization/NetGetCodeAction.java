package organization;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class NetGetCodeAction extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 DeptDB deptDB = new DeptDB();
		 
		 String code=request.getParameter("deptcode");
		 DeptInfo dept = deptDB.getdeptbycode(code);
		 request.getSession().setAttribute("deptinfo",dept);
		 response.sendRedirect(request.getContextPath()+"/organization/Net_Modify.jsp" );//閲嶅畾鍚�
	}

}
