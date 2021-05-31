package notifier;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notifier.dao.LoginDao;
import notifier.dao.LoginDao;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String mail=req.getParameter("mail");
		String pass=req.getParameter("pass");
		LoginDao dao=new  LoginDao();
		
		try {
			if(dao.check(mail, pass))
			{
				
				HttpSession session=req.getSession();
				session.setAttribute("user_id", dao.user_id);
				session.setAttribute("mail", mail);
				session.setAttribute("uname", dao.uname);
				
				res.sendRedirect("home.jsp");
			}
			else
			{
				res.sendRedirect("login.jsp");
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
