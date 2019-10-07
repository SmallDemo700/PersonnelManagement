package organization;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RengZiDelAction extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeptDB deptDB =new DeptDB();
		DeptInfo deptInfo = new DeptInfo();
 
		int deptcode=Integer.parseInt(request.getParameter("deptcode"));		//閼惧嘲褰囩�广垺鍩涚粩顖涘絹娴溿倖鏆熼幑锟�
 
	 	int count=deptDB.deletedept(deptcode);							//鐠嬪啰鏁ゆ稉姘婢跺嫮鎮夿ean閻ㄥ嫭鏌熷▔鏇烆槱閻炲棙鏆熼幑锟�
 
		response.sendRedirect(request.getContextPath()+"/RengZiListAction" );//闁插秴鐣鹃崥锟�
	}

}
