package com.medicalcare.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table( name = "VISIT_TABLE")
public class Visit {

    @Id
    @GeneratedValue
    private long id;
    @ManyToOne
    private Patient patient;
    @ManyToOne
    private Doctor doctor;
    private Date date;
    private String node;

    public Visit() {
    }

    public Visit(long id, Patient patient, Doctor doctor, Date date, String node) {
        this.id = id;
        this.patient = patient;
        this.doctor = doctor;
        this.date = date;
        this.node = node;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getNode() {
        return node;
    }

    public void setNode(String node) {
        this.node = node;
    }
}
