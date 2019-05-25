package com.medicalcare.model;

import javax.persistence.*;

@Entity
@Table( name = "USER_TABLE")
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class User {

    @Id @GeneratedValue
    private long id;
    @Column(unique = true)
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private String address;
    private String address2;
    private String role;
    private boolean profileUpdated;
    @Lob
    private byte[] photo;

    public User() {
    }


    public User(User u) {
        this(u.username, u.password, u.firstName, u.lastName, u.email, u.address, u.address2, u.role, u.photo, u.profileUpdated);
    }

    public User(String username, String password, String firstName, String lastName, String email, String address, String address2, String role, byte[] photo, boolean profileUpdated) {
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.address = address;
        this.address2 = address2;
        this.role = role;
        this.photo = photo;
        this.profileUpdated = profileUpdated;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public boolean isProfileUpdated() {
        return profileUpdated;
    }

    public void setProfileUpdated(boolean profileUpdated) {
        this.profileUpdated = profileUpdated;
    }
}
