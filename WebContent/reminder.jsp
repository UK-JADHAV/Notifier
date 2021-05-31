<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="notifier.dao.ReminderDao" %>
<%@ page import="notifier.dao.UserProfileDao" %> 
  
<%@ page import="basicclass.User" %> 
<%@ page import="basicclass.notes" %> 
<%@ page import="java.sql.SQLException" %> 
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
  
<!DOCTYPE html>
<html>
<head>
<title>Reminder</title>
<link rel="shortcut icon" href="assests/img/Notifier_logo.png" type="image/x-icon">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
           
                    <li class="nav-item active"><a class="btn btn-dark" href="home.jsp" role="button" ><span class="fa fa-home fa-lg"></span> Home</a></li>
                    
                    
                    <li class="nav-item">
								
	                <a  href="userprofile.jsp" type="button" class="btn btn-dark"  >
								User profile
					
					</a></li>
                    
                    <li class="nav-item">
								
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
                <li class="breadcrumb-item "><a href="home.jsp">Home</a></li>
                <li class="breadcrumb-item active"><a href="reminder.jsp">Reminder</a></li>
     </ol>
         
<h3>Todays Events...</h3>         
<table class="table table-hover table-dark"  width="500" align="center"> 
										         <tr> 
										          <th scope="col"><b>Event</b></th> 
										          <th scope="col"><b>Start Date</b></th> 
										          <th scope="col"><b>End Date</b></th> 
										          <th scope="col"><b>Reminder date</b></th> 
										          <th scope="col"><b>Details</b></th> 
										     
										      
										         </tr> 
										         

<%
							         int user_id=(int) session.getAttribute("user_id");
							         try {
											ReminderDao dao=new ReminderDao();
											ArrayList<notes> notifications=new ArrayList<notes>();
											notifications=dao.reminder(user_id);
											
											if(notifications==null)
											{
												%><h3>No Event for today</h3><%
											}
											else{
												
												for(notes note:notifications){%> 
										     
										        
										        <%-- Arranging data in tabular form 
										            --%> 
										           <!--  <form action="editnotes.jsp" method="post">--> 
										         <tr> 
										                <td><%=note.getEvent()%></td> 
										                <td><%=note.getsdate()%></td> 
										                <td><%=note.getedate()%></td> 
										                <td><%=note.getrdate()%></td> 
										                <td><%=note.getdetails()%></td> 
										                <% session.setAttribute("note",note); %>
										                      
										            </tr> 
										           <!--  </form>--> 
										             <%}
										        
											
											}
											
										} catch (ClassNotFoundException e) {
											
											e.printStackTrace();
										} catch (SQLException e) {
											
											
											e.printStackTrace();
										}
							         
							         %>
							    </table>       
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       
   					         
</body>
</html>

     