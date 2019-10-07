package statistics;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import statistics.*;

public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String path = request.getContextPath();
		//1����ȡ�ͻ����ύ����
		String username = request.getParameter("userName");
		String pwd = request.getParameter("password");
		//TODO 1 ��ȡ�ͻ��������е��û���������

		//2������ͻ����ύ����
		UserInfo user =new UserInfo();
		UserDB u = new UserDB();
		user = u.GetUserbyName(username);
		//TODO 2 ʹ��UserDB����ķ�������ȡ�ƶ��û������û�����
		int flag=0;//��¼�ɹ�0 �û������� 1 ������� 2
		if(user == null ){
			flag = 1;
		}else if(pwd.equals(user.getUserPwd()) && username.equals(user.getUserName())){
			flag = 0;
		}else{
			flag = 2;
		}
		//TODO 3 ͨ����ȡ�û���Ϣ�Ϳͻ����ύ��Ϣ���бȽϣ�����flag��ֵ
		request.getSession().setAttribute("username",username);
		
		//3����ͻ���������Ӧ
		if(flag==0){
			response.sendRedirect(path+"/index.jsp");
		}else{
			response.sendRedirect(path+"/login/login.jsp?loginflag="+flag);
		}
	}

}
