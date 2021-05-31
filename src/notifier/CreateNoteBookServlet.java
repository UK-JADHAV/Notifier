package notifier;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notifier.dao.CreateNoteBookDao;

/**
 * Servlet implementation class CreateNoteBookServlet
 */
@WebServlet("/CreateNoteBookServlet")
public class CreateNoteBookServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		PrintWriter out=res.getWriter();
		
		HttpSession session=req.getSession();
		int user_id=(int) session.getAttribute("user_id");
		
		String book_name=(String) req.getParameter("bname");
		System.out.println(book_name);
		CreateNoteBookDao dao=new CreateNoteBookDao();
		try {
			if(dao.createnotebook(user_id,book_name))
			{
		         session.setAttribute("book_id", dao.book_id);
		         
				/*out.println("Note book created Successfully");
				out.println("Create your first note in "+ book_name);
				out.println("book id"+dao.book_id);
				out.print("<html>");
				out.print("<body>");
				out.print("<form action='createnote.jsp' method='post' >");
				out.print("<input type='submit' value='create note'>");
				out.print("</form>");
                out.print("<body>");
				out.print("</body>");
				out.print("</html>");*/
		         
		         res.sendRedirect("home.jsp"); 
			}
			else
			{
				out.println("Ooops !! Something went wrong");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
