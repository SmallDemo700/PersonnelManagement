package employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;
 

 
public class EmpInsertAction extends HttpServlet {
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			EmpDB beanDB=new EmpDB();
		   //1銆佽幏鍙栧鎴风鎻愪氦鏁版嵁
			EmployeeInfo empInfo=new  EmployeeInfo();
			
			
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
 
		   //2銆佸鐞嗗鎴风鎻愪氦鏁版嵁
			beanDB.insertEmp(empInfo);		    
		   //3銆佸悜瀹㈡埛绔仛鍑哄搷搴� 
		   response.sendRedirect(request.getContextPath()+"/EmpListAction");
	}

}
