package com.medicalcare.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table( name = "DOCTOR_TABLE")
public class Doctor extends User {

    private String speciality;

    public Doctor() {

    }

    public Doctor(User u, String speciality) {
        super(u);
        this.speciality = speciality;
    }

    public Doctor(String username, String password, String firstName, String lastName, String email, String address, String address2, String role, byte[] photo, String speciality, boolean profileUpdated) {
        super(username, password, firstName, lastName, email, address, address2, role, photo, profileUpdated);
        this.speciality = speciality;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }
}
