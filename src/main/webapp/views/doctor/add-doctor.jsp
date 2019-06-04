<%--
  Created by IntelliJ IDEA.
  User: ZiOS
  Date: 2019-06-03
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Create new doctor</title>
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

<h2 align="center" class="title">Create new Doctor</h2>

<div class="doctor-container">
    <div class="col-6 mx-auto">
        <div class="nauk-info-connections text-center">

            <form role="form" action="/admin" method="post">
                <fieldset>
                    <div class="form-group">
                        <input type="text" name="username" id="username" class="form-control form-control-sm"
                               placeholder="username" required>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" id="password" class="form-control form-control-sm"
                               placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" id="email" class="form-control form-control-sm"
                               placeholder="Email Address">
                    </div>

                    <div class="form-group">
                        <input type="text" name="firstName" id="firstName" class="form-control form-control-sm"
                               placeholder="First Name">
                    </div>

                    <div class="form-group">
                        <input type="text" name="lastName" id="lastName" class="form-control form-control-sm"
                               placeholder="Last Name">
                    </div>
                    <div class="form-group">
                        <input type="text" name="address" id="address" class="form-control form-control-sm"
                               placeholder="Address">
                    </div>
                    <div class="form-group">
                        <input type="text" name="address2" id="address2" class="form-control form-control-sm"
                               placeholder="Address 2 (Optional)">
                    </div>
                    <div class="form-group">
                        <input type="text" name="speciality" id="speciality" class="form-control form-control-sm"
                               placeholder="Speciality" required>
                    </div>
                    <div>
                        <input type="submit" class="btn btn-sm btn-outline-primary" value="Create Doctor">
                    </div>
                    <br>
                </fieldset>
            </form>
        </div>
    </div>
</div>
</body>
</html>
