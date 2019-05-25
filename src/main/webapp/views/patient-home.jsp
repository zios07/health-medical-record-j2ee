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
    <title>Patient Home</title>

    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

    <style>
        .container {
            margin-top: 60px;
        }

        .container-card {
            margin-top: 60px;
        }
    </style>
</head>
<body>

<div class="container">
    
    <h2 align="center">Patient Home</h2>
    <div class="card bg-light text-center container-card">
        <div class="card-header">
            <nav class="patient-nav">
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab"
                       aria-controls="nav-home" aria-selected="true">Profile Infos</a>
                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab"
                       aria-controls="nav-profile" aria-selected="false">Medical Record</a>
                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab"
                       aria-controls="nav-contact" aria-selected="false">Doctor Visits</a>
                </div>
            </nav>
        </div>

        <div class="card-body">

            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <h5 class="card-title">Patient name - Photo</h5>
                    <p class="card-text">Some quick example text to describe the patient profile maybe ?</p>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Username : XXX</li>
                        <li class="list-group-item">Email : XXX</li>
                        <li class="list-group-item">Address : XXX</li>
                        <li class="list-group-item">Address 2 : XXX</li>
                    </ul>
                </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <h5 class="card-title">Here is you medical record data</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Blood group : XXX</li>
                        <li class="list-group-item">Allergies : XXX</li>
                        <li class="list-group-item">Medicines : XXX</li>
                        <li class="list-group-item">Height : XXX</li>
                        <li class="list-group-item">Weight : XXX</li>
                        <li class="list-group-item">Smoker : XXX</li>
                        <li class="list-group-item">Alcohol consumption : XXX</li>
                        <li class="list-group-item">Chronic diseases : XXX</li>
                        <li class="list-group-item">Actual diseases: XXX</li>
                    </ul>
                </div>
                <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                    doctor visits and notes go here :)
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>