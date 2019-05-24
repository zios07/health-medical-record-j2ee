package com.medicalcare.controller;

import com.medicalcare.model.MedicalRecord;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/patient-profile")
public class ProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "";
        MedicalRecord medicalRecord = populateMedicalRecordFromRequest(req);

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
