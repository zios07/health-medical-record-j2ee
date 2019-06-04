<%--
  Created by IntelliJ IDEA.
  User: ZiOS
  Date: 2019-05-25
  Time: 00:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Home</title>

    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

    <style>
        .doctor-container {
            margin: 0 100px;
        }

    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<h1 align="center">Admin Home</h1>

<div class="doctor-container">

    <%--<div class="row">--%>
        <%--<div class="col-md-6">--%>
            <%--<jsp:include page="doctor/add-doctor.jsp"></jsp:include>--%>
        <%--</div>--%>
        <%--<div class="col-md-6">--%>
            <%--<jsp:include page="doctor/view-doctors.jsp"></jsp:include>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>

</body>
</html>
