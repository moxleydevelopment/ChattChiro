  
<%-- 
Nicholas Hall, Timothy Wolf, Donya Moxley, Jason Fleurival, Benjamin Ard
CIST2931
Team 3
ChattChiro - Chiropractors
--%>

<%-- 
    Document   : chiropractor
    Created on : Oct 19, 2020, 12:10:12 PM
    Author     : Tim Wolf
--%>

<%-- 
Defines ContentType for servlet container to run and pageEncoding to read the jsp from file system.
Imports class using import tag.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.Doctor"%> 
<%-- 
Code Uses Scriplets to define data for tables.
Using getAttribute method to retrieve Doctor data.
--%>
<% 
            Doctor d1;
            d1 = (Doctor)session.getAttribute("d1");
           
%>
<!DOCTYPE html>
<html>
<%-- 
Heading of HTML Containing Properties of Web Page
title - Title of the document.
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
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
<%-- 
Body of HTML Containing all the content pulled from database based on earlier log in.
div - Used as a container for elements in code.
nav - Section of pages used to provide navigation links in code.
id - HTML attribute used to give a unique id for element.
class - Specifies classname for element.
--%>
    <body >
        <div id="index_container" class='container-fluid'>
            <div class='row'>
                <nav class="navbar navbar-light  col-12" style="background-color:rgba(12, 11, 95, 0.5);">
                    <a class="navbar-brand">ChattChiro</a>
                 </nav>
            </div> 
           
            <h class='h1'>Hello Doctor <%=d1.getFirstName()%></h>

            <div class='row align-items-center justify-content-center'>
                <div class="col-4" style="background-color:rgba(12, 11, 95, 0.8); border-radius: 15px 30px;">
                    <form action="UpdateDoctorServlet" method='post' class='card  border-0 bg-transparent text-white'>
                    <div class='card-body my-5'>
                        <h2>Update My Info:</h2>
                        <div class="form-group">
                        <label for="chiroId">ID</label>
                        <input name='chiroId' type="text" class="form-control" id="chiroId" aria-describedby="chiroId" value="<%= d1.getID()%>" readonly>
                        </div>
                        <div class="form-group">
                        <label for="chiroPwd">Password</label>
                        <input name='chiroPwd' type="password" class="form-control" id="chiroPwd" aria-describedby="chiroPwd" value="<%= d1.getPwd()%>">
                        </div>
                        <div class="form-group">
                        <label for="chiroFName">First Name</label>
                        <input name='chiroFName' type="text" class="form-control" id="chiroFName" aria-describedby="chiroFName" value="<%= d1.getFirstName()%>">
                        </div>
                        <div class="form-group">
                        <label for="chiroLName">Last Name</label>
                        <input name='chiroLName' type="text" class="form-control" id="chiroLName" aria-describedby="chiroLName" value="<%= d1.getLastName()%>">
                        </div>
                        <div class="form-group">
                        <label for="chiroEmail">Email</label>
                        <input name='chiroEmail' type="text" class="form-control" id="chiroEmail" aria-describedby="chiroEmail" value="<%= d1.getEmail()%>">
                        </div>
                        <div class="form-group">
                        <label for="chiroOfficeNum">Office Number</label>
                        <input name='chiroOfficeNum' type="text" class="form-control" id="chiroOfficeNum"
                            aria-describedby="chiroOfficeNum"  value="<%= d1.getOfficeNum()%>">
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
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
