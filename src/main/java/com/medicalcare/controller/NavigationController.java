package com.medicalcare.controller;

import com.medicalcare.metier.IPatientService;
import com.medicalcare.metier.impl.PatientService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/navigation")
public class NavigationController extends HttpServlet {

    private IPatientService patientService = new PatientService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = null;
        String requestedPage = req.getParameter("goto");
        switch (requestedPage) {
            case "add-doctor":
                path = "/doctors?mode=add";
                break;
            case "view-doctors":
                path = "/doctors?mode=view";
                break;
            case "book-appointment":
                path = "/appointments?mode=book";
                break;
            case "my-appointments":
                path = "/appointments?mode=view";
                break;
            case "patient-profile":
                path = "/patient-profile";
                break;
            case "doctor-appointments":
                path = "/appointments?mode=view&role=doctor";
                break;
        }
        resp.sendRedirect(path);
    }

}
