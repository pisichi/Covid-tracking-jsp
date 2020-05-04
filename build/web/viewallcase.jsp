<%-- 
    Document   : viewallcase
    Created on : May 2, 2020, 6:38:12 PM
    Author     : User
--%>

<%@page import="model.ReportData"%>
<%@page import="model.CasesData"%>
<%@page import="java.util.List"%>
<%@page import="model.AllCasesData"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
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


        <title>Cases</title>
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


        <%
            AllCasesData data = (AllCasesData) request.getAttribute("OpenCase");
            List<CasesData> caseArr = data.getCases();
            JSONObject Country = (JSONObject) request.getAttribute("Country");
            JSONObject Province = (JSONObject) request.getAttribute("Province");
        %>


        <div class="container">
            <div class="row pt-5">
                <h1> Open Cases </h1>
            </div>

            <div class="row pb-3">
                <h6 text-secondary> all open cases in Thailand </h6>
            </div>

            <div class ="row pb-3" >

                <form action="viewallcase" method="POST">
                    <div class="row justify-content-center align-items-end">
                        <div class="form-group col-md-2">
                            <a> gender </a>
                            <select  name="gender" class="form-control" >
                                <option disabled selected value> choose... </option>
                                <option>  Male </option>
                                <option>  Female </option>
                            </select>
                        </div>
                        <div class="form-group col-md-2">
                            <a> Nation </a>
                            <select  name="nation" class="form-control" >
                                <option disabled selected value >Choose...</option>
                                <%
                                    for (Iterator it = Country.keys(); it.hasNext();) {
                                        String key = (String) it.next();
                                        out.println("<option>" + key + "</option>");
                                    }
                                %>

                            </select>
                        </div>

                        <div class="form-group col-md-2">
                            <a> Province </a>
                            <select  name="province" class="form-control" >
                                <option disabled selected value >Choose...</option>
                                <%
                                    for (Iterator it = Province.keys(); it.hasNext();) {
                                        String key = (String) it.next();
                                        out.println("<option>" + key + "</option>");
                                    }
                                %>

                            </select>
                        </div>

                        <div class="form-group col-md-2">
                            <a> Min age </a>
                            <input name="min" type="text" class="form-control" >
                        </div>
                        <div class="form-group col-md-2">
                            <a> Max age </a>
                            <input name="max" type="text" class="form-control" >
                        </div>
                        <div  class="form-group col-md-2">
                            <button  class="btn btn-warning" type="submit" value="Submit"> search </button>
                        </div>
                    </div>


                </form>



            </div>

            <div class="row justify-content-around mb-4"> 
                <%
                    ReportData report = (ReportData) request.getAttribute("Report");
                    out.println(" <h6 class='text-primary'> Male: " + report.getMale() + " </h6>");
                    out.println(" <h6 class='text-warning'> Female: " + report.getFemale() + " </h6>");
                    out.println(" <h6 class='text-info'> Local: " + report.getThai() + "  </h6>");
                    out.println(" <h6 class='text-danger'> Foreigner " + report.getForeigner() + "  </h6>");
                    out.println(" <h6 class='text-success'> Avg age " + String.format("%.2f", report.getAge() / caseArr.size()) + "  </h6>");

                %>

            </div>


            <div class="row justify-content-between align-items-end">
                <div class = "col"> 
                    <span class="badge badge-pill badge-secondary">  <h5>   <%= caseArr.size()%> Record </h5> </span>
                </div>

                <div class = "col my-auto">
                    <div class="row justify-content-end align-items-end">


                        <%
                            String gender = (String) request.getAttribute("gender");
                            String nation = (String) request.getAttribute("nation");
                            String province = (String) request.getAttribute("province");
                            String min = (String) request.getAttribute("min");
                            String max = (String) request.getAttribute("max");

                            if (gender != null) {
                                out.println("<span class='badge badge-pill badge-info mx-1'>" + gender + "</span>");
                            }

                            if (nation != null) {
                                out.println("<span class='badge badge-pill badge-success mx-1'>" + nation + "</span>");
                            }

                            if (province != null) {
                                out.println("<span class='badge badge-pill badge-primary mx-1'>" + province + "</span>");
                            }

                            if (min != null && max != null) {

                                out.println("<span class='badge badge-pill badge-warning mx-1'> age: " + min);
                                out.println(" - " + max);
                                out.print("</span>");
                            }

                        %>
                    </div>
                </div>

            </div>

            <div class="row justify-content-end">


            </div>



            <div class ="row py-3" >



                <table id="pagination" class="table table-striped table-dark ">
                    <tr>
                        <th>ConfirmDate</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Nation</th>
                        <th>Province</th>
                    </tr>

                    <%      for (int i = 0; i < caseArr.size(); i++) {

                            {
                                out.println("<tr>");
                                out.println("<td> " + caseArr.get(i).getConfirmDate() + "</td>");
                                out.println("<td> " + caseArr.get(i).getAge() + "</td>");
                                out.println("<td> " + caseArr.get(i).getGenderEn() + "</td>");
                                out.println("<td> " + caseArr.get(i).getNationEn() + "</td>");
                                out.println("<td> " + caseArr.get(i).getProvinceEn() + "</td>");
                                out.println("<tr>");
                            }
                        }
                    %>

                </table>


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

