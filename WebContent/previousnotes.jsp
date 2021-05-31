<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="basicclass.notes" %> 
<%@ page import="notifier.dao.PreviousDao" %>     
<%@ page import="java.util.ArrayList" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Previous Notes</title>
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
     <%
          int user_id=(int) session.getAttribute("user_id");
    
        int book_id=Integer.parseInt(request.getParameter("book_id"));
        session.setAttribute("book_id", book_id);
     %>
     <ol class="col-12 breadcrumb">
                <li class="breadcrumb-item "><a href="home.jsp">Home</a></li>
                  <li class="breadcrumb-item active"><a href="PreviousNoteBooksServlet">Previous Note Books</a></li>
                <li class="breadcrumb-item active"><a href="previousnotes.jsp?book_id=<%=book_id%>">Previous Notes</a></li>

                
     </ol>
 

<h1>Previous notes</h1>


<%

          if(session.getAttribute("user_id")==null)
          {
	         response.sendRedirect("login.jsp");
          }
           else
          {
	         out.print("Here are your previous notes");
	        
	      }
     %>
    
    
    
     <table class="table table-hover table-dark"  width="500" align="center"> 
         <tr> 
          <th scope="col"><b>Event</b></th> 
          <th scope="col"><b>Start Date</b></th> 
          <th scope="col"><b>End Date</b></th> 
          <th scope="col"><b>Reminder date</b></th> 
          <th scope="col"><b>Details</b></th> 
          <th scope="col">edit</th>
          <th scope="col">delete</th>
          
         </tr> 
          <%-- Fetching the attributes of the request object 
             which was previously set by the servlet  
              "PreviousNotesServlet.java" 
        --%>  
         <%
         PreviousDao dao=new  PreviousDao();
         
         ArrayList<notes> notes =  dao.previous(user_id, book_id);
          
         if(notes.isEmpty())
        	 
         {%> 
        	 <h1>You haven't created any note yet!!!!</h1>
        	 
        	 <h2> Create  your first note</h2>
        	
        	 
        	 
         <% }else{
         for(notes note:notes){%> 
     
        
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
               <td> <a class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="editnotes.jsp?note_id=<%=note.getNoteId()%>">edit</a>   </td> 
               <td> <a class="btn btn-danger btn-lg active" role="button" aria-pressed="true" href="deletenote.jsp?note_id=<%=note.getNoteId()%>">delete</a>   </td>          
            </tr> 
           <!--  </form>--> 
             <%}
         }%> 
       </table>  
       
      
         	 <form action="createnote.jsp"  method="post">

                <input type="submit" role="button" class="btn btn-primary" value="Create New Note">

             </form>
        
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       
</body>
</html>