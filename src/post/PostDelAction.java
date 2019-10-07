package post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class PostDelAction extends HttpServlet {
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PostDB postDB=new PostDB();
		 PostInfo postInfo =new PostInfo();
		 
		 int postid=Integer.parseInt(request.getParameter("postid"));
		 int count=postDB.deletePost(postid);
		 response.sendRedirect(request.getContextPath()+"/PostListAction");
	}

}
