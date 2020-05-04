<%-- 
    Document   : index
    Created on : Apr 25, 2020, 12:57:28 PM
    Author     : component
--%>

<%@page import="model.CaseSumData"%>
<%@page import="model.CasesData"%>
<%@page import="model.AllCasesData"%>
<%@page import="model.TimelineData"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="service.TimelineService"%>
<%@page import="service.DailyService"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.DailyData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DailyData data = (DailyData) request.getAttribute("DailyData");
    TimelineData data_timeline = (TimelineData) request.getAttribute("TimelineData");
    List<DailyData> jArr = data_timeline.getDaily();
    AllCasesData data_cases = (AllCasesData) request.getAttribute("OpenCase");
    List<CasesData> caseArr = data_cases.getCases();
    CaseSumData gender = (CaseSumData) request.getAttribute("CaseSum");
%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



        <style>
            #chartdiv {
                width: 100%;
                height: 500px;
            }

        </style>

        <!-- Resources -->
        <script src="https://www.amcharts.com/lib/4/core.js"></script>
        <script src="https://www.amcharts.com/lib/4/charts.js"></script>
        <script src="https://www.amcharts.com/lib/4/themes/kelly.js"></script>
        <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

        <!-- Chart code -->
        <script>
            am4core.ready(function () {

                // Themes begin
                am4core.useTheme(am4themes_kelly);
                am4core.useTheme(am4themes_animated);
                // Themes end

                // Create chart instance
                var chart = am4core.create("chartdiv", am4charts.XYChart);

                // Set input format for the dates
                chart.dateFormatter.inputDateFormat = "yyyy-MM-dd";
                chart.legend = new am4charts.Legend();
                // Create axes
                var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
                var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

                // Create series
                var series1 = chart.series.push(new am4charts.LineSeries());
                series1.name = "New Confirmed";
                series1.dataFields.valueY = "value";
                series1.dataFields.dateX = "date";
                series1.tooltipText = "{value}"
                series1.strokeWidth = 2;
                series1.minBulletDistance = 15;

                series1.data = [
            <%
                for (int i = jArr.size() - 1; i > jArr.size() - 11; i--) {

                    out.print("{ 'date': '" + jArr.get(i).getUpdateDate() + "', ");
                    out.print("    'value': " + jArr.get(i).getNewConfirmed() + "  },");
                }
            %>
                ];

                var series2 = chart.series.push(new am4charts.LineSeries());
                 series2.name = "New Recovered";
                series2.dataFields.valueY = "value";
                series2.dataFields.dateX = "date";
                series2.tooltipText = "{value}"
                series2.strokeWidth = 2;
                series2.minBulletDistance = 15;

                series2.data = [
            <%
                for (int i = jArr.size() - 1; i > jArr.size() - 11; i--) {

                    out.print("{ 'date': '" + jArr.get(i).getUpdateDate() + "', ");
                    out.print("    'value': " + jArr.get(i).getNewRecovered() + "  },");
                }
            %>
                ];


                // Make bullets grow on hover
                var bullet = series1.bullets.push(new am4charts.CircleBullet());
                bullet.circle.strokeWidth = 2;
                bullet.circle.radius = 4;
                bullet.circle.fill = am4core.color("#fff");

                var bullethover = bullet.states.create("hover");
                bullethover.properties.scale = 1.3;


                var bullet2 = series2.bullets.push(new am4charts.CircleBullet());
                bullet2.circle.strokeWidth = 2;
                bullet2.circle.radius = 4;
                bullet2.circle.fill = am4core.color("#fff");

                var bullethover2 = bullet2.states.create("hover");
                bullethover2.properties.scale = 1.3;

                // Make a panning cursor
                chart.cursor = new am4charts.XYCursor();
                chart.cursor.behavior = "panXY";
                chart.cursor.xAxis = dateAxis;
                chart.cursor.snapToSeries = series1;




            }); // end am4core.ready()
        </script>

        <title>Covid-19</title>

        <jsp:useBean id="test" class="model.DailyData" scope="request"/>
    </head>
    <body>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark site-header sticky-top">


            <a class="navbar-brand font-weight-bold" href="#">
                <img src="https://upload.wikimedia.org/wikipedia/commons/e/e0/Check_green_icon.svg" width="30" height="30"
                     class="d-inline-block align-top" alt="">
                Covid-19
            </a>

            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link font-weight-bold mx-2" href="/TermProject_component">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold mx-2" href="/TermProject_component/viewall">Timeline</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold mx-2" href="/TermProject_component/viewallcase">Cases</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link font-weight-bold mx-2" href="/TermProject_component/viewallnation">Nation</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link font-weight-bold mx-2 disabled" href="/TermProject_component/">Area</a>
                </li>
            </ul>
        </nav>


        <div class="d-flex  position-relative overflow-hidden p-md-5 text-center bg" >
            <div class="col-md-5 p-lg-5 mx-auto my-5">
                <h1 class="display-4 font-weight-normal my-3">Covid-19 th</h1>
                <h5 class="lead font-weight-normal">Tracking for all cases of covid-19 in Thailand </h5>
                <p class="lead font-weight-normal"> Stay Home Stay Safe, Let's Stop COVID-19</p>
                <!--                <a class="btn btn-outline-primary" href="#">Coming soon</a>-->
            </div>
            <div class="product-device shadow-sm d-none d-md-block"></div>
            <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
        </div>





        <div class="container">

            <div class="row fuild my-5 py-5">

                <div class="col-sm-6">

                    <div class = "row align-items-center justify-content-center mb-4">

                        <h1>
                            Total Cases
                        </h1>

                    </div>

                    <div class = "row justify-content-center">
                        <div class="card text-white text-center bg-info mx-sm-1 p-3 mb-2">
                            <div class="card-text"> <h4>Confirmed cases <h4></div>
                                        <div class="card-text">
                                            <h1>

                                                <%                                                    out.print(data.getConfirmed());
                                                %>
                                            </h1>
                                        </div>
                                        </div>
                                        </div>

                                        <div class = "row justify-content-center">

                                            <div class="card text-white text-center bg-success mx-sm-1 p-3">
                                                <div class="card-text"> <h4>Recovered cases </h4></div>
                                                <div class="card-text"> <h1>

                                                        <% out.print(data.getRecovered());
                                                        %>

                                                    </h1>
                                                </div>
                                            </div>

                                            <div class="card text-white text-center bg-danger mx-sm-1 p-3">
                                                <div class="card-text"> <h4>Death cases </h4></div>
                                                <div class="card-text">
                                                    <h1>
                                                        <%   out.print(data.getDeaths());
                                                        %>
                                                    </h1>

                                                </div>
                                            </div>

                                        </div>

                                        </div>


                                        <div class="col-sm-6" >
                                            <div class = "row justify-content-center mb-4">
                                                <h1>
                                                    New Cases
                                                </h1> 
                                            </div>

                                            <div class = "row justify-content-center">
                                                <div class="card text-center text-info border-info mx-sm-1 p-3 mb-2" >
                                                    <div class="card-text"> <h4> Confirmed cases </h4></div>
                                                    <div class="card-text text-info">
                                                        <h1>
                                                            <% out.print(data.getNewConfirmed());
                                                            %>
                                                        </h1>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class = "row justify-content-center">

                                                <div class="card  text-center text-success border-success mx-sm-1 p-3" >
                                                    <div class="card-text"> <h4>Recovered cases </h4></div>
                                                    <div class="card-text text-success">
                                                        <h1>
                                                            <%  out.print(data.getNewRecovered());
                                                            %>
                                                        </h1>

                                                    </div>
                                                </div>

                                                <div class="card  text-center text-danger border-danger mx-sm-1 p-3">
                                                    <div class="card-text"> <h4>Death cases </h4></div>
                                                    <div class="card-text text-danger">
                                                        <h1>
                                                            <% out.print(data.getNewDeaths());
                                                            %>
                                                        </h1>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>

                                        </div>
                                        <div class = "row justify-content-center">
                                            <%  out.print("last update: " + data.getUpdateDate()); %>
                                        </div>
                                        <h1>
                                            Ratio

                                        </h1> 
                                        <div class="row my-5 py-5 justify-content-center">


                                            <div class = "col-3">


                                                <div class="card border-danger mx-sm-1 p-3">
                                                    <div class="card border-danger shadow text-danger p-3 my-card" ><span class="fa fa-bed" aria-hidden="true"></span></div>
                                                    <div class="text-danger text-center mt-3"><h4>Deaths</h4></div>
                                                    <div class="text-danger text-center mt-2"><h1> 
                                                            <%
                                                                float death = (float) data.getDeaths();
                                                                float cases = (float) data.getConfirmed();
                                                                out.print(String.format("%.2f", death / (cases + death) * 100) + "%");
                                                            %></h1></div>
                                                </div>

                                            </div>
                                            <div class="col-3">
                                                <div class="card border-success mx-sm-1 p-3">
                                                    <div class="card border-success shadow text-success p-3 my-card" ><span class="fa fa-heart" aria-hidden="true"></span></div>
                                                    <div class="text-success text-center mt-3"><h4>Recovered</h4></div>
                                                    <div class="text-success text-center mt-2"><h1> 
                                                            <%
                                                                float recover = (float) data.getRecovered();
                                                                out.print(String.format("%.2f", recover / (cases + recover) * 100) + "%");
                                                            %></h1></div>
                                                </div>
                                            </div>

                                            <div class="col-3">
                                                <div class="card border-primary mx-sm-1 p-3">
                                                    <div class="card border-primary shadow text-primary p-3 my-card" ><span class="fa fa-male " aria-hidden="true"></span></div>
                                                    <div class="text-primary text-center mt-3"><h4>Male</h4></div>
                                                    <div class="text-primary text-center mt-2"><h1> 
                                                            <%
                                                                float male = gender.getMale();
                                                                float female = gender.getFemale();
                                                                out.print(String.format("%.2f", male / (male + female) * 100) + "%");
                                                            %></h1></div>
                                                </div>
                                            </div>


                                            <div class="col-3">
                                                <div class="card border-warning mx-sm-1 p-3">
                                                    <div class="card border-warning shadow text-warning p-3 my-card" ><span class="fa fa-female " aria-hidden="true"></span></div>
                                                    <div class="text-warning text-center mt-3"><h4>Female</h4></div>
                                                    <div class="text-warning text-center mt-2"><h1> 
                                                            <%
                                                                out.print(String.format("%.2f", female / (male + female) * 100) + "%");
                                                            %></h1></div>
                                                </div>
                                            </div>



                                        </div>




                                        <div class ="row py-5" >

                                            <h1> Last 10 days </h1>    
                                            <a class="btn btn-warning mx-5 my-2" href="/TermProject_component/viewall"> view all data </a>


                                            <div id="chartdiv"></div>

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
                                                <%                    for (int i = jArr.size() - 1; i > jArr.size() - 11; i--) {

                                                        out.println("<tr>");
                                                        out.println("<td> " + jArr.get(i).getUpdateDate() + "</td>");
                                                        out.println("<td> " + jArr.get(i).getConfirmed() + "</td>");
                                                        out.println("<td> " + jArr.get(i).getNewConfirmed() + "</td>");
                                                        out.println("<td> " + jArr.get(i).getRecovered() + "</td>");
                                                        out.println("<td> " + jArr.get(i).getNewRecovered() + "</td>");
                                                        out.println("<td> " + jArr.get(i).getHospitalized() + "</td>");
                                                        out.println("<td> " + jArr.get(i).getNewHospitalized() + "</td>");
                                                        out.println("<td> " + jArr.get(i).getDeaths() + "</td>");
                                                        out.println("<td> " + jArr.get(i).getNewDeaths() + "</td>");
                                                        out.println("<tr>");
                                                    }
                                                %>

                                            </table>
                                        </div>


                                        <div class ="row py-5" >
                                            <div class = "col-6">
                                                <div class = "row align-items-center">
                                                    <h3> Latest Cases </h3>     <a class="btn btn-warning mx-5 my-2" href="/TermProject_component/viewallcase"> view all case </a>


                                                    <table class="table table-striped table-dark ">
                                                        <tr>
                                                            <th>ConfirmDate</th>
                                                            <th>Age</th>
                                                            <th>Gender</th>
                                                            <th>Nation</th>
                                                        </tr>

                                                        <%
                                                            for (int i = 0; i < 10; i++) {
                                                                {
                                                                    out.println("<tr>");
                                                                    out.println("<td> " + caseArr.get(i).getConfirmDate() + "</td>");
                                                                    out.println("<td> " + caseArr.get(i).getAge() + "</td>");
                                                                    out.println("<td> " + caseArr.get(i).getGenderEn() + "</td>");
                                                                    out.println("<td> " + caseArr.get(i).getNationEn() + "</td>");
                                                                    out.println("<tr>");
                                                                }
                                                            }
                                                        %>

                                                    </table>

                                                </div>
                                            </div>
                                            <div class = "col-6">
                                                <div class = "row align-items-center ">
                                                    <h3> Cases by Nation, province </h3>     
                                                    <a class="btn btn-warning mx-5 my-2" href="/TermProject_component/viewallnation"> view all data </a>
                                                    <img src="https://i.imgur.com/2mtzziJ.png" class="img-fluid" alt="Responsive image">
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
                                                        <a href="https://covid19.th-stat.com/th/api" class="btn btn-outline-white btn-rounded">Covid-19 stat</a>
                                                    </li>
                                                </ul>


                                            </div>



                                            <div class="footer-copyright text-center py-3">
                                                <a> 60050223 pisitchai siriratanachaikul</a>
                                            </div>


                                        </footer>


                                        <style>

                                            .my-card
                                            {
                                                position:absolute;
                                                left:40%;
                                                top:-20px;
                                                border-radius:50%;
                                            }
                                            .bg{
                                                background: rgb(255,255,255);
                                                background: -moz-linear-gradient(0deg, rgba(255,255,255,1) 0%, rgba(255,208,17,1) 100%);
                                                background: -webkit-linear-gradient(0deg, rgba(255,255,255,1) 0%, rgba(255,208,17,1) 100%);
                                                background: linear-gradient(0deg, rgba(255,255,255,1) 0%, rgba(255,208,17,1) 100%);
                                                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#ffffff",endColorstr="#ffd011",GradientType=1);
                                            }

                                        </style>

                                        </html>
