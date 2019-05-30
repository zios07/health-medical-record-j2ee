package com.medicalcare.metier.impl;

import com.medicalcare.dao.IDoctorDao;
import com.medicalcare.dao.impl.DoctorDao;
import com.medicalcare.metier.IDoctorService;
import com.medicalcare.model.Doctor;
import com.medicalcare.model.User;

import java.util.ArrayList;
import java.util.List;

public class DoctorService implements IDoctorService {

    public static final List<Doctor> DOCTORS = new ArrayList<>();
    private IDoctorDao doctorDao = new DoctorDao();

    static {
        User user = new User();
        user.setId(999l);
        user.setFirstName("DOC");
        user.setLastName("Sammad");
        user.setEmail("doctor@demo.com");
        DOCTORS.add(new Doctor(user, "Therapist DEMO"));
    }

    @Override
    public List<Doctor> getDoctors() {
        return doctorDao.getDoctors();
    }

    @Override
    public Doctor addDoctor(Doctor doctor) {
        doctor.setRole("DOCTOR");
        return doctorDao.saveDoctor(doctor);
    }
}
