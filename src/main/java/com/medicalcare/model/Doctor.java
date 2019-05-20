package com.medicalcare.model;

public class Doctor extends User {

    private String speciality;

    public Doctor(String speciality) {
        this.speciality = speciality;
    }

    public Doctor(long id, String username, String password, String firstName, String lastName, String email, String address, String address2, String role, byte[] photo, String speciality) {
        super(id, username, password, firstName, lastName, email, address, address2, role, photo);
        this.speciality = speciality;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }
}
