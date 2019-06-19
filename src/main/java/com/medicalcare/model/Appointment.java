package com.medicalcare.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "APPOINTMENT_TABLE")
public class Appointment {

    @Id
    @GeneratedValue
    private long id;

    @ManyToOne
    private Doctor doctor;

    @ManyToOne
    private Patient patient;

    private Date date;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "note_id")
    private Note note;

    // N : New , A : Accepted, R : Rejected
    private String status;

    public Appointment() {
        this.status = "N";
    }

    public Appointment(Doctor doctor, Patient patient, Date date, Note note, String status) {
        this.doctor = doctor;
        this.patient = patient;
        this.date = date;
        this.note = note;
        this.status = status;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Note getNote() {
        return note;
    }

    public void setNote(Note note) {
        this.note = note;
    }
}
