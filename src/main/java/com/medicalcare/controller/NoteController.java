package com.medicalcare.controller;

import com.medicalcare.metier.IDoctorService;
import com.medicalcare.metier.IPatientService;
import com.medicalcare.metier.impl.DoctorService;
import com.medicalcare.metier.impl.PatientService;
import com.medicalcare.model.Doctor;
import com.medicalcare.model.Patient;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@WebServlet("/patient-note")
public class NoteController extends HttpServlet {

    private IDoctorService doctorService = new DoctorService();
    private IPatientService patientService = new PatientService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "/views/doctor/add-note.jsp";
        String patientId = req.getParameter("patientId");
        if(patientId != null) {
            Patient patient = patientService.getById(Long.parseLong(patientId));
            req.setAttribute("patient", patient);
        }
        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "/views/doctor/view-doctors.jsp";
        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }

}
