<%-- 
    Document   : chiropractor
    Created on : Oct 19, 2020, 12:10:12 PM
    Author     : Tim Wolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.Admin"%> 
<% 
            Admin a1;
            a1 = (Admin)session.getAttribute("a1");
           
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
    <body >
        <div id="index_container" class='container-fluid'>
            <div class='row'>
                <nav class="navbar navbar-light  col-12" style="background-color:rgba(12, 11, 95, 0.5);">
                    <a class="navbar-brand">ChattChiro</a>
                 </nav>
            </div>

            <% if (a1 != null){ %>
                <h1>Admin Panel</h1>

                <div class='row align-items-center justify-content-center' >
                    <div class="col-4" style="background-color:rgba(12, 11, 95, 0.5); border-radius: 15px 30px;">
                        <form action="AddChiropractorServlet" method='post' class='card  border-0 bg-transparent text-white' >
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
                                <input name='chiroOfficeNum' type="text" class="form-control" id="chiroOfficeNum" aria-describedby="chiroOfficeNum">
                              </div>
                               <button type="submit" class="btn btn-primary">Add Chiropractor</button>
                           </div>
                       </form>
                    </div>
      
               </div>
            <% } else { %>
            <h1>Access Denied.</h1>
            <% } %>
            
        </div>
       
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>