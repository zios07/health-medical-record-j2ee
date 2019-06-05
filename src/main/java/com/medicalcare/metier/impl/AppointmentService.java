package com.medicalcare.metier.impl;

import com.medicalcare.dao.IAppointmentDao;
import com.medicalcare.dao.impl.AppointmentDao;
import com.medicalcare.metier.IAppointmentService;
import com.medicalcare.model.Appointment;

import java.util.List;

public class AppointmentService implements IAppointmentService {

    private IAppointmentDao appointmentDao = new AppointmentDao();

    @Override
    public List<Appointment> getAppointments() {
        return appointmentDao.getAppointments();
    }

    @Override
    public List<Appointment> getAppointmentsByUsername(String username, String role) {
        return appointmentDao.getAppointmentsByUsername(username, role);
    }

    @Override
    public Appointment createAppointment(Appointment appointment) {
        return appointmentDao.saveAppointment(appointment);
    }

    @Override
    public Appointment updateAppointment(Appointment appointment) {
        return appointmentDao.updateAppointment(appointment);
    }

    @Override
    public Appointment updateAppointment(Long id) {
        return this.updateAppointment(this.getAppointmentById(id));
    }

    @Override
    public void deleteAppointment(Long appointmentID) {
        appointmentDao.deleteAppointment(appointmentID);
    }

    @Override
    public Appointment getAppointmentById(Long appointmentID) {
        return appointmentDao.getAppointmentById(appointmentID);
    }
}
