package com.medicalcare.dao.impl;

import com.medicalcare.Configuration.HibernateUtil;
import com.medicalcare.dao.IPatientDao;
import com.medicalcare.model.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class PatientDao implements IPatientDao {


    @Override
    public Patient savePatient(Patient patient) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the patient object
            session.save(patient);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return patient;
    }

    @Override
    public Patient updatePatient(Patient patient) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the patient object
            session.update(patient);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return patient;
    }

    @Override
    public List<Patient> getPatients() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Patient", Patient.class).list();
        }
    }

    @Override
    public Patient getPatientByUsername(String username) {
        Transaction transaction = null;
        List<Patient> patients = null;
        Patient patient = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            patients = session.createQuery("select u from Patient u where u.username = :username")
                    .setParameter("username", username)
                    .list();
            if (patients.size() > 0) {
                patient = patients.get(0);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return patient;
    }
}
