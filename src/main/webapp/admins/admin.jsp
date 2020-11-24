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
Imports more than one class using import tag.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.Admin,Business.Doctor,Business.DoctorFactory,Business.Availability,java.time.LocalDate,java.time.DayOfWeek,java.time.format.DateTimeFormatter,java.util.Map"%>
<%-- 
Code Uses Scriplets to define date for tables.
Using getAttribute method to retrieve admin data.
DateTimeFormatter - used to format date in the specified format.
LocalDate - Represents the current date.
Sets LocalDate to the startDate then uses that to add days in specific cases.
StartDateText - String that formats startDate.
Map - maps associates strings keys and gets values from doctor for map.
--%>
<% 
            Admin a1;
            a1 = (Admin)session.getAttribute("a1");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEEE (M/d)");
            LocalDate today = LocalDate.now();
            LocalDate startDate;
            switch(today.getDayOfWeek()){
              case SATURDAY: startDate = today.plusDays(2);
              case SUNDAY: startDate = today.plusDays(1);
              default: startDate = today;
            }
            String startDateText = startDate.format(formatter);
            DoctorFactory doctorFactory = new DoctorFactory();
            Map<String, Doctor> doctorMap = doctorFactory.getDoctors();
%>
<!DOCTYPE html>

<!--
Nicholas Hall, Timothy Wolf, Donya Moxley, Jason Fleurival, Benjamin Ard
CIST2931
Team 3
ChattChiro - Chiropractors
-->

<html>
<!--
Heading of HTML Containing Properties of Web Page
title - Title of the document.
charset - Declares the document's character encoding through meta tag.
name/content - Displays document based on device through meta tag.
link (rel/href) - Links to external Stylesheet through both external link and style.css.
-->
    <head>
        <title>ChattChiro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="https://kit.fontawesome.com/3bead4d2e9.js" crossorigin="anonymous"></script>
    </head>
