<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZiOS
  Date: 2019-06-03
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nav</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light rounded">
    <a class="navbar-brand">Medical Record</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarsExample09" aria-controls="navbarsExample09"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExample09">
        <ul class="navbar-nav mr-auto">

            <!--Admin menu-->
            <c:if test="${sessionScope.get('connectedRole') eq 'ADMIN'}">
                <li class="nav-item dropdown active"><a
                        class="nav-link dropdown-toggle" id="dropdown09"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Doctors</a>
                    <form action="/navigation" method="post" class="dropdown-menu">
                        <button type="submit" name="goto" class="btn dropdown-item"
                                value="add-doctor">Add doctor
                        </button>
                        <button type="submit" name="goto" class="btn dropdown-item"
                                value="view-doctors">View doctors
                        </button>
                    </form>
                </li>
            </c:if>

            <!--Patient menu-->
            <c:if test="${sessionScope.get('connectedRole') eq 'PATIENT'}">
                <li class="nav-item dropdown active"><a
                        class="nav-link dropdown-toggle" id="dropdown10"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Appointments</a>
                    <form action="/navigation" method="post" class="dropdown-menu">
                        <button type="submit" name="goto" class="btn dropdown-item"
                                value="book-appointment">Book new appointment
                        </button>
                        <button type="submit" name="goto" class="btn dropdown-item"
                                value="my-appointments">My appointments
                        </button>
                    </form>
                </li>

                <li class="nav-item dropdown active"><a
                        class="nav-link dropdown-toggle" id="dropdown11"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My
                    Profile</a>
                    <form action="/navigation" method="post" class="dropdown-menu">
                        <button type="submit" name="goto" class="btn dropdown-item"
                                value="patient-profile">View Profile
                        </button>
                    </form>
                </li>
            </c:if>

            <!--Doctor menu-->
            <c:if test="${sessionScope.get('connectedRole') eq 'DOCTOR'}">
                <li class="nav-item dropdown active"><a
                        class="nav-link dropdown-toggle" id="dropdown12"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Appointments</a>
                    <form action="/navigation" method="post" class="dropdown-menu">
                        <button type="submit" name="goto" class="btn dropdown-item"
                                value="doctor-appointments">View Appointments
                        </button>
                    </form>
                </li>

            </c:if>


        </ul>

        <form class="form-inline my-2 my-md-0" method="post" action="/auth">
            <button class="btn btn-outline-danger" value="logout" name="mode"
                    type="submit">Logout
            </button>
            <c:if test="${sessionScope.get('connectedRole') eq 'PATIENT'}">
                <img alt="img" width="80"
                     src="data:image/jpeg;base64,${sessionScope.patient.base64Photo}" style="margin-left: 30px"/>
            </c:if>

            <c:if test="${sessionScope.get('connectedRole') eq 'DOCTOR'}">
                <img alt="img" width="80"
                     src="data:image/jpeg;base64,${sessionScope.connectedUser.base64Photo}" style="margin-left: 30px"/>
            </c:if>
        </form>
    </div>
</nav>
</body>
</html>


