package com.medicalcare.model;

import java.util.List;

public class Patient extends User {

    private List<Visit> visits;
    private MedicalRecord medicalRecord;

    public Patient() {

    }

    public List<Visit> getVisits() {
        return visits;
    }

    public void setVisits(List<Visit> visits) {
        this.visits = visits;
    }

    public MedicalRecord getMedicalRecord() {
        return medicalRecord;
    }

    public void setMedicalRecord(MedicalRecord medicalRecord) {
        this.medicalRecord = medicalRecord;
    }
}
