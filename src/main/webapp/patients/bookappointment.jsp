<%-- 
    Document   : bookappointment
    Created on : Nov 23, 2020, 12:46:36 PM
    Author     : donyamoxley
--%>

<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.Patient"%> 

 <% 
            Patient p1;
            p1 = (Patient)session.getAttribute("p1");
            LocalDate today = LocalDate.now();
            int plusDays = 1;
            String[] hourOfDay = {"08:00am", "09:00am","10:00am","11:00am","12:00pm","01:00pm","02:00pm","03:00pm","04:00pm","05:00pm"};
            String[] daysOfWeek = {"Sunday","Monday", "Tuesday", "Wednesday", "Thursday","Friday","Sunday"};
            System.out.print(today.plusDays(1).getDayOfWeek());
           
%>
<!DOCTYPE html>
<html>
       <head>
        <title>ChattChiro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../style.css">
        <script src="https://kit.fontawesome.com/3bead4d2e9.js" crossorigin="anonymous"></script>
    </head>
    <body>
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
        <table class="table">
            <thead>
              <tr>
                <th scope="col">Time</th>
                
                <th scope="col"><%=today.getDayOfWeek()%></th>
                <%for (int count = 1; count < 7; count++){ %>
                <% if(today.plusDays(plusDays).getDayOfWeek().equals(DayOfWeek.SATURDAY) ){ 
                    plusDays = plusDays + 2; 
                %>
                        <th scope="col"><%=today.plusDays(plusDays).getDayOfWeek()%></th>                   
                    <% }else if(today.plusDays(count).getDayOfWeek().equals(DayOfWeek.SUNDAY)){ 
                        plusDays = plusDays + 1;
                    %>
                        <th scope="col"><%=today.plusDays(plusDays).getDayOfWeek()%></th>
                    <%}else {%>
                        <th scope="col"><%=today.plusDays(plusDays).getDayOfWeek()%></th>
                    <% plusDays++;}%>
                <%}%>
              </tr>
            </thead>
            <tbody>
              <%for (int count = 0; count < 10; count++){ %>
                <tr>
                  <th scope="row"><%=hourOfDay[count]%></th>
                    <%for (int days = 1; days < 7; days++){ %>
                    <% if(today.plusDays(plusDays).getDayOfWeek().equals(DayOfWeek.SATURDAY) ){ 
                    plusDays = plusDays + 2; 
                    %>
                        <th scope="col"><%=today.plusDays(plusDays).getDayOfWeek()%></th>                   
                    <% }else if(today.plusDays(count).getDayOfWeek().equals(DayOfWeek.SUNDAY)){ 
                        plusDays = plusDays + 1;
                    %>
                        <th scope="col"><%=today.plusDays(plusDays).getDayOfWeek()%></th>
                    <%}else {%>
                        <th scope="col"><%=today.plusDays(plusDays).getDayOfWeek()%></th>
                    <% plusDays++;}%>
                    <%}%>
                  <th>
                      <div class="col-12">
                           <button class="badge badge-pill badge-primary">Name</button>
                      </div>
                      <div class="col-12">
                        <button class="badge badge-pill badge-primary">Full Name</button>   
                      </div>
                      <div class="col-12">
                          <button class="badge badge-pill badge-primary">Longer Name</button>
                      </div>
                  </th>
                  <th>
                      <div class="col-12">
                           <button class="badge badge-pill badge-primary">Name</button>
                      </div>
                      <div class="col-12">
                        <button class="badge badge-pill badge-primary">Full Name</button>   
                      </div>
                      <div class="col-12">
                          <button class="badge badge-pill badge-primary">Longer Name</button>
                      </div>
                  </th>
                  
                </tr>
               <%}%>
              
            </tbody>
        </table>
        
    </body>
</html>
