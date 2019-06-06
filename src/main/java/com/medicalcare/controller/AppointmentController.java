package com.medicalcare.controller;

import com.medicalcare.metier.IAppointmentService;
import com.medicalcare.metier.IDoctorService;
import com.medicalcare.metier.IPatientService;
import com.medicalcare.metier.IUserService;
import com.medicalcare.metier.impl.AppointmentService;
import com.medicalcare.metier.impl.DoctorService;
import com.medicalcare.metier.impl.PatientService;
import com.medicalcare.metier.impl.UserService;
import com.medicalcare.model.Appointment;
import com.medicalcare.model.Doctor;
import com.medicalcare.model.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/appointments")
public class AppointmentController extends HttpServlet {

    private IPatientService patientService = new PatientService();
    private IUserService userService = new UserService();
    private IDoctorService doctorService = new DoctorService();
    private IAppointmentService appointmentService = new AppointmentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = null;
        String mode = req.getParameter("mode");
        String role = req.getParameter("role");
        HttpSession session = req.getSession();
        List<Appointment> appointments = null;
        if (role != null && role.equals("doctor")) {
            Doctor doctor = (Doctor) session.getAttribute("connectedUser");
            page = "/views/doctor/my-appointments.jsp";
            appointments = appointmentService.getAppointmentsByUsername(doctor.getUsername(), doctor.getRole());
            req.setAttribute("appointments", appointments);
        } else {
            switch (mode) {
                case "book":
                    page = "/views/patient/book-appointment.jsp";
                    List<Doctor> doctors = doctorService.getDoctors();
                    req.setAttribute("doctors", doctors);
                    break;
                case "view":
                    Patient patient = (Patient) session.getAttribute("connectedUser");
                    page = "/views/patient/my-appointments.jsp";
                    appointments = appointmentService.getAppointmentsByUsername(patient.getUsername(), patient.getRole());
                    req.setAttribute("appointments", appointments);
                    break;
            }
        }

        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = null;
        String date = req.getParameter("date");
        HttpSession session = req.getSession();

        if (session.getAttribute("connectedRole") != null) {

            if (session.getAttribute("connectedRole").equals("PATIENT") && req.getParameter("doctor") != null) {
                page = "/views/patient/book-appointment.jsp";
                Long doctorID = Long.valueOf(req.getParameter("doctor"));
                Doctor doctor = doctorService.getDoctorByID(doctorID);
                Patient patient = (Patient) session.getAttribute("connectedUser");
                Date bookingDate = null;
                try {
                    bookingDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                appointmentService.createAppointment(new Appointment(doctor, patient, bookingDate, "N"));
                List<Appointment> appointments = appointmentService.getAppointmentsByUsername(patient.getUsername(), patient.getRole());
                List<Doctor> doctors = doctorService.getDoctors();
                List<Long> reservedDoctors = appointments.stream().map(Appointment::getId).collect(Collectors.toList());
                req.setAttribute("reservedDoctors", reservedDoctors);
                req.setAttribute("doctors", doctors);

            } else if (session.getAttribute("connectedRole").equals("DOCTOR")) {
                page = "/views/doctor/my-appointments.jsp";
                Doctor doctor = (Doctor) session.getAttribute("connectedUser");
                Long appointmentID = Long.valueOf(req.getParameter("appointmentID"));
                Appointment appointment = appointmentService.getAppointmentById(appointmentID);
                String action = req.getParameter("action");
                switch (action) {
                    case "accept":
                        appointment.setStatus("A");
                        appointmentService.updateAppointment(appointment);
                        break;
                    case "reject":
                        appointment.setStatus("R");
                        appointmentService.updateAppointment(appointment);
                        break;
                }
                List<Appointment> appointments = appointmentService.getAppointmentsByUsername(doctor.getUsername(), doctor.getRole());
                req.setAttribute("appointments", appointments);
            }
        }

        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }

}
