package com.medicalcare.model;

import javax.persistence.*;

@Entity
@Table(name = "NOTE_TABLE")
public class Note {

    @Id
    @GeneratedValue
    private long id;

    private String note;

    public Note() {

    }

    public Note(String note) {
        this.note = note;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
