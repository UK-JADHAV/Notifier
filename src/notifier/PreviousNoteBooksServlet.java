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

import basicclass.notebook;
import basicclass.notes;
import notifier.dao.PreviousBookDao;
import notifier.dao.PreviousDao;


@WebServlet("/PreviousNoteBooksServlet")
public class PreviousNoteBooksServlet extends HttpServlet {
		protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
		{
			ArrayList<notebook> list=new ArrayList<notebook>();
			HttpSession session=req.getSession();
			int user_id=(int) session.getAttribute("user_id");
			PreviousBookDao dao=new PreviousBookDao();
			try {
				list=dao.previous(user_id);
				req.setAttribute("list", list);
				RequestDispatcher rd=req.getRequestDispatcher("previousbooks.jsp");
				rd.forward(req, res);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}


