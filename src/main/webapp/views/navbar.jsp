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
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09"
            aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExample09">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>

            <c:if test="${sessionScope.get('connectedRole') eq 'ADMIN'}">
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" id="dropdown09" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">Doctors</a>
                    <form action="/navigation" method="post" class="dropdown-menu">
                        <button type="submit" name="goto" class="btn dropdown-item" value="add-doctor">Add
                            doctor
                        </button>
                        <button type="submit" name="goto" class="btn dropdown-item" value="view-doctors">View
                            doctors
                        </button>
                    </form>
                </li>
            </c:if>


        </ul>

        <form class="form-inline my-2 my-md-0" method="post" action="/auth">
            <button class="btn btn-outline-danger" value="logout" name="mode" type="submit">Logout</button>
        </form>
    </div>
</nav>
</body>
</html>


