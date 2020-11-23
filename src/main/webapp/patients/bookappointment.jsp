<%-- 
    Document   : bookappointment
    Created on : Nov 23, 2020, 12:46:36 PM
    Author     : donyamoxley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.Patient"%> 

 <% 
            Patient p1;
            p1 = (Patient)session.getAttribute("p1");
           
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
          <nav class="navbar navbar-light bg-light col-12 shadow py-2">
              <a href="index.html" class="navbar-brand">ChattChiro</a>
              <button class="btn btn-info" >Logout</button>
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
    </body>
</html>
