package com.medicalcare.metier.impl;

import com.medicalcare.dao.INoteDao;
import com.medicalcare.dao.impl.NoteDao;
import com.medicalcare.metier.INoteService;
import com.medicalcare.model.Note;

import java.util.List;

public class NoteService implements INoteService {

    private INoteDao noteDao = new NoteDao();

    @Override
    public List<Note> getNotes() {
        return noteDao.getNotes();
    }

    @Override
    public List<Note> getNotesByUsername(String username, String role) {
        return noteDao.getNotesByUsername(username, role);
    }

    @Override
    public Note createNote(Note note) {
        return noteDao.saveNote(note);
    }

    @Override
    public Note updateNote(Note note) {
        return noteDao.updateNote(note);
    }

    @Override
    public Note updateNote(Long id) {
        return this.updateNote(this.getNoteById(id));
    }

    @Override
    public void deleteNote(Long noteID) {
        noteDao.deleteNote(noteID);
    }

    @Override
    public Note getNoteById(Long noteID) {
        return noteDao.getNoteById(noteID);
    }
}
