package notifier.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditNoteDao
{
	String url="jdbc:mysql://localhost:3306/users";
	String username="root";
	String password1="Utki@141099";

	public boolean edit(String event, Date sdate, Date  edate, Date  rdate, String details, int user_id,int note_id) throws SQLException, ClassNotFoundException 
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		PreparedStatement pr=con.prepareStatement("update notes set event=?, sdate=?, edate=?, rdate=?, details=? where user_id=? and note_id=?");
		pr.setString(1, event);
		pr.setDate(2, sdate);
		pr.setDate(3, edate);
		pr.setDate(4, rdate);
		pr.setString(5, details);		
		pr.setInt(6, user_id);
		pr.setInt(7, note_id);

		 System.out.println(pr);

		//ResultSet rs=pr.executeQuery();
		int n=pr.executeUpdate();
		
		if(n==1)
		{
			return true;
		}
		else
		return false;
	}
}
