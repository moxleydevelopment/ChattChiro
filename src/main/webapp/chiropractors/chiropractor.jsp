  
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
<%@page import="Business.Doctor,Business.Appointment,java.util.List,Business.Patient,java.time.LocalDate,java.time.format.DateTimeFormatter,java.util.Map"%> 
<%-- 
Code Uses Scriplets to define data for tables.
Using getAttribute method to retrieve Doctor data.
--%>
<% 
            Doctor d1;
            d1 = (Doctor)session.getAttribute("d1");
            Map<String, Patient> patientMap = d1.getPatients();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE, MMMM d");
            LocalDate today = LocalDate.now();
            LocalDate startDate;
            switch(today.getDayOfWeek()){
              case SATURDAY: startDate = today.plusDays(2);
              case SUNDAY: startDate = today.plusDays(1);
              default: startDate = today;
            }
           
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
            <div class='row '>
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

            <div class='row align-items-center justify-content-center mt-4'>
                <div class="col-4">
                    <form action="UpdateDoctorServlet" method='post' class='card'>
                    <div class="card-header">
                        <h2 class="text-center my-0 font-weight-normal">Update My Info:</h2>
                    </div>
                    <div class='card-body'>
                        
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

                <div class='row align-items-center justify-content-center mt-4'>
                <div class="col-4">
                    <form action="ViewApptsByDateServlet" method='post' class='card'>
                    <div class="card-header">
                        <h2 class="text-center my-0 font-weight-normal">View your appointments:</h2>
                    </div>
                    <div class='card-body'>
                        <div class="form-group">
                        <input type='hidden' name='doctID' id='doctID' value='<%= d1.getID() %>'>
                        <select name='date' class="form-control" id="date" aria-describedby="date">
                        <% 
                            int count = 0;
                            int x = 0;
                            while (count < 10){
                                if (startDate.plusDays(x).getDayOfWeek().toString() == "SATURDAY" || startDate.plusDays(x).getDayOfWeek().toString() == "SUNDAY"){
                                x += 1;
                                continue;
                                } else {
                                    List<Appointment> appointmentList = d1.getAppointments(startDate.plusDays(x).toString());
                        %>
                            <option value="<%= startDate.plusDays(x) %>"><%= startDate.plusDays(x).format(formatter) + " (" + appointmentList.size() + " appointments)" %></option>
                        <%
                                count += 1;
                                x += 1;
                                }
                            }
                        %>
                            
                        </select>
                        </div>
                        <button type="submit" class="btn btn-primary">View</button>
                    </div>
                    </form>
                </div>
            </div>

            <div class='row align-items-center justify-content-center mt-4 pb-4'>
                <div class="col-4">
                    <form action="ViewApptsByPatientServlet" method='post' class='card'>
                    <div class="card-header">
                        <h2 class="text-center my-0 font-weight-normal">Your patients:</h2>
                    </div>
                    <div class='card-body'>
                        <div class="form-group">
                        <select name='patientId' class="form-control" id="patientId" aria-describedby="patientId">
                            <% for(Map.Entry<String, Patient> entry : patientMap.entrySet()){ %>
                            <option value="<%= entry.getValue().getID() %>"><%= entry.getValue().getFullName() %></option>
                            <% } %>
                        </select>
                        </div>
                        <button type="submit" class="btn btn-primary">View Recent Appointments</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row py-4" style="background-color: rgb(245,245,245);">
                        <div class="px-3 pb-3 col-lg-6 mx-auto">
                            <h2 class="pb-3 display-4">Updating your Information</h2>
                            <ol>
                                <li>Make the appropriate changes to your profile on the page above (under the "Update My Info" heading). Note: the fields are pre-populated with your information, so you only need to fill in what you want to update.</li>
                                <li>Once you are satisfied with your updates, click the "Update" button.</li>
                            </ol>
                            <h2 class="py-3 display-4">View your Appointments</h2>
                            <ol>
                                <li>To view a list of your upcoming appointments, find the section header "View your appointments" on the page above.<li>
                                <li>Select the desired day from the dropdown menu.</li>
                                <li>Click "View" and you will be redirected to a page showing all of your appointments on that day.</li>
                            </ol>
                            <h2 class="py-3 display-4">View Patient List</h2>
                            <ol>
                                <li>To view a list of every patient you have ever had an appointment with, find the section header "Your patients" on the page above.<li>
                            </ol>
                            <h2 class="py-3 display-4">View A Patient's Recent Appointments</h2>
                            <ol>
                                <li>To view a list of a given patient's recent appointments, find the section header "Your patients" on the page above.<li>
                                <li>Select the desired patient from the list.</li>
                                <li>Click "View Recent Appointments" and you will be redirected to a page showing all of that patient's recent and upcoming appointments.</li>
                            </ol>
                            
                            
                        </div>
                     </div>
            
        </div>
<%-- Script points to external script file through src attribute to URL --%>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
