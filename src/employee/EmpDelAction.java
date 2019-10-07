package employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class EmpDelAction extends HttpServlet {
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		doPost(request, response);
	}
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmpDB empDB=new EmpDB();
		 EmployeeInfo empInfo =new EmployeeInfo();
		 
		 int empid=Integer.parseInt(request.getParameter("empid"));
		 int count=empDB.deleteEmp(empid);
		 response.sendRedirect(request.getContextPath()+"/EmpListAction");
	}

}
