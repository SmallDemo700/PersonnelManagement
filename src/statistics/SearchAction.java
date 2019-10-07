package statistics;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;
public class SearchAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<String> list = new ArrayList<String>();
		String[] condition = new String[10];
		request.setCharacterEncoding("gb2312");
		condition[0] = request.getParameter("name");
		condition[1] = request.getParameter("number");
		condition[2] = request.getParameter("sex");
		condition[3] = request.getParameter("department");
		condition[4] = request.getParameter("title");
		condition[5] = request.getParameter("post");
		condition[6] = request.getParameter("date");
		condition[7] = request.getParameter("education");
		condition[8] = request.getParameter("health");
		System.out.println(condition[7]+"          dsfsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		for(int i =0;i<condition.length;i++){
			if(condition[i]!="" && condition[i]!=null){
				list.add(condition[i]);
			}
		}
		System.out.println(list.size() +"     sd"); 		
		System.out.println(condition[6]); 
		
		request.getSession().setAttribute("info",list);
		response.sendRedirect(request.getContextPath()+"/statistics/statistics_view.jsp");
	}

}
