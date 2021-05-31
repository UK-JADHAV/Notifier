package basicclass;

public class notebook
{
    int book_id;
    int user_id;
    String book_name;
    
    public notebook(int book_id,int user_id,String book_name)
    {
    	this.book_id=book_id;
    	this.user_id=user_id;
    	this.book_name=book_name;
    }
    
    public int getBook_id()
    {
    	return this.book_id;
    }
    
    public int getUser_id()
    {
    	return this.user_id;
    }
    
    public String getBook_name()
    {
    	return this.book_name;
    }
}
