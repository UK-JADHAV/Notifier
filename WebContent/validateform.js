 function validateHTMlform()
{ 
  let form = document.StudenSignupForm;
   
   if( form.lastnames.value == "" )
   {
     alert( "Enter Your Last Name!" );
     form.textnames.focus() ;
     return;
   }
  
  
   
   if( form.personaladdress.value == "" )
   {
     alert( "Enter Your Personal Address!" );
     form.personaladdress.focus() ;
     return;
   }
   if ( ( StudenSignupForm.sex[0].checked == false ) && ( StudenSignupForm.sex[1].checked == false ) )
   {
   alert ( "Choose Your Gender: Male or Female" );
   return false;
   }   
   
  
 var email = form.emailid.value;
  atpos = email.indexOf("@");
  dotpos = email.lastIndexOf(".");
 if (email == "" || atpos < 1 || ( dotpos - atpos < 2 )) 
 {
     alert("Enter your correct email ID")
     form.emailid.focus() ;
     return;
 }
  if( form.dob.value == "" )
   {
     alert( "Enter your DOB!" );
     form.dob.focus() ;
     return;
   }
  if( form.mobileno.value == "" ||
           isNaN( form.mobileno.value) ||
           form.mobileno.value.length != 10 )
   {
     alert( "Enter your Mobile No. in the format 123." );
     form.mobileno.focus() ;
     return;
   }
   return( true );
}