<!--
Body of HTML Containing all the content inputted, Login Box for user to enter inputs
div - Used as a container for elements in code.
nav - Section of pages used to provide navigation links in code.
id - HTML attribute used to give a unique id for element.
class - Specifies classname for element.
style - Specifies how HTML elements render in browser (Colors of specific elements).
form - Used to create an HTML form for user input.
button - Defines a clickable button for user.
p - Defines a paragraph.
label - Defines a label for specific elements used (Id, Password).
href - links to a specific url or .jsp.
input - Specifies a input field for user to enter information (Id, Password).
-->
    <body >
        <div id="index_container" class='container-fluid'>
            <div class='row '>
                <nav class="navbar navbar-light bg-light col-12 shadow  py-2">
                    <a href="index.html" class="navbar-brand">ChattChiro</a>
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
            <div class="row justify-content-center pt-3 pb-4" style="background-color: rgb(245,245,245);">
            <h1>Admin Panel</h1>
            </div>
            <div class="row justify-content-center" style="background-color: rgb(245,245,245);">
                <% if (a1 != null){ %>
                  
                      <div class='col-10 mt-4 card px-0'>
                        
                          <form action="ChangeAvailabilityServlet" method='post'>
                            <div class="card-header">
                            <h2 class="text-center my-0 font-weight-normal">Weekly Schedule</h2>
                            </div>
                            <div class='card-body my-2 px-5'>
                              
                              <div class="card mb-3">
                                <div class="table-responsive p-1">
                                  <table class="table mb-0">
                                    <tr>
                                      <th class="borderless">Doctor:</th>
                                      <% 
                                        int count = 0;
                                        int x = 0;
                                        LocalDate endDate;
                                        while (count < 10){
                                          if (startDate.plusDays(x).getDayOfWeek() == DayOfWeek.SATURDAY || startDate.plusDays(x).getDayOfWeek() == DayOfWeek.SUNDAY){
                                            x += 1;
                                            continue;
                                          } else {
                                      %>
                                            <th class="text-center borderless"><%= startDate.plusDays(x).format(formatter) %></th>
                                      <%
                                            count += 1;
                                            x += 1;
                                          }
                                        }
                                        endDate = startDate.plusDays(x-1);
                                        System.out.println(endDate);
                                        Map<String, Map<String, Boolean>> availableMap = Availability.getAvailabilityBetweenDates(startDate, endDate);
                                      %>

                                    </tr>
                                    <% for(Map.Entry<String, Doctor> entry : doctorMap.entrySet()){ %>
                                    <tr>
                                      <td><%= entry.getValue().getFullName() %></td>
                                      <%
                                        count = 0;
                                        x = 0;
                                        while (count < 10){
                                          LocalDate currentDate = startDate.plusDays(x);
                                          if (currentDate.getDayOfWeek() == DayOfWeek.SATURDAY || currentDate.getDayOfWeek() == DayOfWeek.SUNDAY){
                                            x += 1;
                                            continue;
                                          } else {
                                            String curDocID = entry.getValue().getID();
                                            Boolean available;
                                            if (availableMap.get(curDocID) != null){
                                              Map<String, Boolean> curDocAvailability = availableMap.get(curDocID);
                                              if (curDocAvailability.get(currentDate.toString()) != null){
                                                available = curDocAvailability.get(currentDate.toString());
                                              } else {
                                                available = false;
                                              }
                                            } else {
                                              available = false;
                                            }
                                            
                                      %>
                                      <td class="text-center">
                                        <div class="form-check form-check-inline">
                                          <input class="form-check-input" type="radio" <% if (available){ %>checked<% } %> name="<%= curDocID %>,<%= currentDate %>" value="Y" id="<%= curDocID %>Y<%= x %>"><label class="form-check-label" for="<%= curDocID %>Y<%= x %>">Y</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                          <input class="form-check-input" type="radio" <% if (!available){ %>checked<% } %> name="<%= curDocID %>,<%= currentDate %>" value="N" id="<%= curDocID %>N<%= x %>"><label class="form-check-label" for="<%= curDocID %>N<%= x %>">N</label>
                                        </div>
                                      </td>
                                      <% 
                                        count += 1;
                                        x += 1;
                                        }
                                      } 
                                      %>
                                    </tr>
                                    <% } %>
                                  </table>
                                </div>
                              </div>
                              <button type="submit" class="btn btn-primary">Update Schedules</button>
                            </div>
                          </form>
                        </div>
                      </div>

                    <div class='row align-items-center justify-content-center py-4'>
                        <div class="col-4 card px-0">
                          <div class="card-header">
                            <h2 class="text-center my-0 font-weight-normal">Add Chiropractor:</h2>
                          </div>
                          <form action="AddChiropractorServlet" method='post' class='card  border-0'>
                            <div class='card-body my-3 px-5'>
                              <div class="form-group">
                                <label for="chiroId">ID</label>
                                <input name='chiroId' type="text" class="form-control" id="chiroId" aria-describedby="chiroId">
                              </div>
                              <div class="form-group">
                                <label for="chiroPwd">Password</label>
                                <input name='chiroPwd' type="password" class="form-control" id="chiroPwd" aria-describedby="chiroPwd">
                              </div>
                              <div class="form-group">
                                <label for="chiroFName">First Name</label>
                                <input name='chiroFName' type="text" class="form-control" id="chiroFName" aria-describedby="chiroFName">
                              </div>
                              <div class="form-group">
                                <label for="chiroLName">Last Name</label>
                                <input name='chiroLName' type="text" class="form-control" id="chiroLName" aria-describedby="chiroLName">
                              </div>
                              <div class="form-group">
                                <label for="chiroEmail">Email</label>
                                <input name='chiroEmail' type="text" class="form-control" id="chiroEmail" aria-describedby="chiroEmail">
                              </div>
                              <div class="form-group">
                                <label for="chiroOfficeNum">Office Number</label>
                                <input name='chiroOfficeNum' type="text" class="form-control" id="chiroOfficeNum"
                                  aria-describedby="chiroOfficeNum">
                              </div>
                              <button type="submit" class="btn btn-primary">Add Chiropractor</button>
                            </div>
                          </form>
                        </div>
                      </div>

                      <div class="row py-4" style="background-color: rgb(245,245,245);">
                        <div class="px-3 pb-3 col-lg-6 mx-auto">
                            <h2 class="pb-3 display-4">Setting the Weekly Schedule</h2>
                            <ol>
                                <li>To start setting the weekly schedule, first take note of which day the schedule starts. If it is a
                                weekday, the schedule will start on today's date and extend 10 business days into the future. If you are
                                accessing this page on a weekend, the schedule will start on the following Monday and then extend 10 business days.</li>
                                <li>Simply select the correct radio button for each doctor&mdash;if they are available on that day, select "Y". The default is "N".</li>
                                <li>When you have set the schedule as desired, click "Update Schedules". The next time you access this page, you should see the updated schedule.</li>
                            </ol>
                            <h2 class="py-3 display-4">Adding a Chiropractor</h2>
                            <ol>
                                <li>To add a chiropractor, simply fill in the above form labeled "Add Chiropractor".</li>
                                <li>It is preferable if ID is in the following format: C###&mdash;for example, C202</li>
                                <li>Click "Add Chiropractor" and a chiropractor account will be created and added to the database.</li>
                            </ol>
                        </div>
                     </div>
                  <%-- 
                Used if Access to Admin is denied
                --%>
                  <% } else { %>
                  <h1>Access Denied.</h1>
                  <% } %>
            </div>  
        </div>    
<!-- Script points to external script file through src attribute to URL -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
