<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="basicclass.notebook" %>    
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<title>Previous books</title>
<link rel="shortcut icon" href="assests/img/Notifier_logo.png" type="image/x-icon">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="global.css"type="text/css"/>
    <link rel="stylesheet" href="node_modules/font-awesome/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="node_modules/bootstrap-social/bootstrap-social.css"type="text/css" />
     <link rel="stylesheet" href="node_modules/bootstrap-icons/font/bootstrap-icons.css" type="text/css" />
 
<title>Book Names</title>
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
                <li class="breadcrumb-item active"><a  href="PreviousNoteBooksServlet" >Previous Note Books</a></li>
                
             
     </ol>
    
    
<table class="table table-hover table-dark"  width="500" align="center"> 
         <tr > 
          <th  scope="col"><b>Book Name</b></th> 
           
          <th  scope="col"><b>open</b></th> 
          
         
         </tr> 
          <%-- Fetching the attributes of the request object 
             which was previously set by the servlet  
              "PreviousNotesServlet.java" 
        --%>  
         <%ArrayList<notebook> books =  
            (ArrayList<notebook>)request.getAttribute("list"); 
         if(books.isEmpty())
        	 
         {%> 
        	 <h1>You haven't created any Note Book yet!!!!</h1>
        	 
        	 <h2> Create  your first note</h2>
        	 
        	 <form action="createnotebook.jsp" method="post">

                <input type="submit" value="Create Note Book">

             </form>
        	 
        	 
         <% }else{
         for(notebook book:books){%> 
     
        
        <%-- Arranging data in tabular form 
            --%> 
           <!--  <form action="editnotes.jsp" method="post">--> 
         <tr > 
                <td><%=book.getBook_name()%></td> 
                <td> <a  class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="previousnotes.jsp?book_id=<%=book.getBook_id()%>">Open</a>   </td> 
                <%session.setAttribute("book_id", book.getBook_id()); %>         
            </tr> 
           <!--  </form>--> 
             <%}
         }%> 
       </table>  
       
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       

</body>
</html>


