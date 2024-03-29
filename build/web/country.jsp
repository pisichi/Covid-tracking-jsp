<%-- 
    Document   : country
    Created on : May 3, 2020, 7:16:27 AM
    Author     : User
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    JSONObject nation = (JSONObject) request.getAttribute("Nation");
    JSONObject province = (JSONObject) request.getAttribute("Province");
%>






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

        <style>
            #chartdiv {
                width: 100%;
                height: 900px;
            }
             #chartdiv2 {
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

                var chart = am4core.create("chartdiv", am4charts.PieChart3D);
                chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

                chart.data = [
            <%
                for (Iterator it = nation.keys(); it.hasNext();) {
                    String key = (String) it.next();
                    if (key.equals("Thai")) {
                        continue;
                    }
                    int value = (int) nation.getInt(key);
                    out.print("{ country:' " + key + " ',");
                    out.print("cases:'" + value + "'} ,");

                }
            %>

                ];

                var series = chart.series.push(new am4charts.PieSeries3D());
                series.dataFields.value = "cases";
                series.dataFields.category = "country";




                var chart2 = am4core.create("chartdiv2", am4charts.PieChart);
                chart2.hiddenState.properties.opacity = 0; // this creates initial fade-in

                chart2.data = [
                    <%
                     for (Iterator it = province.keys(); it.hasNext();) {
                    String key = (String) it.next();
                    int value = (int) province.getInt(key);
                    out.print("{ province:' " + key + " ',");
                    out.print("cases:'" + value + "'} ,");
                   

                }
                %>
               
                ];

                var series2 = chart2.series.push(new am4charts.PieSeries3D());
                series2.dataFields.value = "cases";
                series2.dataFields.category = "province";
                series2.slices.template.cornerRadius = 6;
                series2.colors.step = 3;
                series2.labels.template.disabled = true;
                
                chart2.legend = new am4charts.Legend();
                chart2.legend.position = "right";
                chart2.legend.maxHeight = 500;
                chart2.legend.scrollable = true;

                series2.hiddenState.properties.endAngle = -90;

            }); // end am4core.ready()
        </script>




        <title>Nation</title>
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

        <div class="container">

            <div class="row justify-content-center pt-5 text-center">
                <h1>Foreigner Cases </h1>
            </div>
            <div class="row justify-content-center pt-5 text-center">

                <div class = "col" id="chartdiv"></div>

            </div>
            
             <div class="row justify-content-center pt-5 text-center">
                <h1>Case by Provinces </h1>
            </div>
            <div class="row justify-content-center pt-5 text-center">

                <div class = "col" id="chartdiv2"></div>
            

            </div>


            <div class ="row py-5" >

                <div class ="col-md-6">
                    <h1>Nation </h1>

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
                    <h1>Province </h1>

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
</html>
