<%-- 
Nicholas Hall, Timothy Wolf, Donya Moxley, Jason Fleurival, Benjamin Ard
CIST2931
Team 3
ChattChiro - Chiropractors
--%>

<%-- 
    Document   : updatepatient
    Created on : Nov 8, 2020, 4:05:55 PM
    Author     : donyamoxley
--%>

<%-- 
Defines ContentType for servlet container to run and pageEncoding to read the jsp from file system.
Imports class using import tag.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.Patient"%> 
<%-- 
Code Uses Scriplets to define data for tables.
Using getAttribute method to retrieve Patient data.
--%>
 <% 
            Patient p1;
            p1 = (Patient)session.getAttribute("p1");
           
%>
<!DOCTYPE html>
<html>
 <%-- 
Heading of HTML Containing Properties of Web Page
charset - Declares the document's character encoding through meta tag.
name/content - Displays document based on device through meta tag.
link (rel/href) - Links to external Stylesheet through both external link and style.css.
integrity - attribute that allows browser to check defined file source to ensure code is not loaded if incorrect.
--%>
     <head>
        <title>ChattChiro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../style.css">
        <script src="https://kit.fontawesome.com/3bead4d2e9.js" crossorigin="anonymous"></script>
    </head>
    <body>
 <%-- 
Body of HTML Containing textboxes for user patient information and updating patient information.
div - Used as a container for elements in code.
nav - Section of pages used to provide navigation links in code.
id - HTML attribute used to give a unique id for element.
class - Specifies classname for element.
label - labels corresponding with text input from user, paired with input textbox.
input - Specifies input field for user to enter data (Textbox).
form action - On button submition will send form data to the specified servlet.
button - Defines a clickable button for user to click and submit data.
--%>
        <div class='row '>
          <nav class="navbar navbar-light bg-light col-12 shadow  py-0">
              <a href="index.html" class="navbar-brand">ChattChiro</a>
              <button class="btn btn-info" >Login Out</button>
          </nav>
        </div>
        <div class="row justify-content-center mt-5" style="background-image: linear-gradient(to bottom right, blue, green);">
          <div class="col-1 bg-white py-2">
            <a class="nav-link active" href="index.html">HOME</a>
          </div>
          <div class="col-1 py-2">
            <a class="nav-link text-light" href="about.html">ABOUT</a>
          </div>
          <div class="col-1 py-2">
            <a class="nav-link text-light" href="services.html">SERVICE</a>
          </div>
          <div class="col-1 py-2">
            <a class="nav-link text-light" href="doctors.html">DOCTORS</a>
          </div>
          <div class="col-1 py-2">
            <a class="nav-link text-light" href="pricing.html">PRICING</a>
          </div>
          <div class="col-1 py-2">
            <a class="nav-link text-light" href="faq.html">FAQ</a>
          </div>
          <div class="col-1 py-2">
            <a class="nav-link text-light" href="contact.html">CONTACT</a>
          </div>
        </div>
        <div class='row'>
          <div class='col-6 p-5'>
            <form action="../PatientUpdateServlet" class="card " method='post'> 
                    <div class="card-header">
                      Profile Update
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                           <input name='customerId' type="hidden" class="form-control" id="customerId" value="<%=p1.getID()%>">
                        </div> 
                        <div class="form-group">
                          <label for="password">Password</label>
                          <input type="text" name="password" class="form-control" value="<%=p1.getPwd()%>">
                        </div>
                        <div class="form-group">
                          <label for="firstName">First Name</label>
                          <input type="text" name="firstName" class="form-control" value="<%=p1.getFirstName()%>">
                        </div>
                        <div class="form-group">
                          <label for="lastName">Last Name</label>
                          <input type="text" name="lastName" class="form-control" value="<%=p1.getLastName()%>">
                        </div>
                        <div class="form-group">
                          <label for="email">Email</label>
                          <input type="email" name="email" class="form-control" value="<%=p1.getEmail()%>">
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>       
            </form>
          </div>
          <div class='col-6'>
            <img src="../images/update_image.png" alt="">
          </div>
        </div>    
    </body>
</html>
