<%-- 
Nicholas Hall, Timothy Wolf, Donya Moxley, Jason Fleurival, Benjamin Ard
CIST2931
Team 3
ChattChiro - Chiropractors
--%>

<%-- 
    Document   : patientregistration
    Created on : Oct 11, 2020, 7:42:20 PM
    Author     : donyamoxley
--%>

<%-- 
Defines ContentType for servlet container to run and pageEncoding to read the jsp from file system.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
<%-- 
Body of HTML Containing textboxes for user to enter information to register as a patient.
div - Used as a container for elements in code.
nav - Section of pages used to provide navigation links in code.
id - HTML attribute used to give a unique id for element.
class - Specifies classname for element.
label - labels corresponding with text input from user, paired with input textbox.
input - Specifies input field for user to enter data (Textbox).
form action - On button submition will send form data to the specified servlet.
button - Defines a clickable button for user to click and submit data.
--%>
    <body >
        <div id="" class='container-fluid'>
            <div class='row'>
                <nav class="navbar navbar-light  col-12" style="background-color:rgba(12, 11, 95, 0.5);">
                    <a class="navbar-brand">ChattChiro</a>
                 </nav>
            </div> 
            <div class='row' style="min-height: 50vh;" >
                <div class='col-6'></div>
                <div class='col-6'>
                    <form action="../PatientRegistrationServlet" method='post' class='card  border-0 bg-transparent'>
                        <div class='card-body my-5'>
                            <div class="form-group">
                              <label for="customerId">Customer ID</label>
                              <input name='customerId' type="text" class="form-control" id="customerId" aria-describedby="customerId">
                            </div>
                            <div class="form-group">
                              <label for="password">Password</label>
                              <input type="password" name="password" class="form-control" id="">
                            </div>
                            <div class="form-group">
                              <label for="firstName">First Name</label>
                              <input type="text" name="firstName" class="form-control" id="">
                            </div>
                            <div class="form-group">
                              <label for="lastName">Last Name</label>
                              <input type="text" name="lastName" class="form-control" id="">
                            </div>
                            <div class="form-group">
                              <label for="email">Email</label>
                              <input type="email" name="email" class="form-control" id="">
                            </div>
                            <div class="form-group">
                              <label for="address">Address</label>
                              <input type="text" name="address" class="form-control" id="">
                            </div>
                            <div class="form-group">
                              <label for="insurance">Insurance</label>
                              <input type="text" name="insCo" class="form-control" id="">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
            
            
        </div>
<%-- Script points to external script file through src attribute to URL --%>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
