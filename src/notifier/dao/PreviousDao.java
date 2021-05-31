package notifier.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import basicclass.notes;

public class PreviousDao
{
	String url="jdbc:mysql://localhost:3306/users";
	String username="root";
	String password1="Utki@141099";
	public ArrayList previous(int user_id,int book_id) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		PreparedStatement pr=con.prepareStatement("select * from notes where user_id=? and book_id=?");
		pr.setInt(1, user_id);
		pr.setInt(2, book_id);
		
		ArrayList<notes> list=new ArrayList<notes>();

		ResultSet rs=pr.executeQuery();
	
		while(rs.next())
		{
			notes note=new notes(rs.getInt("note_id"),rs.getInt("user_id"),rs.getInt("book_id"),rs.getString("event"),rs.getString("sdate"),
					rs.getString("edate"),rs.getString("rdate"),rs.getString("details"));
		    list.add(note);	
		  
			
		}
		return list;
	}
	
	public notes previousnote(int user_id,int note_id) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		PreparedStatement pr=con.prepareStatement("select * from notes where user_id=? and note_id=?");
		pr.setInt(1, user_id);
		pr.setInt(2, note_id );
	

		ResultSet rs=pr.executeQuery();
	   
		notes note = null;
		if(rs.next())
		{
			note=new notes(rs.getInt("note_id"),rs.getInt("user_id"),rs.getInt("book_id"),rs.getString("event"),rs.getString("sdate"),
					rs.getString("edate"),rs.getString("rdate"),rs.getString("details"));
	
		  
			
		}
		return note;
	}
	

}
