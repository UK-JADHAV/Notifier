package notifier.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import basicclass.notebook;
import basicclass.notes;

public class PreviousBookDao
{
	String url="jdbc:mysql://localhost:3306/users";
	String username="root";
	String password1="Utki@141099";
	public ArrayList previous(int user_id) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		
		PreparedStatement pr=con.prepareStatement("select * from notebook where user_id=?");
		pr.setInt(1, user_id);
		
		ArrayList<notebook> list=new ArrayList<notebook>();

		ResultSet rs=pr.executeQuery();
	
		while(rs.next())
		{
			notebook book=new notebook(rs.getInt("book_id"),rs.getInt("user_id"),rs.getString("book_name"));
		    list.add(book);	
		  
			
		}
		return list;
	}
}
