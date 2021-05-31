package notifier;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basicclass.User;
import basicclass.notes;
import notifier.dao.PreviousDao;
import notifier.dao.UserProfileDao;

/**
 * Servlet implementation class UserProfileServlet
 */
@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
			
			HttpSession session=req.getSession();
			int user_id=(int) session.getAttribute("user_id");
			
			try {
				UserProfileDao dao=new UserProfileDao();
				User user=dao.profile(user_id);
			
				req.setAttribute("user", user);

				RequestDispatcher rd=req.getRequestDispatcher("userprofile.jsp");
				rd.forward(req, res);
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				
				e.printStackTrace();
			}
			
		}

	

}
