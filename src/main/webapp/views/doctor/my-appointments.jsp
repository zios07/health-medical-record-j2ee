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
    <title>My Appointments</title>
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

        .alert {
            display: flex;
            flex-direction: row;
        }

        .alert .glyphicon {
            margin-right: 8px;
            align-self: center;
        / / if you want it centered vertically
        }
    </style>
</head>
<body>

<jsp:include page="../navbar.jsp"/>

<h2 align="center" class="title">My Appointments</h2>

<div class="doctor-container">
    <table class="table table-md table-hover">
        <thead>
        <tr>
            <th scope="col">Patient</th>
            <th scope="col">Date</th>
            <th scope="col">Status</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="appointment" items="${appointments}">
            <tr>
                <td>${ appointment.patient.firstName} ${ appointment.patient.lastName}</td>
                <td>${ appointment.date}</td>
                <td>${ appointment.status}</td>
                <td>
                    <c:if test="${appointment.status eq 'N'}">
                        <form method="post" action="/appointments">
                            <input type="hidden" value="${appointment.id}" name="appointmentID" name="doctor">
                            <button class="btn btn-outline-success" name="action" value="accept" type="submit">Accept
                            </button>
                            <button class="btn btn-outline-danger" name="action" value="reject" type="submit">Reject
                            </button>
                        </form>
                    </c:if>
                    <c:if test="${appointment.status eq 'A' && empty appointment.note}">
                        <span class="alert alert-success">Accepted</span>
                        <a class="btn btn-sm btn-outline-primary"
                           href="/patient-note?patientId=${appointment.patient.id}&appointmentId=${appointment.id}">Add
                            note</a>
                    </c:if>
                    <c:if test="${appointment.status eq 'A' && !empty appointment.note}">
                        <span class="alert alert-success">Accepted</span>
                        <span class="alert alert-success">Already added a note to this appointment</span>
                    </c:if>
                    <c:if test="${appointment.status eq 'R'}">
                        <span class="alert alert-warning">Rejected</span>
                    </c:if>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
