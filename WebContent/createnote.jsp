<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Note</title>

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
					
					</a>
					
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
     int book_id=(int)session.getAttribute("book_id");
      %>
     <ol class="col-12 breadcrumb">
               <li class="breadcrumb-item "><a href="home.jsp">Home</a></li>
                  <li class="breadcrumb-item "><a href="PreviousNoteBooksServlet">Previous Note Books</a></li>
                <li class="breadcrumb-item "><a href="previousnotes.jsp?book_id=<%=book_id%>">Previous Notes</a></li>
                <li class="breadcrumb-item active"><a href="createnote.jsp">Create New Note</a></li>
                
                
     </ol>

			<form action="CreateNoteServlet"method="post">
			        
			        <div class="form-group row">
		                 <label for="Ename" class="col-md-2 col-form-label">  Event Name :</label>
					              <div class="col-md-6">
					                 <input type="text" class="form-control" id="Ename"  name="event" placeholder="Event Name"  required>
					               </div>
		             </div>
		             
		             
				     <div class="form-group row">
		                 <label for="Sdate" class="col-md-2 col-form-label"> Event Start Date:</label>
					              <div class="col-md-6">
					                 <input type="date" class="form-control" id="Sdate"  name="sdate" placeholder="YYYY-MM-DD" required>
					               </div>
		             </div>
		             
					 <div class="form-group row">
		                 <label for="Edate" class="col-md-2 col-form-label"> Event End Date:</label>
					              <div class="col-md-6">
					                 <input type="date" class="form-control" id="Edate"  name="edate" placeholder="YYYY-MM-DD" required>
					               </div>
		             </div>
		             
					 <div class="form-group row">
		                 <label for="Rdate" class="col-md-2 col-form-label"> Event Reminder Date:</label>
					              <div class="col-md-6">
					                 <input type="date" class="form-control" id="Rdate"  name="rdate" placeholder="YYYY-MM-DD" required>
					               </div>
		             </div>
		             
					 <div class="form-group row">
		                 <label for="Detail" class="col-md-2 col-form-label"> Details:</label>
					              <div class="col-md-6">
					                 <textarea class="form-control" id="Detail"  name="details" rows="10" cols="25" placeholder="Details" ></textarea>
					               </div>
		              </div>			
					
					
			<input type="submit" role="button" class="btn btn-primary" value="create note">
			</form>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       
</body>
</html>