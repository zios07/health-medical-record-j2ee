package com.medicalcare.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medicalcare.metier.IAppointmentService;
import com.medicalcare.metier.impl.AppointmentService;
import com.medicalcare.model.Appointment;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.medicalcare.metier.IPatientService;
import com.medicalcare.metier.impl.PatientService;
import com.medicalcare.model.MedicalRecord;
import com.medicalcare.model.Patient;
import com.medicalcare.model.User;

@WebServlet("/patient-profile")
public class ProfileController extends HttpServlet {

    private IPatientService patientService = new PatientService();
    private IAppointmentService appointmentService = new AppointmentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "/views/patient-home.jsp";
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("connectedUser");
        Patient patient = patientService.getByUsername(user.getUsername());
        if (req.getParameter("login") == null || !Boolean.valueOf(req.getParameter("login"))) {
            MedicalRecord medicalRecord = populateMedicalRecordFromRequest(req);
            if (user != null) {
                patient.setMedicalRecord(medicalRecord);
                patient.setProfileUpdated(true);
                patient = patientService.updatePatient(patient);
            }
        }
        List<Appointment> appointments = appointmentService.getAppointmentsByUsername(patient.getUsername(), patient.getRole(), "A");
        session.setAttribute("patient", patient);
        req.setAttribute("appointments", appointments);
        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "/views/patient-home.jsp";
        MedicalRecord medicalRecord = null;
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("connectedUser");
        if (user != null) {
            Patient patient = patientService.getByUsername(user.getUsername());
            patient.setProfileUpdated(true);
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);
                List<MultipartField> fields = new ArrayList<>();
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        byte[] bytes = IOUtils.toByteArray(item.getInputStream());
                        byte[] encodedPhoto = Base64.getEncoder().encode(bytes);
                        patient.setBase64Photo(new String(encodedPhoto, "UTF-8"));
                    } else {
                        fields.add(new MultipartField(item.getFieldName(), item.getString()));
                    }
                }
                medicalRecord = resolveMedicalRecord(fields);
            } catch (Exception ex) {
                req.setAttribute("message", "File Upload Failed due to " + ex);
                page = "/views/patient-profile-update.jsp";
            }
            patient.setMedicalRecord(medicalRecord);
            patient = patientService.updatePatient(patient);
            session.setAttribute("patient", patient);
        }

        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }


    private MedicalRecord resolveMedicalRecord(List<MultipartField> fields) {
        MedicalRecord medicalRecord = new MedicalRecord();
        for (MultipartField multipartField : fields) {
            switch (multipartField.name) {
                case "bloodGroup":
                    medicalRecord.setBloodGroup(multipartField.value);
                    break;
                case "allergies":
                    medicalRecord.setAllergies(multipartField.value);
                    break;
                case "medicines":
                    medicalRecord.setMedicines(multipartField.value);
                    break;
                case "height":
                    medicalRecord.setHeight(Double.parseDouble(multipartField.value));
                    break;
                case "weight":
                    medicalRecord.setWeight(Double.parseDouble(multipartField.value));
                    break;
                case "smoker":
                    medicalRecord.setSmoker(Boolean.valueOf(multipartField.value));
                    break;
                case "alcoholConsumption":
                    medicalRecord.setAlcoholConsumption(multipartField.value);
                    break;
                case "chronicDiseases":
                    medicalRecord.setChronicDiseases(multipartField.value);
                    break;
                case "actualDiseases":
                    medicalRecord.setActualDiseases(multipartField.value);
                    break;
            }
        }
        return medicalRecord;
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

    class MultipartField {
        String name;
        String value;

        public MultipartField(String name, String value) {
            this.name = name;
            this.value = value;
        }
    }
}
