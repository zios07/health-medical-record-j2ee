package com.medicalcare.controller;

import com.medicalcare.metier.IDoctorService;
import com.medicalcare.metier.impl.DoctorService;
import com.medicalcare.model.Doctor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    private IDoctorService doctorService = new DoctorService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "/views/admin-home.jsp";
        List<Doctor> doctors = doctorService.getDoctors();
        req.setAttribute("doctors", doctors);
        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "/views/admin-home.jsp";
        Doctor doctor = populateDoctor(req);
        doctorService.addDoctor(doctor);
        req.setAttribute("doctors", doctorService.getDoctors());
        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }

    private Doctor populateDoctor(HttpServletRequest request) {
        Doctor doc = new Doctor();
        doc.setUsername(request.getParameter("username"));
        doc.setPassword(request.getParameter("password"));
        doc.setSpeciality(request.getParameter("speciality"));
        doc.setEmail(request.getParameter("email"));
        doc.setFirstName(request.getParameter("firstName"));
        doc.setLastName(request.getParameter("lastName"));
        doc.setAddress(request.getParameter("address"));
        doc.setAddress2(request.getParameter("address2"));
        return doc;
    }

}
