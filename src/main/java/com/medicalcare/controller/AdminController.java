package com.medicalcare.controller;

import com.medicalcare.metier.IDoctorService;
import com.medicalcare.metier.impl.DoctorService;
import com.medicalcare.model.Doctor;
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
        String page = "/views/doctor/view-doctors.jsp";
        Doctor doc = new Doctor();
        try {
            List<FileItem> multipartFields = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);
            List<MultipartField> fields = new ArrayList<>();
            String base64Photo = null;
            for (FileItem item : multipartFields) {
                if (!item.isFormField()) {
                    byte[] bytes = IOUtils.toByteArray(item.getInputStream());
                    byte[] encodedPhoto = Base64.getEncoder().encode(bytes);
                    base64Photo = new String(encodedPhoto, "UTF-8");
                } else {
                    fields.add(new MultipartField(item.getFieldName(), item.getString()));
                }
            }
            doc = populateDoctor(fields);
            doc.setBase64Photo(base64Photo);
        } catch (Exception ex) {
            req.setAttribute("message", "Adding doctor Failed due to " + ex);
            page = "/views/doctor/add-doctor.jsp";
        }
        doctorService.addDoctor(doc);
        req.setAttribute("doctors", doctorService.getDoctors());
        req.getServletContext().getRequestDispatcher(page).forward(req, resp);
    }

    private Doctor populateDoctor(List<MultipartField> fields) {
        Doctor doctor = new Doctor();
        for (MultipartField multipartField : fields) {
            switch (multipartField.name) {
                case "username":
                    doctor.setUsername(multipartField.value);
                    break;
                case "password":
                    doctor.setPassword(multipartField.value);
                    break;
                case "speciality":
                    doctor.setSpeciality(multipartField.value);
                    break;
                case "email":
                    doctor.setEmail(multipartField.value);
                    break;
                case "firstName":
                    doctor.setFirstName(multipartField.value);
                    break;
                case "lastName":
                    doctor.setLastName(multipartField.value);
                    break;
                case "address":
                    doctor.setAddress(multipartField.value);
                    break;
                case "address2":
                    doctor.setAddress2(multipartField.value);
                    break;
            }
        }
        return doctor;
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
