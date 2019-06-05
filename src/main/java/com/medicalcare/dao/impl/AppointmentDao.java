package com.medicalcare.dao.impl;

import com.medicalcare.Configuration.HibernateUtil;
import com.medicalcare.dao.IAppointmentDao;
import com.medicalcare.model.Appointment;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class AppointmentDao implements IAppointmentDao {

    @Override
    public List<Appointment> getAppointments() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("from Appointment", Appointment.class).list();
    }

    @Override
    public Appointment saveAppointment(Appointment appointment) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(appointment);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return appointment;
    }

    @Override
    public Appointment updateAppointment(Appointment appointment) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(appointment);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return appointment;
    }

    @Override
    public void deleteAppointment(Long appointmentID) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.delete(appointmentID);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public List<Appointment> getAppointmentsByUsername(String username, String role) {
        Transaction transaction = null;
        List<Appointment> appointments = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String query = null;
            if (role.equals("DOCTOR")) {
                query = "select a from Appointment a where a.doctor.username = :username";
            } else {
                query = "select a from Appointment a where a.patient.username = :username";
            }
            appointments = session.createQuery(query)
                    .setParameter("username", username)
                    .list();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return appointments;
    }

    @Override
    public Appointment getAppointmentById(Long appointmentID) {
        Transaction transaction = null;
        Appointment appointment = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            appointment = session.find(Appointment.class, appointmentID);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return appointment;
    }
}
