package notifier.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;

public class NotesDao 
{
	String url="jdbc:mysql://localhost:3306/users";
	String username="root";
	String password1="Utki@141099";
	
	public boolean note(int user_id,int book_id,String event,Date sdate,Date edate,Date rdate,String detail) 
			throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		PreparedStatement pr=con.prepareStatement("insert into notes(user_id,book_id,event,sdate,edate,rdate,details) values(?,?,?,?,?,?,?);");
	
		pr.setInt(1, user_id);
		pr.setInt(2, book_id);
		pr.setString(3, event);
		pr.setDate(4, sdate);
		pr.setDate(5, edate);
		pr.setDate(6, rdate);
		pr.setString(7, detail);
		

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
	
	public boolean deletenote(int note_id) 
			throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		PreparedStatement pr=con.prepareStatement("delete from notes where note_id=?;");
		pr.setInt(1, note_id);
		
		

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
