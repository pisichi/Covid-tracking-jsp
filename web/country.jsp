<%-- 
    Document   : country
    Created on : May 3, 2020, 7:16:27 AM
    Author     : User
--%>

<%@page import="java.util.Iterator"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Navbar</a>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                    </li>
                </ul>
            </div>
        </nav>


        <%
            JSONObject nation = (JSONObject) request.getAttribute("Nation");
            JSONObject province = (JSONObject) request.getAttribute("Province");
        %>


        <div class="container">
            <div class="row">
                <%=request.getAttribute("nation")%>
            </div>


            <div class ="row py-5" >

                <div class ="col-md-6">
                    <h1>Country </h1>

                    <table class="table table-striped table-dark ">
                        <tr>
                            <th>Nation</th>
                            <th>Cases</th>
                        </tr>

                        <%
                            for (Iterator it = nation.keys(); it.hasNext();) {
                                String key = (String) it.next();

                                out.println("<tr>");
                                out.println("<td> " + key + "</td>");
                                out.println("<td> " + nation.get(key) + "</td>");
                                out.println("<tr>");
                            }
                        %>
                    </table>
                </div>
                    

                <div class ="col-md-6">
                    <h1>province </h1>

                    <table class="table table-striped table-dark ">
                        <tr>
                            <th>Province</th>
                            <th>Cases</th>
                        </tr>

                        <%
                            for (Iterator it = province.keys(); it.hasNext();) {
                                String key = (String) it.next();

                                out.println("<tr>");
                                out.println("<td> " + key + "</td>");
                                out.println("<td> " + province.get(key) + "</td>");
                                out.println("<tr>");
                            }
                        %>
                    </table>
                </div>


            </div>



            <div class ="row py-5" >



            </div>



            <a href="#" class="btn btn-primary">Go somewhere</a>




        </div>
    </body>
</html>
