package com.web.domain;

import java.util.Date;

public class User {
    private int id;
    private String phone;
    private String name;
    private String password;
    private String role;
    private Date created_at;
    private Date updated_at;

    public User() {
    }

    public User(String name, String password, String role) {
        this.name = name;
        this.password = password;
        this.role = role;
    }

    public User(String phone, String name, String password, String role) {
        this.phone = phone;
        this.name = name;
        this.password = password;
        this.role = role;
    }

    public User(int id, String name, String password, String role) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.role = role;
    }

    public User(int id, String phone, String name, String password, String role, Date created_at, Date updated_at) {
        this.id = id;
        this.phone = phone;
        this.name = name;
        this.password = password;
        this.role = role;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public int getId() {
        return id;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", phone='" + phone + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                '}';
    }
}
