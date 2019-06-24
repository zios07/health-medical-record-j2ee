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
        .register {
            background: -webkit-linear-gradient(left, #3931af, #00c6ff);
            margin-top: 3%;
            padding: 3%;
        }

        .register-left {
            text-align: center;
            color: #fff;
            margin-top: 4%;
        }

        .register-left input {
            border: none;
            border-radius: 1.5rem;
            padding: 2%;
            width: 60%;
            background: #f8f9fa;
            font-weight: bold;
            color: #383d41;
            margin-top: 30%;
            margin-bottom: 3%;
            cursor: pointer;
        }

        .register-right {
            background: #f8f9fa;
            border-top-left-radius: 10% 50%;
            border-bottom-left-radius: 10% 50%;
        }

        .register-left img {
            margin-top: 15%;
            margin-bottom: 5%;
            width: 25%;
            -webkit-animation: mover 2s infinite alternate;
            animation: mover 1s infinite alternate;
        }

        @-webkit-keyframes mover {
            0% {
                transform: translateY(0);
            }
            100% {
                transform: translateY(-20px);
            }
        }

        @keyframes mover {
            0% {
                transform: translateY(0);
            }
            100% {
                transform: translateY(-20px);
            }
        }

        .register-left p {
            font-weight: lighter;
            padding: 12%;
            margin-top: -9%;
        }

        .register .register-form {
            padding: 10%;
            margin-top: 10%;
        }

        .btnRegister {
            float: right;
            margin-top: 10%;
            border: none;
            border-radius: 1.5rem;
            padding: 2%;
            background: #0062cc;
            color: #fff;
            font-weight: 600;
            width: 50%;
            cursor: pointer;
        }

        .register .nav-tabs {
            margin-top: 3%;
            border: none;
            background: #0062cc;
            border-radius: 1.5rem;
            width: 28%;
            float: right;
        }

        .register .nav-tabs .nav-link {
            padding: 2%;
            height: 34px;
            font-weight: 600;
            color: #fff;
            border-top-right-radius: 1.5rem;
            border-bottom-right-radius: 1.5rem;
        }

        .register .nav-tabs .nav-link:hover {
            border: none;
        }

        .register .nav-tabs .nav-link.active {
            width: 100px;
            color: #0062cc;
            border: 2px solid #0062cc;
            border-top-left-radius: 1.5rem;
            border-bottom-left-radius: 1.5rem;
        }

        .register-heading {
            text-align: center;
            margin-top: 8%;
            margin-bottom: -15%;
            color: #495057;
        }
    </style>
</head>

<body>
<%--<div class="container-fluid">--%>
<%--    <div class="title-container">--%>
<%--        <h1 align="center">Medical health records application</h1>--%>
<%--    </div>--%>
<%--    <div class="container">--%>

<%--        <div class="row">--%>
<%--            <div class="col-md-5">--%>
<%--                <form role="form" action="/auth" method="post">--%>
<%--                    <fieldset>--%>
<%--                        <p class="text-uppercase pull-center"> Create an Account</p>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="text" name="username" id="username" class="form-control form-control-sm"--%>
<%--                                   placeholder="username" required>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="password" name="password" id="password" class="form-control form-control-sm"--%>
<%--                                   placeholder="Password" required>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="password" name="password2" id="password2" class="form-control form-control-sm"--%>
<%--                                   placeholder="Password confirmation" required>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <input type="email" name="email" id="email" class="form-control form-control-sm"--%>
<%--                                   placeholder="Email Address">--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <input type="text" name="firstName" id="firstName" class="form-control form-control-sm"--%>
<%--                                   placeholder="First Name">--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <input type="text" name="lastName" id="lastName" class="form-control form-control-sm"--%>
<%--                                   placeholder="Last Name">--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="text" name="address" id="address" class="form-control form-control-sm"--%>
<%--                                   placeholder="Address">--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="text" name="address2" id="address2" class="form-control form-control-sm"--%>
<%--                                   placeholder="Address 2 (Optional)">--%>
<%--                        </div>--%>
<%--                        <div>--%>
<%--                            <input type="hidden" name="mode" value="register">--%>
<%--                            <input type="submit" class="btn btn-sm btn-outline-primary" value=" Register">--%>
<%--                        </div>--%>
<%--                        <br>--%>
<%--                        <div>--%>
<%--                            <c:if test="${not empty errorPassword}">--%>
<%--                                <span class="alert alert-danger">--%>
<%--                                    <c:out value="${ errorPassword}"/>--%>
<%--                                </span>--%>
<%--                            </c:if>--%>
<%--                        </div>--%>

<%--                    </fieldset>--%>
<%--                </form>--%>
<%--            </div>--%>

<%--            <div class="col-md-2">--%>
<%--                <!-------null------>--%>
<%--            </div>--%>

<%--            <div class="col-md-5">--%>
<%--                <form role="form" action="/auth" method="post">--%>
<%--                    <fieldset>--%>
<%--                        <p class="text-uppercase"> Login using your account</p>--%>

<%--                        <div class="form-group">--%>
<%--                            <input type="text" name="username" id="lgUsername" class="form-control form-control-sm"--%>
<%--                                   placeholder="username" required>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="password" name="password" id="lgPassword" class="form-control form-control-sm"--%>
<%--                                   placeholder="Password" required>--%>
<%--                        </div>--%>

<%--                        <div>--%>
<%--                            <input type="hidden" name="mode" value="login">--%>
<%--                            <input type="submit" class="btn btn-sm btn-outline-primary" value="Sign In">--%>
<%--                        </div>--%>
<%--                        <br>--%>
<%--                        <div>--%>
<%--                            <c:if test="${not empty error}">--%>
<%--                                <span class="alert alert-danger">--%>
<%--                                    <c:out value="${ error}"/>--%>
<%--                                </span>--%>
<%--                            </c:if>--%>
<%--                        </div>--%>

<%--                    </fieldset>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!------ Include the above in your HEAD tag ---------->

<div class="container register">
    <div class="row">
        <div class="col-md-3 register-left">
            <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
            <h3>Welcome</h3>
            <p>You are 30 seconds away from being healthy!</p>
            <input type="submit" name="" value="Login"/><br/>
        </div>
        <div class="col-md-9 register-right">
            <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                       aria-controls="home" aria-selected="true">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                       aria-controls="profile" aria-selected="false">Login</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <h3 class="register-heading">Create your account</h3>
                    <form role="form" action="/auth" method="post">
                        <div class="row register-form">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" name="username" id="username"
                                           class="form-control form-control-sm"
                                           placeholder="username" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" id="password"
                                           class="form-control form-control-sm"
                                           placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password2" id="password2"
                                           class="form-control form-control-sm"
                                           placeholder="Password confirmation" required>
                                </div>

                                <div class="form-group">
                                    <input type="email" name="email" id="email" class="form-control form-control-sm"
                                           placeholder="Email Address">
                                </div>
                            </div>
                            <div class="col-md-6">

                                <div class="form-group">
                                    <input type="text" name="firstName" id="firstName"
                                           class="form-control form-control-sm"
                                           placeholder="First Name">
                                </div>

                                <div class="form-group">
                                    <input type="text" name="lastName" id="lastName"
                                           class="form-control form-control-sm"
                                           placeholder="Last Name">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="address" id="address" class="form-control form-control-sm"
                                           placeholder="Address">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="address2" id="address2"
                                           class="form-control form-control-sm"
                                           placeholder="Address 2 (Optional)">
                                </div>
                                <div>
                                    <input type="hidden" name="mode" value="register">
                                </div>
                                <input type="submit" class="btnRegister" value="Login"/>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <h3 class="register-heading">Sign in</h3>
                    <form role="form" action="/auth" method="post">
                        <div class="row register-form">
                            <div class="col-md-6">

                                <div class="form-group">
                                    <input type="text" name="username" id="lgUsername"
                                           class="form-control form-control-sm"
                                           placeholder="username" required>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <input type="password" name="password" id="lgPassword"
                                       class="form-control form-control-sm"
                                       placeholder="Password" required>
                            </div>

                            <div>
                                <input type="hidden" name="mode" value="login">
                            </div>
                            <input type="submit" class="btnRegister" value="Register"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</div>

</body>


</html>