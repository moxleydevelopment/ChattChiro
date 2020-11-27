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
<%@page import="Business.DoctorFactory"%>
<%@page import="Business.Doctor"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.Patient"%> 

 <% 
            Patient p1;
            DoctorFactory doctorFactory = new DoctorFactory();
            Availability avil = new Availability();
            Map<String, Doctor> doctorMap = doctorFactory.getDoctors();
            p1 = (Patient)session.getAttribute("p1");
            LocalDate today = LocalDate.now();
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
                <%for (int count = 0; count < 10; count++){ %>
                <% if(today.plusDays(plusDaysHead).getDayOfWeek().equals(DayOfWeek.SATURDAY) ){ 
                    int x = plusDaysHead + 2;
                    plusDaysHead++;
                %>
                        <th scope="col"><%=today.plusDays(x).getDayOfWeek()%></th>                   
                    <% 
                       
                       }else if(today.plusDays(plusDaysHead).getDayOfWeek().equals(DayOfWeek.SUNDAY)){ 
                            int x = plusDaysHead + 2;
                            plusDaysHead = plusDaysHead + 3;
                    %>
                        <th scope="col"><%=today.plusDays(x).getDayOfWeek()%></th>
                    <%
                        
                        }else {%>
                        <th scope="col"><%=today.plusDays(plusDaysHead).getDayOfWeek()%></th>
                    <% plusDaysHead++;
                     }%>
                <%}%>
              </tr>
            </thead>
            <tbody>
              <%for (int count = 0; count < 10; count++){
                   plusDaysBody = 0;
              %>
                <tr>
                  <th scope="row"><%=hourOfDay[count]%></th>
                    <%for (int days = 0; days < 10; days++){
                    %>
                    <th>
                        <% for(Map.Entry<String, Doctor> entry : doctorMap.entrySet()){ 
                           
                        %>
                            <% if(today.plusDays(plusDaysBody).getDayOfWeek().equals(DayOfWeek.SATURDAY) ){ 
                                int x = plusDaysBody + 2;
                                
                                if(avil.getAvailability(entry.getValue().getID(), today.plusDays(x).toString())){
                                    List<Appointment> appointmentList = new ArrayList<Appointment>();
                                    appointmentList = entry.getValue().getAppointments(today.plusDays(x).toString()); 
                                    System.out.print("*****************"+appointmentList.size());
                                    if(appointmentList.size() == 0){
                                        
                                    
                            %>
                           <form action="../SetAppointmentServlet" method='post'>
                                <input type="hidden" name="apptDate" value="<%=today.plusDays(x).toString() %>">
                                <input type="hidden" name="doctorId" value="<%=entry.getValue().getID() %>">
                                <input type="hidden" name="patientId" value="<%=p1.getID() %>">
                                <input type="hidden" name="timeSlot" value="<%=count %>">
                                <input type="submit" class="btn btn-info my-1" value="<%=entry.getValue().getLastName() %>"> 
                            </form>
                                
                            <%}else{
                                 //appointmentList.get(count+1);
                            %>

                            <%} } 
                            %> 
                            <% }else if(today.plusDays(plusDaysBody).getDayOfWeek().equals(DayOfWeek.SUNDAY)){ 
                                int x = plusDaysBody + 2;
                                
                                if(avil.getAvailability(entry.getValue().getID(), today.plusDays(x).toString())){
                                    List<Appointment> appointmentList = new ArrayList<Appointment>();
                                    appointmentList = entry.getValue().getAppointments(today.plusDays(x).toString()); 
                                    System.out.print("*****************"+appointmentList.size());
                                    if(appointmentList.size() == 0){
                            %>
                                <form action="../SetAppointmentServlet" method='post'>
                                    <input type="hidden" name="apptDate" value="<%=today.plusDays(x).toString() %>">
                                    <input type="hidden" name="doctorId" value="<%=entry.getValue().getID() %>">
                                    <input type="hidden" name="patientId" value="<%=p1.getID() %>">
                                    <input type="hidden" name="timeSlot" value="<%=count %>">
                                    <input type="submit" class="btn btn-info my-1" value="<%=entry.getValue().getLastName() %>"> 
                                </form>
                            <%}}else{
                                 //appointmentList.get(count+1);
                            %>    
                            <%}}else {
                                if(avil.getAvailability(entry.getValue().getID(), today.plusDays(plusDaysBody).toString())){
                                    List<Appointment> appointmentList = new ArrayList<Appointment>();
                                    appointmentList = entry.getValue().getAppointments(today.plusDays(plusDaysBody).toString()); 
                                    System.out.print("*****************"+appointmentList.size());
                                    if(appointmentList.size() == 0){
                            %>
                                <form action="../SetAppointmentServlet" method='post'>
                                    <input type="hidden" name="apptDate" value="<%=today.plusDays(plusDaysBody).toString() %>">
                                    <input type="hidden" name="doctorId" value="<%=entry.getValue().getID() %>">
                                    <input type="hidden" name="patientId" value="<%=p1.getID() %>">
                                    <input type="hidden" name="timeSlot" value="<%=count %>">
                                    <input type="submit" class="btn btn-info my-1" value="<%=entry.getValue().getLastName() %>"> 
                                </form>
                            <%}else{
                                 //appointmentList.get(count+1);
                            %>    
                            <% }}
                            %>
                        <%}}%>  
                    </th>
                    <%
                        if(today.plusDays(plusDaysBody).getDayOfWeek().equals(DayOfWeek.SATURDAY)){
                            plusDaysBody++;
                        }else if (today.plusDays(plusDaysBody).getDayOfWeek().equals(DayOfWeek.SUNDAY)){
                            plusDaysBody = plusDaysBody + 3;
                        }else{
                            plusDaysBody++;
                        }
                        }
                    %>
                  
                </tr>
               <%}%>
              
            </tbody>
        </table>
        
    </body>
</html>
