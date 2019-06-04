<%--
  Created by IntelliJ IDEA.
  User: ZiOS
  Date: 2019-06-03
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>View Doctors</title>
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

<h2 align="center" class="title">View Doctors</h2>

<div class="doctor-container">
    <table class="table table-md table-hover">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Email</th>
            <th scope="col">Speciality</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="doctor" items="${doctors}">
            <tr>
                <th scope="row">${ doctor.id}</th>
                <td>${ doctor.firstName}</td>
                <td>${ doctor.lastName}</td>
                <td>${ doctor.email}</td>
                <td>${ doctor.speciality}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
