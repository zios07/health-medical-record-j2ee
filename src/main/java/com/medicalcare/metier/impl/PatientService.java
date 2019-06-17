package com.medicalcare.metier.impl;

import com.medicalcare.dao.IPatientDao;
import com.medicalcare.dao.impl.PatientDao;
import com.medicalcare.metier.IPatientService;
import com.medicalcare.model.Patient;

import java.util.List;

public class PatientService implements IPatientService {

    private IPatientDao patientDao = new PatientDao();

    @Override
    public Patient createPatient(Patient patient) {
        patient.setRole("PATIENT");
        return patientDao.savePatient(patient);
    }

    @Override
    public Patient updateProfile(Patient patient) {
        return patientDao.updatePatient(patient);
    }

    @Override
    public Patient getById(Long id) {
        return patientDao.getPatientById(id);
    }

    @Override
    public List<Patient> getPatients() {
        return null;
    }

    @Override
    public Patient getByUsername(String username) {
        return patientDao.getPatientByUsername(username);
    }

    @Override
    public Patient updatePatient(Patient patient) {
        return patientDao.updatePatient(patient);
    }
}
