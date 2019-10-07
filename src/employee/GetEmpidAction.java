package employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import organization.DeptDB;
import organization.DeptInfo;

 
public class GetEmpidAction extends HttpServlet {
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmpDB empDB = new EmpDB();
		 
		 String id=request.getParameter("empidA");
		 EmployeeInfo emp = empDB.getEmpByid(id);
		 request.getSession().setAttribute("empinfo",emp);
		 response.sendRedirect(request.getContextPath()+"/employee/Emp_modify.jsp" );//閲嶅畾鍚�
	}

}
