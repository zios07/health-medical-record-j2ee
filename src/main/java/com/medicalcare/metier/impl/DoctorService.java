package com.medicalcare.metier.impl;

import com.medicalcare.metier.IDoctorService;
import com.medicalcare.model.Doctor;
import com.medicalcare.model.User;

import java.util.ArrayList;
import java.util.List;

public class DoctorService implements IDoctorService {

    public static final List<Doctor> DOCTORS = new ArrayList<>();

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
        return DOCTORS;
    }

    @Override
    public Doctor addDoctor(Doctor doctor) {
        DOCTORS.add(doctor);
        return doctor;
    }
}
