package com.medicalcare.dao.impl;

import com.medicalcare.Configuration.HibernateUtil;
import com.medicalcare.dao.IDoctorDao;
import com.medicalcare.model.Doctor;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class DoctorDao implements IDoctorDao {


    @Override
    public Doctor saveDoctor(Doctor doctor) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the patient object
            session.save(doctor);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return doctor;
    }

    @Override
    public Doctor updateDoctor(Doctor doctor) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the patient object
            session.update(doctor);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return doctor;
    }

    @Override
    public List<Doctor> getDoctors() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Doctor", Doctor.class).list();
        }
    }

    @Override
    public Doctor getDoctorByUsername(String username) {
        Transaction transaction = null;
        List<Doctor> doctors = null;
        Doctor doctor = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            doctors = session.createQuery("select u from Doctor u where u.username = :username")
                    .setParameter("username", username)
                    .list();
            if (doctors.size() > 0) {
                doctor = doctors.get(0);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return doctor;
    }

    @Override
    public Doctor getDoctorByID(Long doctorID) {
        Transaction transaction = null;
        List<Doctor> doctors = null;
        Doctor doctor = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            doctors = session.createQuery("select u from Doctor u where u.id = :id")
                    .setParameter("id", doctorID)
                    .list();
            if (doctors.size() > 0) {
                doctor = doctors.get(0);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return doctor;
    }
}
