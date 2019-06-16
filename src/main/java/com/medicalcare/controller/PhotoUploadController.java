package com.medicalcare.controller;

import com.medicalcare.metier.IPatientService;
import com.medicalcare.metier.impl.PatientService;
import com.medicalcare.model.MedicalRecord;
import com.medicalcare.model.Patient;
import com.medicalcare.model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

@WebServlet("/photo-upload")
public class PhotoUploadController extends HttpServlet {

    private IPatientService patientService = new PatientService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "/views/patient-home.jsp";
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("connectedUser");
        if (user != null) {
            Patient patient = patientService.getByUsername(user.getUsername());
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);
                // TODO: fixme
                for (FileItem item : multiparts) {
                    if (!item.isFormField() && item.getSize() > 0) {
                        byte[] bytes = IOUtils.toByteArray(item.getInputStream());
                        byte[] encodedPhoto = Base64.getEncoder().encode(bytes);
                        patient.setBase64Photo(new String(encodedPhoto, "UTF-8"));
                    }
                }
            } catch (Exception ex) {
                req.setAttribute("message", "File Upload Failed due to " + ex);
                page = "/views/patient-home.jsp";
            }
            patient = patientService.updatePatient(patient);
            session.setAttribute("patient", patient);
        }

        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }
}