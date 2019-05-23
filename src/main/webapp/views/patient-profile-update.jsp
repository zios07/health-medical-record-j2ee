<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<title>Health medical record</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<head>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

    <style>
        .alert {
            font-size: 0.8em;
            margin-bottom: 30px;
        }

        .title-container {
            margin: 50px;
        }
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="title-container">
        <h1 align="center">Please complete updating your profile, ${ patientName}</h1>
    </div>
    <div class="container">

        <div class="row">
            <div class="col-md-5">
                <form role="form" action="/patient-profile" method="post">
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
                            <input type="password" name="password2" id="password2" class="form-control form-control-sm"
                                   placeholder="Password confirmation" required>
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
                            <input type="address" name="address" id="address" class="form-control form-control-sm"
                                   placeholder="Address">
                        </div>
                        <div class="form-group">
                            <input type="address2" name="address2" id="address2" class="form-control form-control-sm"
                                   placeholder="Address 2 (Optional)">
                        </div>
                        <div>
                            <input type="hidden" name="mode" value="register">
                            <input type="submit" class="btn btn-sm btn-outline-primary" value=" Register">
                        </div>
                        <br>
                        <div>
                            <c:if test="${not empty errorPassword}">
                                <span class="alert alert-danger">
                                    <c:out value="${ errorPassword}"/>
                                </span>
                            </c:if>
                        </div>

                    </fieldset>
                </form>
            </div>

            <div class="col-md-2">
                <!-------null------>
            </div>

        </div>
    </div>
</div>
</body>


</html>