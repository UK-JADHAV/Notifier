package notifier.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditProfileDao {

	
	String url="jdbc:mysql://localhost:3306/users";
	String username="root";
	String password1="Utki@141099";
	
	public boolean edit(String uname, String fname, String lname, String pass, String mail, String mobile, int user_id) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password1);
		PreparedStatement pr=con.prepareStatement("update user set username=?,f_name=?,l_name=?, password=?, mail=?, mobile=? where user_id=?");
		pr.setString(1, uname);
		pr.setString(2, fname);
		pr.setString(3, lname);
        pr.setString(4, pass);
		pr.setString(5, mail);
		pr.setString(6, mobile);
		pr.setInt(7, user_id);

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
