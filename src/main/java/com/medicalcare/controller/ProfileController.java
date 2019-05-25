package com.medicalcare.controller;

import com.medicalcare.metier.IPatientService;
import com.medicalcare.metier.impl.PatientService;
import com.medicalcare.model.MedicalRecord;
import com.medicalcare.model.Patient;
import com.medicalcare.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/patient-profile")
public class ProfileController extends HttpServlet {

    private IPatientService patientService = new PatientService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "/views/patient-home.jsp";
        MedicalRecord medicalRecord = populateMedicalRecordFromRequest(req);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("connectedUser");
        if(user != null) {
            Patient patient = patientService.getByUsername(user.getUsername());
            patient.setMedicalRecord(medicalRecord);
            patient.setProfileUpdated(true);
            patient = patientService.updatePatient(patient);
            session.setAttribute("connectedPatient", patient);
        }
        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }


    private MedicalRecord populateMedicalRecordFromRequest(HttpServletRequest req) {
        MedicalRecord medicalRecord = new MedicalRecord();
        String height = req.getParameter("height");
        String weight = req.getParameter("weight");
        medicalRecord.setBloodGroup(req.getParameter("bloodGroup"));
        medicalRecord.setAllergies(req.getParameter("allergies"));
        medicalRecord.setMedicines(req.getParameter("medicines"));
        medicalRecord.setSmoker(Boolean.valueOf(req.getParameter("smoker")));
        medicalRecord.setAlcoholConsumption(req.getParameter("alcoholConsumption"));
        medicalRecord.setChronicDiseases(req.getParameter("chronicDiseases"));
        medicalRecord.setActualDiseases(req.getParameter("actualDiseases"));
        if (height != null)
            medicalRecord.setHeight(Double.valueOf(height));
        if (weight != null)
            medicalRecord.setWeight(Double.valueOf(weight));
        return medicalRecord;
    }
}
