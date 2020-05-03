<%-- 
    Document   : chart
    Created on : Apr 25, 2020, 1:14:01 PM
    Author     : component
--%>


<!DOCTYPE html>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.TimelineApi"%>
<%@page import="model.DailyApi"%>
<%@page import="model.DailyData"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

      
        <h1> 
            <%
             JSONObject nation = (JSONObject) request.getAttribute("Nation");
             out.println(nation.getInt("Thai"));
               out.println(nation.toString(4));
        %>
        </h1>
    </body>
</html>
