package com.medicalcare.dao;

import com.medicalcare.model.Appointment;

import java.util.List;

public interface IAppointmentDao {

    List<Appointment> getAppointments();

    Appointment saveAppointment(Appointment appointment);

    Appointment updateAppointment(Appointment appointment);

    void deleteAppointment(Long appointmentID);

    List<Appointment> getAppointmentsByUsername(String username, String role);

    Appointment getAppointmentById(Long appointmentID);

    List<Appointment> getAppointmentsByUsername(String username, String role, String status);
}
