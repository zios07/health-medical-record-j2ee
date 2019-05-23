package com.medicalcare.controller;

import com.medicalcare.metier.IUserService;
import com.medicalcare.metier.impl.UserService;
import com.medicalcare.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/auth")
public class AuthenticationServlet extends HttpServlet {

    private IUserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = "/views/patient-details.jsp";
        String mode = request.getParameter("mode");
        User user = null;
        if (mode != null) {
            if (mode.equals("register")) {
                // registration business
                if(request.getParameter("password").equals(request.getParameter("password2"))) {
                    user = userService.createUser(populateUser(request));
                    request.removeAttribute("error");
                    request.removeAttribute("errorPassword");
                } else {
                    request.setAttribute("errorPassword", "Password and confirmation should match");
                    page = "/views/index.jsp";
                }

            } else {
                // login business
                user = userService.authenticateUser(populateUser(request));
                if(user == null) {
                    request.setAttribute("error", "Invalid username/password");
                    page = "/views/index.jsp";
                }
            }
        }
        if(user != null) {
            request.setAttribute("username", user.getUsername());
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