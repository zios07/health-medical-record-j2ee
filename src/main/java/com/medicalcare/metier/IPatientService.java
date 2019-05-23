package com.medicalcare.metier;

import com.medicalcare.model.Patient;

import java.util.List;

public interface IPatientService {

    Patient updateProfile(Patient patient);

    Patient getById(Long id);

    List<Patient> getPatients();

}
