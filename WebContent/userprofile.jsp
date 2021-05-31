<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
        <%@ page import="basicclass.User" %>  
        <%@ page import="notifier.dao.UserProfileDao" %>
         <%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>

<link rel="shortcut icon" href="assests/img/Notifier_logo.png" type="image/x-icon">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="global.css"type="text/css"/>
    <link rel="stylesheet" href="node_modules/font-awesome/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="node_modules/bootstrap-social/bootstrap-social.css"type="text/css" />
     <link rel="stylesheet" href="node_modules/bootstrap-icons/font/bootstrap-icons.css" type="text/css" />

<h1>User Profile</h1>
</head>
<body>


<%
          if(session.getAttribute("user_id")==null)
          {
	         response.sendRedirect("login.jsp");
          }
           else
          {
	         out.print("");
	      }
     %>
     
      <nav class="navbar navbar-dark navbar-expand-sm fixed-top">
          <div class="container">
          
           <a class="navbar-brand" href="">
            <img src="assests/img/Notifier_logo.png" alt="" width="80" height="45">
           </a>
           
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            
           <div class="collapse navbar-collapse" id="Navbar">
           
           <ul class="navbar-nav ml-auto">
           
                    <li class="nav-item active"><a class="btn btn-dark" href="home.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li>
                    
                    
                    <li class="nav-item">
								
	                <a  href="userprofile.jsp" type="button" class="btn btn-dark"  >
								User profile
					
					</a></li>
					
					<li class="nav-item">
					 <span class="badge badge-light"></span>
                    			
	                <a href="reminder.jsp"  role="button" class="btn btn-dark" >
					Reminder
					</a></li>
					
					<li class="nav-item"><form action="LogoutServlet" method="post">
                  
                   
                    <input type="submit" role="button" class="btn btn-danger"  value="Logout">

                    </form></li>
                    
            </ul> 
            </div>    
          </div>

     </nav>
     
    
    
     
      <ol class="col-12 breadcrumb">
               <li class="breadcrumb-item "><a href="home.jsp">Home</a></li>
                   <li class="breadcrumb-item active"><a href="userprofile.jsp">User Profile</a></li>

                
     </ol>
          
     <h3>Here is your profile</h3>
     					         <%
					         
					         int user_id=(int) session.getAttribute("user_id");
					         try {
									UserProfileDao dao=new UserProfileDao();
									User user=dao.profile(user_id);
								
									request.setAttribute("user", user);

								} catch (ClassNotFoundException e) {
									
									e.printStackTrace();
								} catch (SQLException e) {
									
									
									e.printStackTrace();
								}
					         %> 
          
            <%User user = (User)request.getAttribute("user"); %>
             <div class="c1">
        
              User Name :<%=user.getUName()%><br>
              First Name:<%=user.getFName()%><br>
              Last Name:<%=user.getLName()%><br>
              Mail:  <%=user.getMail()%> <br>
              
              Mobile:   <%=user.getMobile()%> <br>
               <a href="editprofile.jsp" type="button" class="btn btn-primary">
               Edit
                    </a>
              </div>
              
           </div>
     
     
  
   <!-- <form action="editprofile.jsp" method="post">
  
     
             
        
            User Name :<%=user.getUName()%><br>
            First Name:<%=user.getFName()%><br>
            Last Name:<%=user.getLName()%><br>
            Mail:  <%=user.getMail()%> <br>
              
             Mobile:   <%=user.getMobile()%> <br>
               
         <b><input type="submit" value="Edit"></b>
                 
      </form> --> 
           
       
     
     
</head>
</body>
</html>