package com.medicalcare.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table( name = "PATIENT_TABLE")
public class Patient extends User {

    @OneToMany
    private List<Visit> visits;
    @OneToOne(cascade = CascadeType.ALL)
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
