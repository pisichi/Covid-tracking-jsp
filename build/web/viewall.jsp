<%-- 
    Document   : viewall
    Created on : May 2, 2020, 1:23:38 PM
    Author     : User
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            JSONArray jArr = (JSONArray) request.getAttribute("Timeline");
            float Rrate = 0f;
            float Drate = 0f;
            int record = 0;
        %>


        <div class="container">
            <div class = "row py-3">
                <h1>Timeline </h1>   
            </div>
            <div class = "row pb-3 justify-content-around">

                <h6> Start at 01/02/2020</h6> </br>
                <h6> Total record: <%=jArr.length()%> records</h6>

            </div>
            <div class = "row">

                <table class="table table-striped table-dark ">
                    <tr>
                        <th>Date</th>
                        <th>Confirmed</th>
                        <th>NewConfirmed</th>
                        <th>Recovered</th>
                        <th>NewRecovered</th>
                        <th>Hospitalized</th>
                        <th>NewHospitalized</th>
                        <th>Deaths</th>
                        <th>NewDeaths</th>
                    </tr>
                    <%
                        for (int i = jArr.length() - 1; i > 0; i--) {
                            JSONObject innerObj = (JSONObject) jArr.get(i);
                            out.println("<tr>");
                            out.println("<td> " + innerObj.getString("Date") + "</td>");
                            out.println("<td> " + innerObj.getInt("Confirmed") + "</td>");
                            out.println("<td> " + innerObj.getInt("NewConfirmed") + "</td>");
                            out.println("<td> " + innerObj.getInt("Recovered") + "</td>");
                            out.println("<td> " + innerObj.getInt("NewRecovered") + "</td>");
                            out.println("<td> " + innerObj.getInt("Hospitalized") + "</td>");
                            out.println("<td> " + innerObj.getInt("NewHospitalized") + "</td>");
                            out.println("<td> " + innerObj.getInt("Deaths") + "</td>");
                            out.println("<td> " + innerObj.getInt("NewDeaths") + "</td>");
                            out.println("<tr>");
                            record += 1;
                        }
                    %>
                </table>

            </div>

            <div class ="row py-5" >
            </div>

        </div>
    </body>
    
    <footer class="page-footer font-small bg-dark pt-4 text-white">


  <div class="container">


    <ul class="list-unstyled list-inline text-center py-2">
      <li class="list-inline-item">
        <h5 class="mb-1">Data provided by </h5>
      </li>
      <li class="list-inline-item">
        <a href="#!" class="btn btn-outline-white btn-rounded">Covid-19 stat</a>
      </li>
    </ul>


  </div>



  <div class="footer-copyright text-center py-3">
    <a> 60050223 pisitchai siriratanachaikul</a>
  </div>


</footer>
    
</html>
