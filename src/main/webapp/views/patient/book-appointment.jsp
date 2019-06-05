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
    <title>Request new appointments</title>
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


<h2 align="center" class="title">Request appointment</h2>

<div class="doctor-container">
    <table class="table table-md table-hover">
        <thead>
        <tr>
            <th align="center" scope="col">First Name</th>
            <th align="center" scope="col">Last Name</th>
            <th align="center" scope="col">Email</th>
            <th align="center" scope="col">Speciality</th>
            <th align="center" scope="col">Date</th>
            <th align="center" scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="doctor" items="${doctors}">
            <tr>
                <form method="post" action="/appointments">
                    <td align="center">${ doctor.firstName}</td>
                    <td align="center">${ doctor.lastName}</td>
                    <td align="center">${ doctor.email}</td>
                    <td align="center">${ doctor.speciality}</td>
                    <td align="center">
                        <input type="date" name="date" class="form-control form-control-sm">
                    </td>
                    <td align="center">
                        <input type="hidden" value="${doctor.id}" name="doctor">
                        <button class="btn btn-outline-success" type="submit">Book appointment</button>
                    </td>
                </form>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


</body>
</html>
