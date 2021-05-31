package notifier;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basicclass.User;
import notifier.dao.EditProfileDao;
import notifier.dao.RegisterDao;
import notifier.dao.UserProfileDao;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{ 
		
		HttpSession session=req.getSession();
		int user_id=(int)session.getAttribute("user_id");
        PrintWriter out=res.getWriter();   
	
	     EditProfileDao dao=new EditProfileDao();
	
	
	    String uname=req.getParameter("uname");
	    String fname=req.getParameter("fname");
	    String lname=req.getParameter("lname");
		String pass=req.getParameter("pass");
		String mail=req.getParameter("mail");
		String mobile=req.getParameter("mobile");
	try {
		
		
		if(dao.edit(uname,fname,lname, pass, mail, mobile,user_id))
		{   
			
			System.out.print(true);
			session.setAttribute("uname", uname);
			session.setAttribute("mail", mail);
		    out.print("Profile updated");	
		     out.print("<html>");
		     out.print("<body>");
		     out.print("<form action='home.jsp' method='post'>");
		     out.print("<input type='submit' value='home'>");
		     out.print("</form>");
		     out.print("</body>");
		     out.print("</html>");
		
		}
		else
		{
			System.out.print(false);
			out.print("Profile is not updated");
			

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


