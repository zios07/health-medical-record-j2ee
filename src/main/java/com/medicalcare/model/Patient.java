package com.medicalcare.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table( name = "PATIENT_TABLE")
public class Patient extends User {

    @OneToMany(fetch = FetchType.EAGER)
    private List<Visit> visits;
    @OneToOne(cascade = CascadeType.ALL)
    private MedicalRecord medicalRecord;

    public Patient() {

    }

    public Patient(List<Visit> visits, MedicalRecord medicalRecord) {
        this.visits = visits;
        this.medicalRecord = medicalRecord;
    }

    public Patient(User u, List<Visit> visits, MedicalRecord medicalRecord) {
        super(u);
        this.visits = visits;
        this.medicalRecord = medicalRecord;
    }

    public Patient(String username, String password, String firstName, String lastName, String email, String address, String address2, String role, String photo, boolean profileUpdated, List<Visit> visits, MedicalRecord medicalRecord) {
        super(username, password, firstName, lastName, email, address, address2, role, photo, profileUpdated);
        this.visits = visits;
        this.medicalRecord = medicalRecord;
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

	@Override
	public String toString() {
		return "Patient [visits=" + visits + ", medicalRecord=" + medicalRecord + ", getVisits()=" + getVisits()
				+ ", getMedicalRecord()=" + getMedicalRecord() + ", getId()=" + getId() + ", getUsername()="
				+ getUsername() + ", getPassword()=" + getPassword() + ", getFirstName()=" + getFirstName()
				+ ", getLastName()=" + getLastName() + ", getEmail()=" + getEmail() + ", getAddress()=" + getAddress()
				+ ", getAddress2()=" + getAddress2() + ", getRole()=" + getRole() + ", isProfileUpdated()="
				+ isProfileUpdated() + ", getBase64Photo()=" + getBase64Photo() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}

}
