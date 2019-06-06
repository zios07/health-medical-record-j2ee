<%--
  Created by IntelliJ IDEA.
  User: ZiOS
  Date: 2019-06-04
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>My appointments</title>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

    <style>
        .doctor-container {
            margin: 0 100px;
        }

        .title {
            margin: 30px 0;
        }
    </style>
</head>
<body>

<jsp:include page="../navbar.jsp"/>

<h2 align="center" class="title">My appointments</h2>

<div class="doctor-container">
    <table class="table table-md table-hover">
        <thead>
        <tr>
            <th scope="col">Doctor</th>
            <th scope="col">Speciality</th>
            <th scope="col">Date</th>
            <th scope="col">Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="appointment" items="${appointments}">
            <tr>
                <td>${ appointment.doctor.firstName} ${ appointment.doctor.lastName}</td>
                <td>${ appointment.doctor.speciality}</td>
                <td>${ appointment.date}</td>
                <td>${ appointment.status}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
