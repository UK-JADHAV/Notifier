<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="notifier.dao.UserProfileDao" %> 
  <%@ page import="notifier.dao.ReminderDao" %> 
  <%@ page import="notifier.dao.NotesDao" %>
  <%@ page import="basicclass.User" %> 
  <%@ page import="basicclass.notes" %> 
  <%@ page import="java.sql.SQLException" %> 
  <%@ page import="java.util.*" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
  
  
   
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>home</title>

<link rel="shortcut icon" href="assests/img/Notifier_logo.png" type="image/x-icon">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="global.css"type="text/css"/>
    <link rel="stylesheet" href="node_modules/font-awesome/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="node_modules/bootstrap-social/bootstrap-social.css"type="text/css" />
     <link rel="stylesheet" href="node_modules/bootstrap-icons/font/bootstrap-icons.css" type="text/css" />
 
    
    
</head>

<body>
   <%
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
   %>
   <% 
   int user_id=(int) session.getAttribute("user_id");
   int len=0;
   try {
		ReminderDao dao=new ReminderDao();
		ArrayList<notes> notifications=new ArrayList<notes>();
		notifications=dao.reminder(user_id);
		len=notifications.size();
		
		ArrayList<notes> expired=new ArrayList<notes>();
		expired=dao.expired(user_id);
		
		NotesDao  dao1=new NotesDao();
		
		
		
		 for(notes note:expired)
		 {
			 dao1.deletenote(note.getNoteId());
		 }
		
		
		
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	} catch (SQLException e) {
		
		
		e.printStackTrace();
	}

   %>
        
					     
      <nav class="navbar navbar-dark navbar-expand-sm  fixed-top">
          <div class="container">
          
           <a class="navbar-brand" href="">
            <img src="assests/img/Notifier_logo.png" alt="" width="80" height="45">
           </a>
           
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            
           <div class="collapse navbar-collapse" id="Navbar">
           
           <ul class="navbar-nav ml-auto">
           
                    <li class="nav-item active"><a  href="home.jsp" role="button" class="btn btn-dark"><span class="fa fa-home fa-lg"></span> Home</a></li>
                    
                    <li class="nav-item "> <button  type="button" class="btn btn-dark" data-toggle="modal" data-target="#UserProfile" >
					User profile
					</button></li>
                    
                    <li class="nav-item">
					 <span class="badge badge-light"><%=len%></span>
                     </span>			
	                <button  type="button" class="btn btn-dark" data-toggle="modal" data-target="#Reminder" >
					Reminder
					</button></li>
					
					<li class="nav-item"><form action="LogoutServlet" method="post">

                    <input type="submit" role="button" class="btn btn-danger"  value="Logout">

                    </form></li>
                    
            </ul> 
            </div>    
          </div>

     </nav>
     
     <ol class="col-12 breadcrumb">
                <li class="breadcrumb-item active"><a href="home.jsp">Home</a></li>
     </ol>
         
         <h3>Welcome ${uname} !</h3>
         
         <%if(len > 0) {%>
         <div class="alert alert-danger" role="alert">
            YOU HAVE <%=len%> NOTIFICATION..CHECK OUT!!!
        
        <button type="button" class="close" data-dismiss="alert"  aria-label="Close">
           <span aria-hidden="true">&times;</span>
           </button>
           </div>
         <% }%>
         
             				      
			<!-- *******User Profile******* -->		         
<div class="modal" id="UserProfile" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
      
         <div class="modal-header">
         <h5 class="modal-title">User Profile</h5>
           <button type="button" class="close" data-dismiss="modal"  aria-label="Close">
           <span aria-hidden="true">&times;</span>
           </button>
           </div>
           
           <div class="modal-body">
           
					     
             <%
             if(session.getAttribute("user_id")==null)
             {
                response.sendRedirect("login.jsp");
             }
             else{
							         
							         try {
											UserProfileDao dao=new UserProfileDao();
											User user=dao.profile(user_id);
										
											request.setAttribute("user", user);
											
											out.println("User Id:"+user.getUserId());
											%><br><% 
											out.println("User Name:"+user.getUName());
											%><br><%
											out.println("First Name:"+user.getFName());
											%><br><%
											out.println("Last Name:"+user.getLName());
											%><br><%
											out.println("Mail:"+user.getMail());
											%><br><%
											out.println("Mobile:"+user.getMobile());
											%><br><%
									


										} catch (ClassNotFoundException e) {
											
											e.printStackTrace();
										} catch (SQLException e) {
											
											
											e.printStackTrace();
										}
							        
		          
							         
		              
             }
					     %>
					
        
             
           </div>
           
            <div class="modal-footer">
                <a href="editprofile.jsp" type="button" class="btn btn-primary"> Edit</a>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              
            </div>
        
         
         
      </div>
    </div>
</div>		

                                  <!-- ******Notification****** -->


<div class="modal" id="Reminder" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
      
         <div class="modal-header">
         <h5 class="modal-title">Today's Events </h5>
           <button type="button" class="close" data-dismiss="modal"  aria-label="Close">
           <span aria-hidden="true">&times;</span>
           </button>
           </div>
           
           <div class="modal-body">
           
			     
             <%        
							         try {
											ReminderDao dao=new ReminderDao();
											ArrayList<notes> notifications=new ArrayList<notes>();
											notifications=dao.reminder(user_id);
											
											if(notifications==null)
											{
												 out.println("No Events for today");
											}
											else{
											for(notes note:notifications){
												
												%>
												<div><% 
												 out.println("Event:"+ note.getEvent());
												%>
												
												</div>
												
												<%
												
											}
											
											}
											
										} catch (ClassNotFoundException e) {
											
											e.printStackTrace();
										} catch (SQLException e) {
											
											
											e.printStackTrace();
										}
							         
							        
             
					     %>
					
        
             
           </div>
           
            <div class="modal-footer">
               <a href="reminder.jsp" role="button" class="btn btn-primary">Show</a>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              
            </div>
        
         
         
      </div>
    </div>
</div>					         
			         

        
            
            

 <section id="services" class="services">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
         
        </div>
			<div class="row justify-content-center" >
			   <form action="PreviousNoteBooksServlet" method="get">
			   
			          <div class="col-12 col-sm-6  center d-flex align-items-stretch"  data-aos="zoom-in" data-aos-delay="100">
			            <div class="icon-box">
			              <div class="icon"><span class="fa fa-list fa-lg"></span></div>
			              <input type="submit" role="button" class="btn btn-dark" value="Previous Notes Books">
			              <h3>Your Previous Notes...</h3>
			            </div>
			          </div>
			          
			    </form>      
			
		
		
		
			   <form action="createnotebook.jsp" method="post">
			   
			          <div class="col-12 col-sm-6 center d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
			            <div class="icon-box">
			              <div class="icon"><span class="fa fa-list fa-lg"></span></div>
			              <input type="submit" role="button" class="btn btn-dark" value="Create Note Book">
			              <h3>Create New Note</h3>
			            </div>
			          </div>
			          
			    </form>      
			</div>
		</div>	
		
</section>			          
			          



 

       
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       
   


</body>
</html>