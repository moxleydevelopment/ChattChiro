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
<%@page import="Business.Admin,Business.Doctor,Business.DoctorFactory,java.time.LocalDate,java.time.format.DateTimeFormatter,java.util.Map"%>
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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<%-- 
Body of HTML Containing all the content pulled from database based on earlier log in.
Admin information used to Display, Update, or Add new information(Displays in table format).
Tables use StartDate Scriplets information to fill in dates.
div - Used as a container for elements in code.
nav - Section of pages used to provide navigation links in code.
id - HTML attribute used to give a unique id for element.
class - Specifies classname for element.
form - Used to create an HTML form for user input.
table - Defines HTML table with information provided from database, th's elements are bold and centered while td's elements are not bold and aligned to the left.
button - Defines a clickable button for user.
Radio - Defines a radio button, gives user option to pick Y or N.
p - Defines a paragraph.
label - Defines a label for specific elements used.
href - links to a specific url or .jsp.
input - Specifies a input field for user to enter information.
--%>
<body>
  <div id="index_container" class='container-fluid'>
    <div class='row'>
      <nav class="navbar navbar-light  col-12" style="background-color:rgba(12, 11, 95, 0.5);">
        <a class="navbar-brand">ChattChiro</a>
      </nav>
    </div>

    <% if (a1 != null){ %>
    <h1>Admin Panel</h1>

<%-- 
Table showing startdate information.
Gives user option to update schedule dates.
--%>

    <div class='row align-items-center justify-content-center'>
      <div class='col-6' style="background-color:rgba(12, 11, 95, 0.8); border-radius: 15px 30px;">
        <form action="ChangeAvailabilityServlet" method='post' class='card  border-0 bg-transparent text-white'>
          <div class='card-body my-5'>
            <h2>Schedule:</h2>
            <table class="table" style="background: #ddd">
              <tr>
                <th>Doctor:</th>
                <th><%= startDate.format(formatter) %></th>
                <th><%= startDate.plusDays(1).format(formatter) %></th>
                <th><%= startDate.plusDays(2).format(formatter) %></th>
                <th><%= startDate.plusDays(3).format(formatter) %></th>
                <th><%= startDate.plusDays(4).format(formatter) %></th>
                <th><%= startDate.plusDays(7).format(formatter) %></th>
                <th><%= startDate.plusDays(8).format(formatter) %></th>
                <th><%= startDate.plusDays(9).format(formatter) %></th>
                <th><%= startDate.plusDays(10).format(formatter) %></th>
                <th><%= startDate.plusDays(11).format(formatter) %></th>
              </tr>
              <% for(Map.Entry<String, Doctor> entry : doctorMap.entrySet()){ %>
              <tr>  
                <td><%= entry.getValue().getFullName() %></td>
                <td>Y <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate %>" value="Y"> N <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate %>" value="N"></td>
                <td>Y <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(1) %>" value="Y"> N <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(1) %>" value="N"></td>
                <td>Y <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(2) %>" value="Y"> N <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(2) %>" value="N"></td>
                <td>Y <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(3) %>" value="Y"> N <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(3) %>" value="N"></td>
                <td>Y <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(4) %>" value="Y"> N <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(4) %>" value="N"></td>
                <td>Y <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(7) %>" value="Y"> N <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(7) %>" value="N"></td>
                <td>Y <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(8) %>" value="Y"> N <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(8) %>" value="N"></td>
                <td>Y <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(9) %>" value="Y"> N <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(9) %>" value="N"></td>
                <td>Y <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(10) %>" value="Y"> N <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(10) %>" value="N"></td>
                <td>Y <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(11) %>" value="Y"> N <input type="radio" name="<%= entry.getValue().getID() %>,<%= startDate.plusDays(11) %>" value="N"></td>
              </tr>
              <% } %>
            </table>
            <button type="submit" class="btn btn-primary">Update Schedules</button>
          </div>
        </form>
      </div>
    </div>

    <div class='row align-items-center justify-content-center' style="margin-top: 50px">

<%-- 
Gives option to add new Chiropractor to data from user added information on page.
--%>

      <div class="col-4" style="background-color:rgba(12, 11, 95, 0.8); border-radius: 15px 30px;">
        <form action="AddChiropractorServlet" method='post' class='card  border-0 bg-transparent text-white'>
          <div class='card-body my-5'>
            <h2>Add Chiropractor:</h2>
            <div class="form-group">
              <label for="chiroId">ID</label>
              <input name='chiroId' type="text" class="form-control" id="chiroId" aria-describedby="chiroId">
            </div>
            <div class="form-group">
              <label for="chiroPwd">Password</label>
              <input name='chiroPwd' type="text" class="form-control" id="chiroPwd" aria-describedby="chiroPwd">
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





  </div>
<%-- 
Used if Access to Admin is denied
--%>
  <% } else { %>
  <h1>Access Denied.</h1>
  <% } %>

  </div>
<%-- Script points to external script file through src attribute to URL --%>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
    crossorigin="anonymous"></script>
</body>

</html>
