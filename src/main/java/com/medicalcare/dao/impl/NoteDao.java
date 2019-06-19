package com.medicalcare.dao.impl;

import com.medicalcare.Configuration.HibernateUtil;
import com.medicalcare.dao.INoteDao;
import com.medicalcare.model.Note;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class NoteDao implements INoteDao {

    @Override
    public List<Note> getNotes() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("from Note", Note.class).list();
    }

    @Override
    public Note saveNote(Note note) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(note);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return note;
    }

    @Override
    public Note updateNote(Note note) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(note);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return note;
    }

    @Override
    public void deleteNote(Long noteID) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.delete(noteID);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public List<Note> getNotesByUsername(String username, String role) {
        Transaction transaction = null;
        List<Note> notes = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String query = null;
            if (role.equals("DOCTOR")) {
                query = "select a from Note a where a.doctor.username = :username";
            } else {
                query = "select a from Note a where a.patient.username = :username";
            }
            notes = session.createQuery(query)
                    .setParameter("username", username)
                    .list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return notes;
    }

    @Override
    public Note getNoteById(Long noteID) {
        Transaction transaction = null;
        Note note = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            note = session.find(Note.class, noteID);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return note;
    }
}
