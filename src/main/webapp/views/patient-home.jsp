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

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="http://www.chartjs.org/dist/2.6.0/Chart.bundle.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link rel="stylesheet/less" type="text/css" href="../style/app.less"/>

    <style>
        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }

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
                    <div style="width:75%;margin-left: 200px">
                        <canvas id="canvas"></canvas>
                    </div>
                    <br>
                    <br>
                    <br>
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
    docraptorJavaScriptFinished = function() {
        var chartCanvas = document.getElementById("canvas");

        // do not do anything unless the chart is finished rendering
        if (chartCanvas == null || chartCanvas.style.length < 1) {
            return false;
        }

        // dump the canvas to an img tag
        var imageElement = document.createElement("img");
        imageElement.style = "width: 100%;";
        imageElement.src = chartCanvas.toDataURL("image/png", 0);
        chartCanvas.remove();
        document.body.appendChild(imageElement);
        return true;
    }
</script>



<script>
    /* global Chart */
    /* Based on chartjs.org example at http://www.chartjs.org/samples/latest/charts/line/multi-axis.html */

    'use strict';

    window.chartColors = {
        red: 'rgb(255, 99, 132)',
        orange: 'rgb(255, 159, 64)',
        yellow: 'rgb(255, 205, 86)',
        green: 'rgb(75, 192, 192)',
        blue: 'rgb(54, 162, 235)',
        purple: 'rgb(153, 102, 255)',
        grey: 'rgb(201, 203, 207)'
    };

    window.randomScalingFactor = function() {
        return (Math.random() > 0.5 ? 1.0 : -1.0) * Math.random() * 100;
    };

    (function(global) {
        var Months = [
            'January',
            'February',
            'March',
            'April',
            'May',
            'June',
            'July',
            'August',
            'September',
            'October',
            'November',
            'December'
        ];

        var Samples = global.Samples || (global.Samples = {});
        Samples.utils = {
            // Adapted from http://indiegamr.com/generate-repeatable-random-numbers-in-js/
            srand: function(seed) {
                this._seed = seed;
            },

            rand: function(min, max) {
                var seed = this._seed;
                min = min === undefined ? 0 : min;
                max = max === undefined ? 1 : max;
                this._seed = (seed * 9301 + 49297) % 233280;
                return min + (this._seed / 233280) * (max - min);
            },

            numbers: function(config) {
                var cfg = config || {};
                var min = cfg.min || 0;
                var max = cfg.max || 1;
                var from = cfg.from || [];
                var count = cfg.count || 8;
                var decimals = cfg.decimals || 8;
                var continuity = cfg.continuity || 1;
                var dfactor = Math.pow(10, decimals) || 0;
                var data = [];
                var i, value;

                for (i = 0; i < count; ++i) {
                    value = (from[i] || 0) + this.rand(min, max);
                    if (this.rand() <= continuity) {
                        data.push(Math.round(dfactor * value) / dfactor);
                    } else {
                        data.push(null);
                    }
                }

                return data;
            },

            labels: function(config) {
                var cfg = config || {};
                var min = cfg.min || 0;
                var max = cfg.max || 100;
                var count = cfg.count || 8;
                var step = (max - min) / count;
                var decimals = cfg.decimals || 8;
                var dfactor = Math.pow(10, decimals) || 0;
                var prefix = cfg.prefix || '';
                var values = [];
                var i;

                for (i = min; i < max; i += step) {
                    values.push(prefix + Math.round(dfactor * i) / dfactor);
                }

                return values;
            },

            months: function(config) {
                var cfg = config || {};
                var count = cfg.count || 12;
                var section = cfg.section;
                var values = [];
                var i, value;

                for (i = 0; i < count; ++i) {
                    value = Months[Math.ceil(i) % 12];
                    values.push(value.substring(0, section));
                }

                return values;
            },

            transparentize: function(color, opacity) {
                var alpha = opacity === undefined ? 0.5 : 1 - opacity;
                return Chart.helpers.color(color).alpha(alpha).rgbString();
            },

            merge: Chart.helpers.configMerge
        };

        Samples.utils.srand(Date.now());

    }(this));
</script>
<script>
    var lineChartData = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [{
            label: "Blood preasure",
            borderColor: window.chartColors.red,
            backgroundColor: window.chartColors.red,
            fill: false,
            data: [
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor()
            ],
            yAxisID: "y-axis-1",
        }, {
            label: "Alcohol consumption",
            borderColor: window.chartColors.blue,
            backgroundColor: window.chartColors.blue,
            fill: false,
            data: [
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor()
            ],
            yAxisID: "y-axis-2"
        }]
    };

    window.onload = function() {
        var ctx = document.getElementById("canvas").getContext("2d");
        window.myLine = Chart.Line(ctx, {
            data: lineChartData,
            options: {
                responsive: true,
                hoverMode: 'index',
                stacked: false,
                title: {
                    display: true,
                    text: ''
                },
                scales: {
                    yAxes: [{
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "left",
                        id: "y-axis-1",
                    }, {
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "right",
                        id: "y-axis-2",

                        // grid line settings
                        gridLines: {
                            drawOnChartArea: false, // only want the grid lines for one axis to show up
                        },
                    }],
                }
            }
        });
    };
</script>

</body>
</html>
