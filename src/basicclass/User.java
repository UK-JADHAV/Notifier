package basicclass;

public class User
{   
	int user_id;
    String uname;
    String fname;
    String lname;
    String pass;
    String mail;
    String mobile;
    public User(int user_id,String uname,String fname,String lname,String pass,String mail,String mobile)
    {
    	this.user_id=user_id;
    	this.uname=uname;
    	this.fname=fname;
    	this.lname=lname;
    	this.pass=pass;
    	this.mail=mail;
    	this.mobile=mobile;
    
    }
    
    public int getUserId()
    {
    	return this.user_id;
    }
    
    public String getUName()
    {
    	return this.uname;
    }
    
    public String getFName()
    {
    	return this.fname;
    }
    public String getLName()
    {
    	return this.lname;
    }
    public String getPass()
    {
    	return this.pass;
    }
    
    public String getMail()
    {
    	return this.mail;
    }
    
    public String getMobile()
    {
    	return this.mobile;
    }
}
