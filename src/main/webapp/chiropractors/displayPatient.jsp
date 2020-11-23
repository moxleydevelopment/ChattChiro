  
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
<%@page import="Business.Patient,Business.Doctor,java.util.List,Business.Appointment,Business.Patient,java.time.LocalDate,java.time.format.DateTimeFormatter"%> 
<%-- 
Code Uses Scriplets to define data for tables.
Using getAttribute method to retrieve Doctor data.
--%>
<% 
            List<Appointment> appointmentList = (List<Appointment>)session.getAttribute("appointments");
            Patient p1 = (Patient)session.getAttribute("p1");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE, MMMM d");
           
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
                <nav class="navbar navbar-light bg-light col-12 shadow  py-2">
                    <a href="index.html" class="navbar-brand">ChattChiro</a>
                    <ul class="nav navbar-right">
                        <li class="nav-item"><a href="register.html" class="btn btn-info">Register</a></li>
                        <li class="nav-item ml-2"><a href="login.html" class="btn btn-info">Login</a></li>
                    </ul>
                </nav>
            </div> 
            <div class="row bg-white mt-4 ">
                <div class="col-4 text-center">
                    <a href="index.html"><img src="images/home_logo.png" class="img-fluid" alt="Responsive image"></a>
                </div>
                <div class="col-4 ">
                    <div class="row no-gutters align-items-center" style="min-height:150px;">
                        <div class="col-md-2 text-info">
                           <i class="fas fa-phone-alt fa-3x"></i>
                        </div>
                        <div class="col-md-8">
                            <p class="mb-0"><span class="text-info">Free Call</span> +1 234 456 78910</p>
                            <p class=""><small class="text-muted">Call Us Now 24/7 Customer Support</small></p>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="row no-gutters align-items-center" style="min-height:150px;">
                        <div class="col-md-2 text-info">
                           <i class="fas fa-clinic-medical fa-3x"></i>
                        </div>
                        <div class="col-md-8">
                             <p class="mb-0">Our Location</p>
                             <p class=""><small class="text-muted">198 Enz Street, Marietta GA 30060</small></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center" style="background-image: linear-gradient(to bottom right, blue, green);">
                <div class="col-1 py-2">
                  <a class="nav-link text-light" href="index.html">HOME</a>
                </div>
                <div class="col-1 py-2">
                  <a class="nav-link text-light" href="about.html">ABOUT</a>
                </div>
                <div class="col-1 py-2">
                  <a class="nav-link text-light" href="services.html">SERVICES</a>
                </div>
                <div class="col-1 py-2">
                  <a class="nav-link text-light" href="doctors.html">DOCTORS</a>
                </div>
                <div class="col-1 py-2">
                  <a class="nav-link text-light" href="faq.html">FAQ</a>
                </div>
                <div class="col-1 py-2">
                  <a class="nav-link text-light" href="contact.html">CONTACT</a>
                </div>
            </div>
            <div class='row align-items-center justify-content-center'>
                <div class="col-8 mt-4">
                    <form class='card'>
                        <div class="card-header">
                            <h1 class="text-center my-0 font-weight-normal">Recent/Upcoming Appointments for <%= p1.getFullName() %>:</h1>
                        </div>
                        <div class='card-body'>
                            <table class="table">
                                <tr>
                                    <th class="borderless">Doctor</th>
                                    <th class="borderless">Procedure</th>
                                    <th class="borderless">Time</th>
                                    <th class="borderless">Date</th>
                                </tr>
                                <% for(Appointment entry : appointmentList){
                                    Doctor d1 = new Doctor();
                                    d1.selectDB(entry.getDoctor()); %>
                                <tr>
                                    <td><%= d1.getFullName() %></td>
                                    <td><%= entry.getProcedure() %></td>
                                    <td><%= entry.getFormattedTimeslot() %></td>
                                    <td><%= entry.getDate() %></td>
                                </tr>
                                <% } %>
                                
                            </table>
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
