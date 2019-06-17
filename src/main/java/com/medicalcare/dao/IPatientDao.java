package com.medicalcare.dao;

import com.medicalcare.model.Patient;

import java.util.List;

public interface IPatientDao {

    Patient savePatient(Patient patient);

    Patient updatePatient(Patient patient);

    List<Patient> getPatients();

    Patient getPatientByUsername(String username);

    Patient getPatientById(Long id);
}
