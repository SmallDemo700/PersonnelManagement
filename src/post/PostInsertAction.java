package post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;
 

 
public class PostInsertAction extends HttpServlet {
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PostDB beanDB=new PostDB();
		   //1銆佽幏鍙栧鎴风鎻愪氦鏁版嵁
			PostInfo postInfo=new  PostInfo();
			
			//postInfo.setPostid(MyTools.strToint("postid"));
			postInfo.setPostname(MyTools.toChinese(request.getParameter("postname")));
			postInfo.setParentid(MyTools.toChinese(request.getParameter("parentid")));
			postInfo.setDuty(MyTools.toChinese(request.getParameter("duty")));
			postInfo.setQualification(MyTools.toChinese(request.getParameter("qualification")));
			postInfo.setPurview(MyTools.toChinese(request.getParameter("purview")));
			postInfo.setWorkcontent(MyTools.toChinese(request.getParameter("workcontent")));
			 
  		   
 
		   //2銆佸鐞嗗鎴风鎻愪氦鏁版嵁
			beanDB.insertPost(postInfo);		    
		   //3銆佸悜瀹㈡埛绔仛鍑哄搷搴� 
		   response.sendRedirect(request.getContextPath()+"/PostListAction");
	}

}
