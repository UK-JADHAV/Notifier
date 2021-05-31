package notifier.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterDao {

	String url="jdbc:mysql://localhost:3306/users";
	String username="root";
	String password1="Utki@141099";
	public boolean register(String uname,String fname,String lname,String password,String mail,String mobile) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		PreparedStatement pr=con.prepareStatement("insert into user(username,f_name,l_name,password,mail,mobile) values(?,?,?,?,?,?);");
		pr.setString(1, uname);
		pr.setString(2, fname);
		pr.setString(3, lname);
		pr.setString(4, password);
		pr.setString(5, mail);
		pr.setString(6, mobile);
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
