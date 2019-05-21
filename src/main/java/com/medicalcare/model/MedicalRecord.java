package com.medicalcare.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table( name = "MEDICAL_RECORD_TABLE")
public class MedicalRecord {

    @Id
    @GeneratedValue
    private long id;
    private String bloodGroup;
    private String allergies;
    private String medicines;
    private String height;
    private String weight;
    private boolean smoker;
    private String alcoholConsumption;
    private String[] chronicDiseases;
    private String[] actualDiseases;

    public MedicalRecord() {
    }

    public MedicalRecord(long id, String bloodGroup, String allergies, String medicines, String height, String weight, boolean smoker, String alcoholConsumption, String[] chronicDiseases, String[] actualDiseases) {
        this.id = id;
        this.bloodGroup = bloodGroup;
        this.allergies = allergies;
        this.medicines = medicines;
        this.height = height;
        this.weight = weight;
        this.smoker = smoker;
        this.alcoholConsumption = alcoholConsumption;
        this.chronicDiseases = chronicDiseases;
        this.actualDiseases = actualDiseases;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public String getAllergies() {
        return allergies;
    }

    public void setAllergies(String allergies) {
        this.allergies = allergies;
    }

    public String getMedicines() {
        return medicines;
    }

    public void setMedicines(String medicines) {
        this.medicines = medicines;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public boolean isSmoker() {
        return smoker;
    }

    public void setSmoker(boolean smoker) {
        this.smoker = smoker;
    }

    public String getAlcoholConsumption() {
        return alcoholConsumption;
    }

    public void setAlcoholConsumption(String alcoholConsumption) {
        this.alcoholConsumption = alcoholConsumption;
    }

    public String[] getChronicDiseases() {
        return chronicDiseases;
    }

    public void setChronicDiseases(String[] chronicDiseases) {
        this.chronicDiseases = chronicDiseases;
    }

    public String[] getActualDiseases() {
        return actualDiseases;
    }

    public void setActualDiseases(String[] actualDiseases) {
        this.actualDiseases = actualDiseases;
    }
}
