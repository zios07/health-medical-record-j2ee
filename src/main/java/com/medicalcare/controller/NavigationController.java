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
        String path = "/doctors?mode=";
        String requestedPage = req.getParameter("goto");
        switch (requestedPage) {
            case "add-doctor":
                path += "add";
                break;
            case "view-doctors":
                path += "view";
                break;
        }
        resp.sendRedirect(path);
    }

}
