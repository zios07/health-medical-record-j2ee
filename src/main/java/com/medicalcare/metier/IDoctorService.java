package com.medicalcare.metier;

import com.medicalcare.model.Doctor;

import java.util.List;

public interface IDoctorService {
    List<Doctor> getDoctors();

    Doctor addDoctor(Doctor doctor);
}
