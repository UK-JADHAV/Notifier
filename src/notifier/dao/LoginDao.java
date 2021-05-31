package notifier.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
	
	String url="jdbc:mysql://localhost:3306/users";
	String username="root";
	String password1="Utki@141099";
	public int user_id ;
	public String uname;
	public boolean check(String mail,String password) throws ClassNotFoundException, SQLException
	{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		PreparedStatement pr=con.prepareStatement("select * from user where mail=? and password=?");
		pr.setString(1, mail);
		pr.setString(2, password);

		ResultSet rs=pr.executeQuery();
		
		if(rs.next())
		{
			uname=rs.getString("username");
			user_id=rs.getInt("user_id");
			System.out.println("\n**data fetched**"+user_id);
			return true;
		}
		else
		return false;
	}

}
