package employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import organization.DeptDB;

public class EmpListAction extends HttpServlet {
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	  
	 EmpDB empDB = new  EmpDB();
	  
	  request.getSession().setAttribute("empList",empDB.getEmpList());
	  response.sendRedirect(request.getContextPath()+"/employee/Employee.jsp");
	  
	  
	}

}

