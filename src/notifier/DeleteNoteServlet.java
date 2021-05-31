package notifier;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notifier.dao.EditNoteDao;
import notifier.dao.NotesDao;

/**
 * Servlet implementation class DeleteNoteServlet
 */
@WebServlet("/DeleteNoteServlet")
public class DeleteNoteServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter out=res.getWriter();
		
		HttpSession session=req.getSession();
		
		int user_id=(int) session.getAttribute("user_id");
		
		int note_id=(int) session.getAttribute("note_id");
		int book_id=(int) session.getAttribute("book_id");
		NotesDao  dao=new NotesDao();
		   try {
			   if(dao.deletenote(note_id))
			   {
				  
				   res.sendRedirect("previousnotes.jsp?book_id="+book_id);
			   }
			   else
			   {   res.sendRedirect("home.jsp");
				   System.out.println("Oops!! there is some problem");
			   }
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			   
		   } 
		   
	
	}


