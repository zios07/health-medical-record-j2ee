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
    <title>Patient Home</title>

    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.0/angular.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link rel="stylesheet/less" type="text/css" href="../style/app.less"/>

    <style>
        .container-card {
            margin-top: 60px;
        }

        .doctor-container {
            margin: 40px 100px 0;
        }

    </style>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<h2 align="center">Patient Home</h2>

<div class="doctor-container">
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
                    <a class="nav-item nav-link" id="nav-document-tab" data-toggle="tab" href="#nav-documents"
                       role="tab"
                       aria-controls="nav-contact" aria-selected="false">Documents</a>
                </div>
            </nav>
        </div>

        <div class="card-body">

            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade" id="nav-documents" role="tabpanel" aria-labelledby="nav-document-tab">
                    <ul class="list-group">
                        <li>
                            <button class="btn btn-outline-primary">Upload</button>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <form action="/photo-upload" method="post" enctype="multipart/form-data">
                        <h5 class="card-title">${sessionScope.patient.firstName} ${sessionScope.patient.lastName}
                        </h5>

                        <img alt="img" width="80"
                             src="data:image/jpeg;base64,${sessionScope.patient.base64Photo}"
                             style="margin-left: 30px"/>
                        <input type="file" id="upload" name="photo"
                               style="visibility: hidden; font-size: small; width: 1px; height: 1px"/>
                        <a href="" onclick="document.getElementById('upload').click(); return false">Edit</a>
                        <button type="submit" class="btn btn-sm btn-outline-success">Save</button>
                    </form>

                    <c:choose>
                        <c:when test="${not empty action}">
                            <ul class="list-group list-group-flush">
                                <div class="container">

                                    <div class="row">
                                        <div class="col-md-5 col-md-offset-5">

                                        </div>
                                        <form action="/patient-profile">
                                            <li class="list-group-item">Username
                                                : ${sessionScope.patient.username}</li>
                                            <input type="hidden" class="form-control" name="action"
                                                   value="perform-edit"/>
                                            <input type="email" class="form-control" name="email"
                                                   value="${sessionScope.patient.email}" placeholder="Email"/>
                                            <input type="text" class="form-control" name="address"
                                                   value="${sessionScope.patient.address}" placeholder="Address"/>
                                            <input type="text" class="form-control" name="address2"
                                                   value="${sessionScope.patient.address2}" placeholder="Address 2"/>
                                            <button type="submit" class="btn btn-sm btn-outline-success">Save
                                            </button>
                                        </form>

                                    </div>
                                </div>

                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Username : ${sessionScope.patient.username}</li>
                                <li class="list-group-item">Email : ${sessionScope.patient.email}</li>
                                <li class="list-group-item">Address : ${sessionScope.patient.address}</li>
                                <li class="list-group-item">Address 2 : ${sessionScope.patient.address2}</li>
                            </ul>

                            <form action="/patient-profile">
                                <input type="hidden" class="form-control" name="action"
                                       value="request-edit"/>
                                <button type="submit" class="btn btn-sm btn-outline-primary">Edit profile</button>
                            </form>
                        </c:otherwise>
                    </c:choose>

                </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <h5 class="card-title">Here is you medical record data</h5>
<%--                    <main ng-app="myApp">--%>
<%--                        <figure ng-controller="graphCtrl">--%>
<%--                            {{sampleData}}--%>
<%--                            <div graph data="sampleData">--%>
<%--                                <div>--%>
<%--                                    <span data-point></span>--%>
<%--                                </div>--%>
<%--                                <div>--%>
<%--                                    <span data-point></span>--%>
<%--                                </div>--%>
<%--                                <div>--%>
<%--                                    <span data-point></span>--%>
<%--                                </div>--%>
<%--                                <div>--%>
<%--                                    <span data-point></span>--%>
<%--                                </div>--%>
<%--                                <div>--%>
<%--                                    <span data-point></span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <figcaption>Hover a section for details.</figcaption>--%>
<%--                        </figure>--%>
<%--                    </main>--%>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Blood group : ${sessionScope.patient.medicalRecord.bloodGroup}</li>
                        <li class="list-group-item">Allergies : ${sessionScope.patient.medicalRecord.allergies}</li>
                        <li class="list-group-item">Medicines : ${sessionScope.patient.medicalRecord.medicines}</li>
                        <li class="list-group-item">Height : ${sessionScope.patient.medicalRecord.height}</li>
                        <li class="list-group-item">Weight : ${sessionScope.patient.medicalRecord.weight}</li>
                        <li class="list-group-item">Smoker : ${sessionScope.patient.medicalRecord.smoker}</li>
                        <li class="list-group-item">Alcohol consumption
                            : ${sessionScope.patient.medicalRecord.alcoholConsumption}</li>
                        <li class="list-group-item">Chronic diseases
                            : ${sessionScope.patient.medicalRecord.chronicDiseases}</li>
                        <li class="list-group-item">Actual
                            diseases: ${sessionScope.patient.medicalRecord.actualDiseases}</li>
                    </ul>
                </div>
                <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">

                    <c:forEach var="appointment" items="${appointments}">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <img alt="img" width="80"
                                     src="data:image/jpeg;base64,${appointment.doctor.base64Photo}"
                                     style="margin-left: 30px"/>
                            </li>
                            <li class="list-group-item"><b>Doctor
                                : </b> ${appointment.doctor.firstName} ${appointment.doctor.lastName}</li>
                            <li class="list-group-item"><b>Appointment date : </b> ${appointment.date}</li>
                            <li class="list-group-item"><b>Note : </b> ${appointment.note.note}</li>
                            <li class="list-group-item"><b>Medicines
                                : </b> ${appointment.patient.medicalRecord.medicines}</li>
                        </ul>
                        <br>
                        <br>
                        <br>
                        <br>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</div>

<script>


    angular.module('myApp', []).directive('graph', function () {
        return {
            restrict: 'A',
            link: function (scope, elm, attr) {
                var points = elm[0].querySelectorAll('[data-point]');

                // graph data provided by the "data" attribute.
                // NB: data is interpreted as percentages
                scope.$watch(attr.data, function (data) {
                    angular.forEach(data, function (val, i) {
                        var pt = points[i]
                            , psty = pt && pt.style;

                        if (psty) {
                            var sect = pt.parentNode
                                , sectWidth = sect.offsetWidth
                                , sectHeight = sect.offsetHeight;

                            sect.title = Math.round(100 - val) + '%';
                            psty.top = (val * sectHeight / 100) + 'px';

                            var next = data[i + 1];
                            if (typeof next === 'number') {
                                var delta = (next - val) * sectHeight / 100;

                                psty.height = Math.sqrt(Math.pow(sectWidth, 2) + Math.pow(delta, 2)) + 'px';
                                psty.webkitTransform =
                                    psty.msTransform =
                                        psty.transform =
                                            'rotate(' + (-Math.PI / 2 + Math.atan2(delta, sectWidth)) + 'rad)';
                            }
                        }
                    });
                }, /* deep */ true);

            }
        };
    });

    angular.module('myApp').controller('graphCtrl', ['$scope', function ($scope) {
        $scope.sampleData = [50, 50, 50, 50, 50];

        $scope.sample = function () {
            for (var i = 0, len = $scope.sampleData.length; i < len; i++) {
                $scope.sampleData[i] = (Math.random() * 90) + 5;
            }
        };

        $scope.sample();
        $scope.sampler = setInterval(function () {
            $scope.$apply($scope.sample);
        }, 2000);
    }]);

</script>
</body>
</html>
