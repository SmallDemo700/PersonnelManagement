 package employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;
 
 
public class EmpModifyAction extends HttpServlet {
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmpDB empDB=new EmpDB();
		EmployeeInfo empInfo=new EmployeeInfo();
 
		 
		empInfo.setEmpid(MyTools.strToint(request.getParameter("empid")));
		empInfo.setDeptname(MyTools.toChinese(request.getParameter("dept")));
		empInfo.setTitlename(MyTools.toChinese(request.getParameter("title")));
		empInfo.setPostname(MyTools.toChinese(request.getParameter("post")));
		empInfo.setEmpname(MyTools.toChinese(request.getParameter("empname")));
		empInfo.setEmpcode(MyTools.toChinese(request.getParameter("empcode")));
		empInfo.setSex(MyTools.strToint(request.getParameter("gender")));
		empInfo.setIdcard(request.getParameter("idcard"));
		empInfo.setBirthday(request.getParameter("birthday"));
		empInfo.setNativeplace(MyTools.toChinese(request.getParameter("nativeplace")));
		empInfo.setEdulevel(MyTools.strToint(request.getParameter("edulevel")));
		empInfo.setNantion(MyTools.toChinese(request.getParameter("nantion")));
		empInfo.setHealth(MyTools.strToint(request.getParameter("health")));
		empInfo.setParty(MyTools.strToint(request.getParameter("party")));
		empInfo.setRegtype(MyTools.strToint(request.getParameter("regtype")));
		   empInfo.setStatus(MyTools.strToint(request.getParameter("status")));
			
			int count=empDB.updateEmp(empInfo);
			response.sendRedirect(request.getContextPath()+"/EmpListAction" );//閲嶅畾鍚�
	}

}
