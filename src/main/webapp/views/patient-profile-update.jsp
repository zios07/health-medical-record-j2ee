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

        .medicine-input {
            margin-top: 20px;
        }
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="title-container">
        <h1 align="center">Please complete updating your profile, ${ username}</h1>
    </div>
    <div class="container">

        <div class="row">
            <div class="col-md-5">
                <form role="form" action="/patient-profile" method="post" enctype="multipart/form-data">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" type="file" name="photo"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="bloodGroup" id="bloodGroup"
                                   class="form-control form-control-sm medicine-input"
                                   placeholder="Blood Group" required>
                        </div>
                        <div class="form-group">
                            <input type="text" name="allergies" id="allergies" class="form-control form-control-sm"
                                   placeholder="Allergies" required>
                        </div>
                        <div class="form-group">
                            <div id="medicines">
                                <input type="text" name="medicines1" class="form-control form-control-sm"
                                       placeholder="Medicament" required>

                                <input type="date" name="startDate1" class="form-control form-control-sm"
                                       placeholder="Start Date" required>

                                <input type="date" name="endDate1" class="form-control form-control-sm"
                                       placeholder="End Date" required>
                            </div>
                            <input type="button" id="addrows" name="addrows" class="link"
                                   value="Ajouter medicament" onclick="add();">
                        </div>
                        <div class="form-group">
                            <input type="number" name="height" id="height" class="form-control form-control-sm"
                                   placeholder="Height" required>
                        </div>
                        <div class="form-group">
                            <input type="number" name="weight" id="weight" class="form-control form-control-sm"
                                   placeholder="Weight" required>
                        </div>
                        <div class="form-group">
                            Smoker :
                            <input type="radio" checked name="smoker" id="smokerFalse"
                                   class="form-control form-control-sm"
                                   value="false" required> No
                            <input type="radio" name="smoker" id="smokerTrue" class="form-control form-control-sm"
                                   value="true" required> Yes
                        </div>
                        <div class="form-group">
                            <input type="text" name="alcoholConsumption" id="alcoholConsumption"
                                   class="form-control form-control-sm"
                                   placeholder="Alcohol Consumption" required>
                        </div>
                        <div class="form-group">
                            <input type="text" name="chronicDiseases" id="chronicDiseases"
                                   class="form-control form-control-sm"
                                   placeholder="Chronic Diseases" required>
                        </div>
                        <div class="form-group">
                            <input type="text" name="actualDiseases" id="actualDiseases"
                                   class="form-control form-control-sm"
                                   placeholder="Actual Diseases" required>
                        </div>
                        <div>
                            <input type="submit" class="btn btn-sm btn-outline-primary" value=" Update profile">
                        </div>
                        <br>
                        <div>
                            <c:if test="${not empty errorPassword}">
                                <span class="alert alert-danger">
                                    <c:out value="${ errorPassword}"/>
                                </span>
                            </c:if>
                        </div>

                        <div>
                            <c:if test="${not empty message}">
                                <span class="alert alert-danger">
                                    <c:out value="${ message}"/>
                                </span>
                            </c:if>
                        </div>
                    </fieldset>
                </form>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    let i = 2;

    function add() {
        const element = document.createElement("input");
        element.setAttribute("type", "text");
        element.setAttribute("name", "medicines" + i);
        element.setAttribute("class", "form-control form-control-sm medicine-input");
        element.setAttribute("placeholder", "Medicament");

        const element2 = document.createElement("input");
        element2.setAttribute("type", "date");
        element2.setAttribute("name", "startDate" + i);
        element2.setAttribute("class", "form-control form-control-sm medicine-input");
        element2.setAttribute("placeholder", "Start date");

        const element3 = document.createElement("input");
        element3.setAttribute("type", "date");
        element3.setAttribute("name", "endDate" + i);
        element3.setAttribute("class", "form-control form-control-sm medicine-input");
        element3.setAttribute("placeholder", "End date");

        const div = document.getElementById("medicines");
        div.appendChild(element);
        div.appendChild(element2);
        div.appendChild(element3);
        i++;
    }
</script>

</body>


</html>