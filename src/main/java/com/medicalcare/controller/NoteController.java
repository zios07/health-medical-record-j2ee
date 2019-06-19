package com.medicalcare.controller;

import com.medicalcare.metier.IAppointmentService;
import com.medicalcare.metier.IDoctorService;
import com.medicalcare.metier.INoteService;
import com.medicalcare.metier.IPatientService;
import com.medicalcare.metier.impl.AppointmentService;
import com.medicalcare.metier.impl.DoctorService;
import com.medicalcare.metier.impl.NoteService;
import com.medicalcare.metier.impl.PatientService;
import com.medicalcare.model.Appointment;
import com.medicalcare.model.Doctor;
import com.medicalcare.model.Note;
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

    private IPatientService patientService = new PatientService();
    private INoteService noteService = new NoteService();
    private IAppointmentService appointmentService = new AppointmentService();
    Patient patient = null;
    Appointment appointment = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "/views/doctor/add-note.jsp";
        String patientId = req.getParameter("patientId");
        String appointmentId = req.getParameter("appointmentId");
        if (patientId != null) {
            patient = patientService.getById(Long.parseLong(patientId));
            req.setAttribute("patient", patient);
        }
        if (appointmentId != null) {
            appointment = appointmentService.getAppointmentById(Long.parseLong(appointmentId));
            req.setAttribute("appointment", appointment);
        }
        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "/views/doctor/view-appointments.jsp";
        Boolean updateMedicines = Boolean.valueOf(req.getParameter("updateMedicines"));
        if (updateMedicines) {
            String medicines = req.getParameter("medicines");
            patient.getMedicalRecord().setMedicines(medicines);
            patientService.updatePatient(patient);
        }
        Doctor doctor = (Doctor) req.getSession().getAttribute("connectedUser");
        Note note = new Note(req.getParameter("note"));
        appointment.setNote(note);
        appointmentService.updateAppointment(appointment);
        resp.sendRedirect("/appointments?mode=view&role=doctor");
    }

}
