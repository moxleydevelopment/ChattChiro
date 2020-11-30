<%-- 
    Document   : bookappointment
    Created on : Nov 23, 2020, 12:46:36 PM
    Author     : donyamoxley
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Business.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="Business.Availability"%>
<%@page import="java.util.Map"%>
<%@page import="java.lang.Integer"%>
<%@page import="Business.DoctorFactory"%>
<%@page import="Business.Doctor"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
\<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.Patient"%>



 <% 
            Patient p1;
            DoctorFactory doctorFactory = new DoctorFactory();
            Availability avil = new Availability();
            Map<String, Doctor> doctorMap = doctorFactory.getDoctors();
            p1 = (Patient)session.getAttribute("p1");
            LocalDate today = LocalDate.now();
            LocalDate startDate;
            switch(today.getDayOfWeek()){
              case SATURDAY: startDate = today.plusDays(2);
              case SUNDAY: startDate = today.plusDays(1);
              default: startDate = today;
            }
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEEE (M/d)");
            int plusDaysHead = 0;
            int plusDaysBody = 0;
            String[] hourOfDay = {"08:00am", "09:00am","10:00am","11:00am","12:00pm","01:00pm","02:00pm","03:00pm","04:00pm","05:00pm"};
            System.out.print(today.plusDays(0).getDayOfWeek());
           
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
                  Map<String, Map<String, Map<Integer, Boolean>>> appointmentsMap = Appointment.getAppointmentsBetweenDates(startDate, endDate);
                %>
              </tr>
            </thead>
            <tbody>
            <% for (int timeslotX = 0; timeslotX < 25; timeslotX++){ %>
            <tr>
              <th scope="row"><%= Appointment.formatTimeSlot(timeslotX) %></th>
              <% 
                count = 0;
                x = 0;
                while (count < 10){
                  LocalDate currentDate = startDate.plusDays(x);
                  if (currentDate.getDayOfWeek() == DayOfWeek.SATURDAY || currentDate.getDayOfWeek() == DayOfWeek.SUNDAY){
                    x += 1;
                    continue;
                  } else {
                %>
              <td>
                <% for(Map.Entry<String, Map<String, Boolean>> entry : availableMap.entrySet()){
                    String docID = entry.getKey();
                    System.out.println(docID);
                    Doctor curDoctor = doctorMap.get(docID);
                    String docName = "";
                    Boolean docAvailable = false;
                    if (curDoctor != null){
                      if (entry.getValue().get(currentDate.toString())){
                        docAvailable = true;
                      } else {
                        docAvailable = false;
                      }
                      docName = curDoctor.getLastName();
                      //<DoctorID, <Date, <Timeslot, true>>
                      if (appointmentsMap.containsKey(docID)){
                        if (appointmentsMap.get(docID).containsKey(currentDate.toString())){
                          if (appointmentsMap.get(docID).get(currentDate.toString()).containsKey((Integer)timeslotX)){
                            docAvailable = false;
                          }
                        }
                      }
                      if (docAvailable){
                      %>
                      <form action="../SetAppointmentServlet" method='post'>
                        <input type="hidden" name="apptDate" value="<%= currentDate.toString() %>">
                        <input type="hidden" name="doctorId" value="<%= docID %>">
                        <input type="hidden" name="patientId" value="<%= p1.getID() %>">
                        <input type="hidden" name="timeSlot" value="<%= timeslotX %>">
                        <input type="submit" class="btn btn-info my-1" value="<%= docName %>"> 
                      </form>
                      <%
                      }
                    } 
                  } 
                %>
              </td>
              <%  
                count += 1;
                x += 1;
                  }
                 } %>
            </tr>
            <% } %>
            </tbody>
        </table>
        
    </body>
</html>
