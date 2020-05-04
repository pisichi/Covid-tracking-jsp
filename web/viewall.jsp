<%-- 
    Document   : viewall
    Created on : May 2, 2020, 1:23:38 PM
    Author     : User
--%>

<%@page import="model.DailyData"%>
<%@page import="model.TimelineData"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    TimelineData data = (TimelineData) request.getAttribute("Timeline");
    System.out.print(data.getUpdateDate());
    List<DailyData> jArr = data.getDaily();
%>



<%
    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
    List<Map<Object, Object>> list_r = new ArrayList<Map<Object, Object>>();
    List<Map<Object, Object>> list_h = new ArrayList<Map<Object, Object>>();
    List<Map<Object, Object>> list_d = new ArrayList<Map<Object, Object>>();

    for (int i = 0; i < jArr.size(); i++) {
        //JSONObject innerObj = (JSONObject) jArr.get(i);

        map = new HashMap<Object, Object>();
        map.put("label", jArr.get(i).getUpdateDate());
        map.put("y", jArr.get(i).getNewConfirmed());
        System.out.print(jArr.get(i).getNewConfirmed());
        list.add(map);

        map = new HashMap<Object, Object>();
        map.put("label", jArr.get(i).getUpdateDate());
        map.put("y", jArr.get(i).getNewRecovered());
        list_r.add(map);

        map = new HashMap<Object, Object>();
        map.put("label", jArr.get(i).getUpdateDate());
        map.put("y", jArr.get(i).getNewHospitalized());
        list_h.add(map);

        map = new HashMap<Object, Object>();
        map.put("label", jArr.get(i).getUpdateDate());
        map.put("y", jArr.get(i).getNewDeaths());
        list_d.add(map);
    }

    String dataPoints = gsonObj.toJson(list);
    String dataPoints_r = gsonObj.toJson(list_r);
    String dataPoints_h = gsonObj.toJson(list_h);
    String dataPoints_d = gsonObj.toJson(list_d);

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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css
              ">
        <title>Timeline</title>
        <script type="text/javascript">
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    theme: "light2",
                    animationEnabled: true,
                    zoomEnabled: true,
                    title: {
                        text: "Cases perday"
                    },
                    axisX: {
                        title: "Date"
                    },
                    axisY: {
                        title: "cases"
                    },
                    data: [{
                            type: "line",
                            name: "Confirmed",
                            showInLegend: true,
                            yValueFormatString: "Confirmed #,##0 cases",
                            dataPoints: <%out.print(dataPoints);%>
                        },
                        {
                            type: "line",
                            name: "Recovered",
                            showInLegend: true,
                            yValueFormatString: "Recovered #,##0 cases",
                            dataPoints: <%out.print(dataPoints_r);%>
                        }
                        ,
                        {
                            type: "line",
                            name: "Hospitalized",
                            showInLegend: true,
                            yValueFormatString: "Hospitalized #,##0 cases",
                            dataPoints: <%out.print(dataPoints_h);%>
                        },
                        {
                            type: "line",
                            name: "Deaths",
                            showInLegend: true,
                            yValueFormatString: "Deaths #,##0 cases",
                            dataPoints: <%out.print(dataPoints_d);%>
                        }]

                });
                chart.render();

            }
        </script>

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
            <div class = "row py-3">
                <h1>Timeline </h1>   
            </div>

            <div class = "row">
                <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>    
            </div>
            <div class = "row pb-3 justify-content-around">

                <h6> Start at 01/02/2020</h6> </br>
                <h6> Total record: <%=jArr.size()%> records</h6>

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
                        for (int i = jArr.size() - 1; i > 0; i--) {

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
