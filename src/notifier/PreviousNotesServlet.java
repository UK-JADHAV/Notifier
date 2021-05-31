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

import basicclass.notes;
import notifier.dao.PreviousDao;

/**
 * Servlet implementation class PreviousNotesServlet
 */
@WebServlet("/PreviousNotesServlet")
public class PreviousNotesServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		/*ArrayList<notes> list=new ArrayList<notes>();
		HttpSession session=req.getSession();
		int user_id=(int) session.getAttribute("user_id");
		PreviousDao dao=new PreviousDao();
		try {
			list=dao.previous(user_id);
			req.setAttribute("list", list);
			RequestDispatcher rd=req.getRequestDispatcher("previousnotes.jsp");
			rd.forward(req, res);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
	}

}
