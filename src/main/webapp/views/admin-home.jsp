<%--
  Created by IntelliJ IDEA.
  User: ZiOS
  Date: 2019-05-25
  Time: 00:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            margin-top: 60px;
        }

        .container-card {
            margin-top: 60px;
        }
    </style>
</head>
<body>
<h1 align="center">Admin Home</h1>

<div class="doctor-container">

    <div class="row">
        <div class="col-md-6">
            <form role="form" action="/create-doctor" method="post">
                <fieldset>
                    <p class="text-uppercase pull-center"> Create new Doctor</p>
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
                               placeholder="Speciality">
                    </div>
                    <div>
                        <input type="submit" class="btn btn-sm btn-outline-primary" value="Create Doctor">
                    </div>
                    <br>

                </fieldset>
            </form>
        </div>
        <div class="col-md-6">
            <p class="text-uppercase pull-center"> Available Doctors</p>
            <table class="table table-hover table-dark">
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
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
