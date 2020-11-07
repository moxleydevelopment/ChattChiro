  
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
                <nav class="navbar navbar-light  col-12" style="background-color:rgba(12, 11, 95, 0.5);">
                    <a class="navbar-brand">ChattChiro</a>
                 </nav>
            </div> 
            <br>
            <div class='row align-items-center justify-content-center'>
                <div class="col-8" style="background-color:rgba(12, 11, 95, 0.8); border-radius: 15px 30px;">
                    <form action="UpdateDoctorServlet" method='post' class='card  border-0 bg-transparent text-white'>
                        <div class='card-body my-5'>
                            <h1>Recent/Upcoming Appointments for <%= p1.getFullName() %>:</h1>
                            <table class="table" style="background: #ddd">
                                <tr>
                                    <th>Doctor</th>
                                    <th>Procedure</th>
                                    <th>Time</th>
                                    <th>Date</th>
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
