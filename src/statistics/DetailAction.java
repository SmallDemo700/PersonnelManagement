package statistics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.EmpDB;
import employee.EmployeeInfo;


public class DetailAction extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmpDB empDB = new EmpDB();
		 
		 String id=request.getParameter("empidA");
		 EmployeeInfo emp = empDB.getEmpByid(id);
		 request.getSession().setAttribute("empinfo",emp);
		 response.sendRedirect(request.getContextPath()+"/statistics/statistics_detail.jsp" );//閲嶅畾鍚�
	}
}
