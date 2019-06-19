package com.medicalcare.metier;


import com.medicalcare.model.Appointment;

import java.util.List;

public interface IAppointmentService {

    List<Appointment> getAppointments();

    List<Appointment> getAppointmentsByUsername(String username, String role, String status);

    List<Appointment> getAppointmentsByUsername(String username, String role);

    Appointment createAppointment(Appointment appointment);

    Appointment updateAppointment(Appointment appointment);

    Appointment updateAppointment(Long id);

    void deleteAppointment(Long appointmentID);

    Appointment getAppointmentById(Long appointmentID);
}
