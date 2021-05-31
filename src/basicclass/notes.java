package basicclass;

public class notes 
{   
	int note_id;
	int user_id;
	int book_id;
    String event;
    String sdate;
    String edate;
    String rdate;
    String details;
  
    public notes(int note_id,int user_id,int book_id,String event, String sdate, String edate, String rdate, String details) 
    {
    	this.note_id=note_id;
    	this.user_id=user_id;
    	this.book_id=1;
    	this.event=event;
    	this.sdate=sdate;
    	this.edate=edate;
    	this.rdate=rdate;
    	this.details=details;	
	}
    
    public int getNoteId()
    {
    	return this.note_id;
    } 
    
    public int getUserId()
    {
    	return this.user_id;
    } 
    
    public int getBookId()
    {
    	return this.book_id;
    } 
    
    public String getEvent()
    {
    	return this.event;
    } 
    
    public String getsdate()
    {
    	return this.sdate;
    }
    
    public String getedate()
    {
    	return this.edate;
    }
    
    public String getrdate()
    {
    	return this.rdate ;
    }
    
    public String getdetails()
    {
    	return this.details;
    }
    
   
    public String toString()
    {
    	return note_id+" "+user_id+" "+book_id+" "+event+" "+sdate+" "+edate+" "+rdate+" "+details;
    }
    
	public static void main(String[] Args)
    {
    	
    }
}
