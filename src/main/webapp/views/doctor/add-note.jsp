<%--
  Created by IntelliJ IDEA.
  User: ZiOS
  Date: 2019-06-17
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
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


<h2 align="center" class="title">Add a note to Patient</h2>

<div class="doctor-container">
    <div class="nauk-info-connections text-center">

        <form role="form" action="/patient-note" method="post">
            <fieldset>
                <div class="row">
                    <div class="col-4 mx-auto">
                        ${patient.medicalRecord}
                        <ul class="list-group">
                            <li class="list-group-item"><b>First name: </b> ${patient.firstName}</li>
                            <li class="list-group-item"><b>Last name: </b> ${patient.lastName}</li>
                            <li class="list-group-item"><b>Email : </b> ${patient.email} </li>
                            <li class="list-group-item"><b>Medicines : </b> ${patient.medicalRecord.medicines}</li>
                            <li class="list-group-item"><b>Blood group : </b> ${patient.medicalRecord.bloodGroup}</li>
                            <li class="list-group-item"><b>Allergies : </b> ${patient.medicalRecord.allergies}</li>
                            <li class="list-group-item"><b>height : </b> ${patient.medicalRecord.height}</li>
                            <li class="list-group-item"><b>Weight : </b> ${patient.medicalRecord.weight}</li>
                            <li class="list-group-item"><b>Smoker : </b> ${patient.medicalRecord.smoker}</li>
                            <li class="list-group-item"><b>Alcohol consumption : </b> ${patient.medicalRecord.alcoholConsumption}</li>
                            <li class="list-group-item"><b>Chronic diseases : </b> ${patient.medicalRecord.chronicDiseases}</li>
                            <li class="list-group-item"><b>Actual diseases : </b> ${patient.medicalRecord.actualDiseases}</li>
                        </ul>
                    </div>
                    <div class="col-8 mx-auto">

                        <div class="form-check">
                            <input type="checkbox" name="updateMedicines" class="form-check-input" id="exampleCheck1"
                                   onclick="document.getElementById('newMedicines').disabled=!this.checked;"/>
                            <label class="form-check-label" for="exampleCheck1">Update medicines</label>
                        </div>
                        <br>
                        <br>
                        <div class="form-group">
                            <input type="text" name="medicines" id="newMedicines" class="form-control"
                                   placeholder="New medicines">
                        </div>

                        <div class="form-group">
                        <textarea name="note" class="form-control form-control-sm"
                                  placeholder="Patient notes .."></textarea>
                        </div>

                        <div>
                            <input type="submit" class="btn btn-sm btn-outline-primary" value="Add note">
                        </div>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>


<script>

    document.getElementById("newMedicines").disabled = true;

</script>
</body>
</html>

