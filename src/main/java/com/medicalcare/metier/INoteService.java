package com.medicalcare.metier;


import com.medicalcare.model.Note;

import java.util.List;

public interface INoteService {

    List<Note> getNotes();

    List<Note> getNotesByUsername(String username, String role);

    Note createNote(Note note);

    Note updateNote(Note note);

    Note updateNote(Long id);

    void deleteNote(Long noteID);

    Note getNoteById(Long noteID);
}
