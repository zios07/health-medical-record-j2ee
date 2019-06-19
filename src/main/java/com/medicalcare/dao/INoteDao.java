package com.medicalcare.dao;

import com.medicalcare.model.Note;

import java.util.List;

public interface INoteDao {

    List<Note> getNotes();

    Note saveNote(Note note);

    Note updateNote(Note note);

    void deleteNote(Long noteID);

    List<Note> getNotesByUsername(String username, String role);

    Note getNoteById(Long noteID);
}
