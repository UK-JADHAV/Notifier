package notifier.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import basicclass.User;


public class UserProfileDao 
{
	
	String url="jdbc:mysql://localhost:3306/users";
	String username="root";
	String password1="Utki@141099";
	public User profile(int user_id) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		PreparedStatement pr=con.prepareStatement("select * from user where user_id=?");
		pr.setInt(1, user_id);
	
		ResultSet rs=pr.executeQuery();
		
		rs.next();
	    User user=new User(rs.getInt("user_id"),rs.getString("username"),rs.getString("f_name"),
	    		rs.getString("l_name"),rs.getString("password"),rs.getString("mail"),rs.getString("mobile"));
		System.out.print(user);	
		return user;
	}
}
