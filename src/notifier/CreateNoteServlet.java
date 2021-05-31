package notifier;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import notifier.dao.NotesDao;


/**
 * Servlet implementation class CreateNoteServlet
 */
@WebServlet("/CreateNoteServlet")
public class CreateNoteServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		PrintWriter out=res.getWriter();
	
		HttpSession session=req.getSession();
		
		int user_id=(int) session.getAttribute("user_id");
		int book_id=(int) session.getAttribute("book_id");
		
	   String event=req.getParameter("event");
	   
	   String sdate=req.getParameter("sdate");
	   try {
	     Date sutilDate;
	
		sutilDate = new SimpleDateFormat("yyyy-MM-dd").parse(sdate);
	
	   java.sql.Date SsqlDate = new java.sql.Date(sutilDate.getTime());
	   
	   String edate=req.getParameter("edate");
	   Date eutilDate = new SimpleDateFormat("yyyy-MM-dd").parse(edate);
	   java.sql.Date EsqlDate = new java.sql.Date(eutilDate.getTime());
	   
	   String rdate=req.getParameter("rdate");
	   Date rutilDate = new SimpleDateFormat("yyyy-MM-dd").parse(rdate);
	   java.sql.Date RsqlDate = new java.sql.Date(rutilDate.getTime());
	   
	 /*  long time=Integer.parseInt(req.getParameter("time"));
	   //Timer utilTime=new Timer(time);
	   java.sql.Time sqlTime=new java.sql.Time(time);*/
	   
	   String details=req.getParameter("details");
	   
	   NotesDao dao=new NotesDao();
	   try {
		if(dao.note(user_id,book_id,event,SsqlDate,EsqlDate,RsqlDate,details))
		   {
			   
			   
			   res.sendRedirect("previousnotes.jsp?book_id="+book_id);
			   
		   }
		   else
		   {   res.sendRedirect("createnote.jsp");
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
		   
	   } catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	   
	}

}
