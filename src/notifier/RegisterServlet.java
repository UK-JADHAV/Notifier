package notifier;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notifier.dao.RegisterDao;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		String uname=req.getParameter("uname");
		String fname=req.getParameter("fname");
		String lname=req.getParameter("lname");

		String pass=req.getParameter("pass");
		String mail=req.getParameter("mail");
		String mobile=req.getParameter("mobile");
		
		RegisterDao dao=new RegisterDao();
		
		try {
			if(dao.register(uname, fname, lname, pass, mail, mobile))
			{
				System.out.print(true);
				res.sendRedirect("login.jsp");
			}
			else
			{
				System.out.print(false);
				res.sendRedirect("register.jsp");

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
