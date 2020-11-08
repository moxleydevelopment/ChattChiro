<%-- 
    Document   : updatepatient
    Created on : Nov 8, 2020, 4:05:55 PM
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
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div id="index_container" class='container-fluid'>
            <div class='row'>
                <nav class="navbar navbar-light  col-12" style="background-color:rgba(12, 11, 95, 0.5);">
                    <a class="navbar-brand">ChattChiro</a>
                </nav>
            </div> 
            <div class='col-6'>
                    <form action="../PatientUpdateServlet" method='post' class='card  border-0 bg-transparent'>
                        <div class='card-body my-5'>
                            <div class="form-group">
                              <input name='customerId' type="hidden" class="form-control" id="customerId" value="<%=p1.getID()%>">
                            <div class="form-group">
                              <label for="password">Password</label>
                              <input type="password" name="password" class="form-control" value="<%=p1.getPwd()%>">
                            </div>
                            <div class="form-group">
                              <label for="firstName">First Name</label>
                              <input type="text" name="firstName" class="form-control" value="<%=p1.getFirstName()%>">
                            </div>
                            <div class="form-group">
                              <label for="lastName">Last Name</label>
                              <input type="text" name="lastName" class="form-control" value="<%=p1.getLastName()%>">
                            </div>
                            <div class="form-group">
                              <label for="email">Email</label>
                              <input type="email" name="email" class="form-control" value="<%=p1.getEmail()%>">
                            </div>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </form>
                </div>
        </div>    
    </body>
</html>
