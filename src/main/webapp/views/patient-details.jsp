<%--
  Created by IntelliJ IDEA.
  User: ZiOS
  Date: 2019-05-22
  Time: 00:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>${ username} details page</title>

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

<div class="doctor-container">

    <h1>Welcome ${ username}</h1>
</div>

</body>
</html>
