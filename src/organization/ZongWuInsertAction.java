package organization;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;

 
public class ZongWuInsertAction extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeptDB deptDB =new DeptDB();
		DeptInfo deptInfo = new DeptInfo();
		deptInfo.setDeptcode(request.getParameter("deptcode"));
		deptInfo.setParentid(MyTools.toChinese( request.getParameter("parentid")));
		deptInfo.setDeptname(MyTools.toChinese((request.getParameter("deptname"))));
		deptInfo.setDepttype(MyTools.strToint(request.getParameter("depttype")));
		deptInfo.setLocation(MyTools.toChinese(request.getParameter("location")));
		deptInfo.setPostcode(request.getParameter("postcode"));
		deptInfo.setTelephone(request.getParameter("telephone"));
		deptInfo.setFax(request.getParameter("fax"));
		deptInfo.setMail(request.getParameter("mail"));
		request.setCharacterEncoding("utf-8");
		deptDB.insertdept(deptInfo);
		response.sendRedirect(request.getContextPath()+"/ZongWuListAction");
		
	}
}
