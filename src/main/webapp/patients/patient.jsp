<%-- 
Nicholas Hall, Timothy Wolf, Donya Moxley, Jason Fleurival, Benjamin Ard
CIST2931
Team 3
ChattChiro - Chiropractors
--%>

<%-- 
    Document   : patient
    Created on : Oct 11, 2020, 5:49:24 PM
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
            p1.getAppointments();

           
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
        <script src="https://kit.fontawesome.com/3bead4d2e9.js" crossorigin="anonymous"></script>
    </head>
<%-- 
Body of HTML Containing all the content pulled from database based on earlier log in.
Displays Patients FirstName from database using the login.
div - Used as a container for elements in code.
nav - Section of pages used to provide navigation links in code.
id - HTML attribute used to give a unique id for element.
class - Specifies classname for element.
--%>
    <body >
        <div id="index_container" class='container-fluid'>
        <div class='row '>
            <nav class="navbar navbar-light bg-light col-12 shadow py-2">
                <a href="index.html" class="navbar-brand">ChattChiro</a>
                <button class="btn btn-info" >Logout</button>
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
        <div class="row mt-5">
            <div class="col-auto text-center">
                <img src="<%=p1.getInitials()%>" alt="profile initials">
            </div>
            <div class="col-6">
                <div class="col-12"><h class='h1'>Hello <%=p1.getFirstName()%> <%=p1.getLastName()%> </h></div>
                <div class="col-6"><h class='h6'>Customer ID: <%=p1.getID()%></h></div>
                <div class="col-6"><h class='h6'>Password: <%=p1.getPwd()%></h></div>
                <div class="col-12"><h class='h6'>Email: <%=p1.getEmail()%></h></div> 
            </div>
            <div class="col-auto">
                <a href="./patients/updatepatient.jsp"  class="btn btn-info">Update Profile</a>
                <a href="./patients/bookappointment.jsp" class="btn btn-info">Book Appointments</a>
                <a href="" class="btn btn-info">View History</a>
            </div>
        </div>
        <div class="row row-cols-4 my-2">
            <div class="col">Column</div>
            <div class="col">Column</div>
            <div class="col">Column</div>
            <div class="col">Column</div>
        </div>       
        <table class="table">
          <thead class="thead-light">
            <tr>
              <th scope="col">Doctor</th>
              <th scope="col">Date</th>
              <th scope="col">Time</th>
              <th scope="col">Procedure</th>
            </tr>
          </thead>
          <tbody>
            <%for (int count = 0; count < p1.appointmentList.size(); count++){ %>
              <tr>
                <th scope="row"><%=p1.appointmentList.get(count).getDoctor()%></th>
                <td><%=p1.appointmentList.get(count).getDate()%></td>
                <td><%=p1.appointmentList.get(count).getFormattedTimeslot()%></td>
                <td><%=p1.appointmentList.get(count).getProcedure()%></td>
              </tr>
           <%}%>

          </tbody>
        </table>    
    </div>
        
<%-- Script points to external script file through src attribute to URL --%>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
