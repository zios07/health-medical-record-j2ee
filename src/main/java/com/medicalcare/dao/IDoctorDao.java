package com.medicalcare.dao;

import com.medicalcare.model.Doctor;

import java.util.List;

public interface IDoctorDao {

    Doctor saveDoctor(Doctor doctor);

    Doctor updateDoctor(Doctor doctor);

    List<Doctor> getDoctors();

    Doctor getDoctorByUsername(String username);
}
