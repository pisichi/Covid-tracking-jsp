<%-- 
    Document   : index
    Created on : Apr 25, 2020, 12:57:28 PM
    Author     : component
--%>

<%@page import="service.TimelineService"%>
<%@page import="service.DailyService"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.DailyData"%>
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

        <jsp:useBean id="test" class="model.DailyData" scope="request"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark site-header sticky-top">


            <a class="navbar-brand font-weight-bold" href="#">
                <img src="https://upload.wikimedia.org/wikipedia/commons/e/e0/Check_green_icon.svg" width="30" height="30"
                     class="d-inline-block align-top" alt="">
                Covid-19
            </a>

            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link font-weight-bold mx-2" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold mx-2" href="/TermProject_component/viewall">all data</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold mx-2" href="#">Pricing</a>
                </li>
            </ul>
        </nav>


        <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light" >
            <div class="col-md-5 p-lg-5 mx-auto my-5">
                <h1 class="display-4 font-weight-normal">Covid 19 stat th</h1>
                <p class="lead font-weight-normal">And an even wittier subheading to boot. Jumpstart your marketing efforts with this example based on Apple’s marketing pages.</p>
<!--                <a class="btn btn-outline-primary" href="#">Coming soon</a>-->
            </div>
            <div class="product-device shadow-sm d-none d-md-block"></div>
            <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
        </div>


        <%
          DailyData data = DailyService.getData();
          JSONArray jArr = TimelineService.getData();
        %>


        <div class="container">
            <div class="row fuild my-5 py-5">

                <div class="col-sm-8">

                    <div class = "row align-items-center">

                        <h1>
                            จำนวนรวมทั้งหมดในวันนี้
                        </h1>

                    </div>


                </div>

                <div class="col-sm-4" >

                    <div class = "row justify-content-center">
                        <div class="card text-white text-center bg-danger m-1" style="max-width: 20rem;">
                            <div class="card-header">Confirmed Cases</div>
                            <div class="card-body">
                                <h5 class="card-title">
                                    <%
                                        out.print(data.getConfirmed());
                                    %>
                                </h5>

                            </div>
                        </div>
                    </div>

                    <div class = "row justify-content-center">

                        <div class="card text-white text-center bg-danger m-1" style="max-width: 15rem;">
                            <div class="card-header">Recovered Cases</div>
                            <div class="card-body">
                                <h5 class="card-title">
                                    <%                                        out.print(data.getRecovered());
                                    %>
                                </h5>

                            </div>
                        </div>

                        <div class="card text-white text-center bg-danger m-1" style="max-width: 15rem;">
                            <div class="card-header">Hospitalized</div>
                            <div class="card-body">
                                <h5 class="card-title">
                                    <%                                         out.print(data.getHospitalized());
                                    %>
                                </h5>

                            </div>
                        </div>


                    </div>


                </div>
            </div>

            <div class="row my-5 py-5">


                <div class="col-sm-4">

                    <div class = "row justify-content-center">
                        <div class="card text-white text-center bg-danger m-1" style="max-width: 20rem;">
                            <div class="card-header">Confirmed Cases</div>
                            <div class="card-body">
                                <h5 class="card-title">
                                    <%                                        out.print(data.getConfirmed());
                                    %>
                                </h5>

                            </div>
                        </div>
                    </div>

                    <div class = "row justify-content-center">

                        <div class="card text-white text-center bg-danger m-1" style="max-width: 15rem;">
                            <div class="card-header">Confirmed Cases</div>
                            <div class="card-body">
                                <h5 class="card-title">
                                    <%                                        out.print(data.getConfirmed());
                                    %>
                                </h5>

                            </div>
                        </div>

                        <div class="card text-white text-center bg-danger m-1" style="max-width: 15rem;">
                            <div class="card-header">Confirmed Cases</div>
                            <div class="card-body">
                                <h5 class="card-title">
                                    <%                                         out.print(data.getConfirmed());
                                    %>
                                </h5>

                            </div>
                        </div>


                    </div>


                </div>

                <div class="col-sm-8" >
                    <div class = "row justify-content-center">
                        <h1>
                            จำนวนรายใหม่ในวันนี้ 
                        </h1> 


                    </div>


                </div>





            </div>

            <div class ="row py-5" >

                <h1> 10 วันที่แล้ว </h1>     <a class="btn btn-primary mx-5 my-2" href="/TermProject_component/viewall"> view all data </a>

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
                <%                    for (int i = jArr.length() - 1; i > jArr.length() - 11; i--) {
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
                        }
%>

            </table>
            </div>


            <div class ="row py-5" >
                <div class = "col-6">
                    <div class = "row align-items-center">
                      <h3> เคสล่าสุด </h3>     <a class="btn btn-primary mx-5 my-2" href="/TermProject_component/viewallcase"> view all case </a>
                      </div>
                </div>
               <div class = "col-6">
                   <div class = "row align-items-center">
                      <h3> จำนวนผู้ป่วยตามประเทศ </h3>     <a class="btn btn-primary mx-5 my-2" href="/TermProject_component/viewallnation"> view all country </a>
                      </div>
                </div>

            </div>



            


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
