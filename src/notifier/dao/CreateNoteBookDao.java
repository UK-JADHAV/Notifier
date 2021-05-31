package notifier.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CreateNoteBookDao
{
	String url="jdbc:mysql://localhost:3306/users";
	String username="root";
	String password1="Utki@141099";
	 public int book_id;
	public boolean createnotebook(int user_id, String book_name) 
			throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		PreparedStatement pr=con.prepareStatement("insert into notebook(user_id,book_name) values(?,?);");
	
		pr.setInt(1, user_id);
		pr.setString(2, book_name);
		
		System.out.println(pr);
         
		//ResultSet rs=pr.executeQuery();
		int n=pr.executeUpdate();
		pr=con.prepareStatement("select book_id from notebook where user_id=? and book_name=?;");
		 pr.setInt(1, user_id);
		 pr.setString(2, book_name);
		 ResultSet rs=pr.executeQuery();
		 rs.next();
		 book_id=rs.getInt("book_id");
		
		if(n==1)
		{
			 
			return true;
		}
		else
		return false;
	}
}
