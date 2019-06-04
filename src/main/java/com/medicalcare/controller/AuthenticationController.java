package com.medicalcare.controller;

import com.medicalcare.metier.IPatientService;
import com.medicalcare.metier.IUserService;
import com.medicalcare.metier.impl.PatientService;
import com.medicalcare.metier.impl.UserService;
import com.medicalcare.model.Patient;
import com.medicalcare.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/auth")
public class AuthenticationController extends HttpServlet {

    private IUserService userService = new UserService();
    private IPatientService patientService = new PatientService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = null;
        String mode = request.getParameter("mode");
        String userType = request.getParameter("usertype");
        User user = null;
        if (mode != null) {
            if (mode.equals("logout")) {
                response.sendRedirect("/");
                return;
            } else if (mode.equals("register")) {
                // registration business
                if (request.getParameter("password").equals(request.getParameter("password2"))) {
                    user = patientService.createPatient(new Patient(populateUser(request), null, null));
                    request.removeAttribute("error");
                    request.removeAttribute("errorPassword");
                } else {
                    request.setAttribute("errorPassword", "Password and confirmation should match");
                    page = "/views/index.jsp";
                }

            } else {
                // login business
                user = userService.authenticateUser(populateUser(request));
                if (user == null) {
                    request.setAttribute("error", "Invalid username/password");
                    page = "/views/index.jsp";
                }
            }
        }

        // Redirection business logic
        if (user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("connectedUser", user);
            session.setAttribute("connectedRole", user.getRole());
            request.setAttribute("username", user.getUsername());
            if (user.getRole().equals("PATIENT")) {
                if (!user.isProfileUpdated())
                    page = "/views/patient-profile-update.jsp";
            } else if (user.getRole().equals("DOCTOR")) {
                page = "/views/doctor-home.jsp";
            } else {
                response.sendRedirect(request.getContextPath() + "/admin");
                return;
            }
        }

        if (page == null) {
            response.sendRedirect(request.getContextPath() + "/patient-profile?login=true");
            return;
        }
        request.getServletContext().getRequestDispatcher(page).forward(request, response);
    }

    private User populateUser(HttpServletRequest request) {
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        if (request.getParameter("mode").equals("register")) {
            user.setEmail(request.getParameter("email"));
            user.setFirstName(request.getParameter("firstName"));
            user.setLastName(request.getParameter("lastName"));
            user.setAddress(request.getParameter("address"));
            user.setAddress2(request.getParameter("address2"));
        }
        return user;
    }
}