<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="basicclass.notes" %>  
    <%@ page import="notifier.dao.EditProfileDao" %>
    <%@ page import="notifier.dao.PreviousDao" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Notes</title>
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
          if(session.getAttribute("user_id")==null)
          {
	         response.sendRedirect("login.jsp");
          }
           else
          {
	         out.print("");
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
           
                    <li class="nav-item "><a class="btn btn-dark" href="home.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li>
                    
                    
                    <li class="nav-item" >
								
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
     
     <%
     int book_id=(Integer)session.getAttribute("book_id");
     
     int user_id=(int)session.getAttribute("user_id");
     
     
     int note_id=Integer.parseInt(request.getParameter("note_id"));
     session.setAttribute("note_id",note_id);
     request.setAttribute("note_id", note_id);
     
     PreviousDao dao= new PreviousDao();
     notes note =dao.previousnote(user_id,note_id);
     
      %>
     <ol class="col-12 breadcrumb">
               <li class="breadcrumb-item "><a href="home.jsp">Home</a></li>
                  <li class="breadcrumb-item "><a href="PreviousNoteBooksServlet">Previous Note Books</a></li>
                <li class="breadcrumb-item "><a href="previousnotes.jsp?book_id=<%=book_id%>">Previous Notes</a></li>
                <li class="breadcrumb-item active"><a href="editnotes.jsp?note_id=<%=note_id%>"><%=note.getEvent()%></a></li>
                
                
     </ol>
     
     
     
      <form action="EditNoteServlet" method="post">
   
          <div class="form-group row">
		                 <label for="Ename" class="col-md-2 col-form-label">  Event Name :</label>
					              <div class="col-md-6">
					                 <input type="text" class="form-control" id="Ename"  name="event" value="<%=note.getEvent()%>"  required>
					               </div>
		  </div>
		 
		 <div class="form-group row">
		                 <label for="Sdate" class="col-md-2 col-form-label"> Start Date:</label>
					              <div class="col-md-6">
					                 <input type="date" class="form-control" id="Sdate"  name="sdate" value="<%=note.getsdate()%>" required>
					               </div>
		 </div>
				
		 <div class="form-group row">
		                 <label for="Edate" class="col-md-2 col-form-label"> End Date:</label>
					              <div class="col-md-6">
					                 <input type="date" class="form-control" id="Edate"  name="edate" value="<%=note.getedate()%>" required>
					               </div>
		 </div>
				
		 <div class="form-group row">
		                 <label for="Rdate" class="col-md-2 col-form-label"> Reminder Date:</label>
					              <div class="col-md-6">
					                 <input type="date" class="form-control" id="Rdate"  name="rdate" value="<%=note.getrdate()%>" required>
					               </div>
		 </div>
				
		 <div class="form-group row">
		                 <label for="Detail" class="col-md-2 col-form-label"> Details:</label>
					              <div class="col-md-6">
					                 <textarea class="form-control" id="Detail"  name="details" rows="10" cols="25" ><%=note.getdetails()%></textarea>
					               </div>
		 </div>						
                 
         <b> <input type="submit" role="button" class="btn btn-primary" value="Save"> </b> 
         
         <a href="deletenote.jsp?note_id=<%=note_id%>" role="buuton" class="btn btn-danger">Delete <%=note.getEvent()%></a>
                 
      </form>
     
     
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       
   
</body>
</html>