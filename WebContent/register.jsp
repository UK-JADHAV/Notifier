<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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
          
           <a class="navbar-brand" href="login.jsp"> 
           <img src="assests/img/Notifier_logo.png" alt="" width="80" height="45">
           </a>
           
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            
           <div class="collapse navbar-collapse" id="Navbar">
           
            </div>    
          </div>

     </nav>



    <div class="container-fluid ">
      <div class="row">
     <div class="col-md-3 col-sm-4 col-xs-12"></div>
        <div class="col-md-6 col-sm-4 col-xs-12">

			
			
			
			      <form action="RegisterServlet"  class="form-container" method="post">
			      
			          <h3>Sign Up Page </h3>
					        <div class="form-group row">
					                 <label for="Uname" class="col-md-4 col-form-label"> User Name:</label>
								              <div class="col-md-6">
								                 <input type="text" class="form-control" id="Uname"  name="uname" placeholder="User Name" required>
								               </div>
							</div>
							
							<div class="form-group row">
					                 <label for="Fname" class="col-md-4 col-form-label">First Name:</label>
								              <div class="col-md-6">
								                 <input type="text" class="form-control" id="Fname"  name="fname" placeholder="First Name" required>
								               </div>
							</div>
							
							<div class="form-group row">
					                 <label for="Lname" class="col-md-4 col-form-label"> Last Name:</label>
								              <div class="col-md-6">
								                 <input type="text" class="form-control" id="Lname"  name="lname" placeholder="Last Name" required>
								               </div>
							</div>
							
							<div class="form-group row">
					                 <label for="Pass" class="col-md-4 col-form-label"> Password:</label>
								              <div class="col-md-6">
								                 <input type="password" class="form-control" id="Pass"  name="pass" placeholder="Password" required>
								               </div>
							</div>
								
							<div class="form-group row">
					                 <label for="Mail" class="col-md-4 col-form-label">Email:</label>
								              <div class="col-md-6">
								                 <input type="email" class="form-control" id="Mail"  name="mail" placeholder="Email" required>
								               </div>
							</div>		
									
							<div class="form-group row">
					                 <label for="Mobile" class="col-md-4 col-form-label"> Mobile Number:</label>
								              <div class="col-md-6">
								                 <input type="number" class="form-control" id="Mail"  name="mobile" placeholder="Mobile Number" required>
								               </div>
							</div>			
									
									 
									<button class="btn btn-primary" type="submit">Sign Up</button>
									
									<div class="form-group row">
									if you already have account then Log In...
					               <a href="login.jsp" role="button" class="btn btn-primary" >Log In</a>
					               </div>
			      </form>
			      
			      </div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</div>
			 
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       

</body>
</html>