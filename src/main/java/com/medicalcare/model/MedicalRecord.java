package com.medicalcare.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "MEDICAL_RECORD_TABLE")
public class MedicalRecord {

    @Id
    @GeneratedValue
    private long id;
    private String bloodGroup;
    private String allergies;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Medicine> medicines;
    private Double height;
    private Double weight;
    private boolean smoker;
    private String alcoholConsumption;
    private String chronicDiseases;
    private String actualDiseases;

    public MedicalRecord() {
    }

    public MedicalRecord(String bloodGroup, String allergies, List<Medicine> medicines, Double height, Double weight, boolean smoker, String alcoholConsumption, String chronicDiseases, String actualDiseases) {
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

    public List<Medicine> getMedicines() {
        return medicines;
    }

    public void setMedicines(List<Medicine> medicines) {
        this.medicines = medicines;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
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

    public String getChronicDiseases() {
        return chronicDiseases;
    }

    public void setChronicDiseases(String chronicDiseases) {
        this.chronicDiseases = chronicDiseases;
    }

    public String getActualDiseases() {
        return actualDiseases;
    }

    public void setActualDiseases(String actualDiseases) {
        this.actualDiseases = actualDiseases;
    }

    @Override
    public String toString() {
        return "MedicalRecord{" +
                "id=" + id +
                ", bloodGroup='" + bloodGroup + '\'' +
                ", allergies='" + allergies + '\'' +
                ", medicines='" + medicines + '\'' +
                ", height=" + height +
                ", weight=" + weight +
                ", smoker=" + smoker +
                ", alcoholConsumption='" + alcoholConsumption + '\'' +
                ", chronicDiseases='" + chronicDiseases + '\'' +
                ", actualDiseases='" + actualDiseases + '\'' +
                '}';
    }
}