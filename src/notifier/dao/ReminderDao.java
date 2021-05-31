package notifier.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;


import basicclass.notes;

public class ReminderDao {
	String url="jdbc:mysql://localhost:3306/users";
	String username="root";
	String password1="Utki@141099";
	public ArrayList reminder(int user_id) throws ClassNotFoundException, SQLException, ParseException
	{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	
        Date today = Calendar.getInstance()
                         .getTime();
  
    
        String dateToString = formatter.format(today);
		
	
        Date rutilDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateToString);
		 
		 java.sql.Date RsqlDate = new java.sql.Date(rutilDate.getTime());
		 
		 /*String rdate=req.getParameter("rdate");
		   Date rutilDate = new SimpleDateFormat("yyyy-MM-dd").parse(rdate);
		   java.sql.Date RsqlDate = new java.sql.Date(rutilDate.getTime());*/
		   
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		PreparedStatement pr=con.prepareStatement("select * from notes where user_id=? and rdate=?");
		pr.setInt(1, user_id);
		pr.setDate(2, RsqlDate);
		ArrayList<notes> list=new ArrayList<notes>();

		ResultSet rs=pr.executeQuery();
	
		while(rs.next())
		{
			notes note=new notes(rs.getInt("note_id"),rs.getInt("user_id"),rs.getInt("book_id"),rs.getString("event"),rs.getString("sdate"),rs.getString("edate"),rs.getString("rdate"),rs.getString("details"));
		    list.add(note);	
		  
			
		}
		return list;
	}

	
	public ArrayList expired(int user_id) throws ClassNotFoundException, SQLException, ParseException
	{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
        Date today = Calendar.getInstance()
                         .getTime();
  
    
        String dateToString = formatter.format(today);
		
	
        Date rutilDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateToString);
		 
		 java.sql.Date RsqlDate = new java.sql.Date(rutilDate.getTime());
		
		 Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password1);
			PreparedStatement pr=con.prepareStatement("select * from notes where user_id=? and rdate<?");
			pr.setInt(1, user_id);
			pr.setDate(2, RsqlDate);
			ArrayList<notes> list=new ArrayList<notes>();
            
			ResultSet rs=pr.executeQuery();
		
			while(rs.next())
			{
				notes note=new notes(rs.getInt("note_id"),rs.getInt("user_id"),rs.getInt("book_id"),rs.getString("event"),rs.getString("sdate"),rs.getString("edate"),rs.getString("rdate"),rs.getString("details"));
			    list.add(note);	
			  
				
			}
			return list;
	}
	
}
