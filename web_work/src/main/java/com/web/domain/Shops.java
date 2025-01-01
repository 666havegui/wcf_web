package com.web.domain;

import java.util.Date;

public class Shops {
    private int id;
    private String name;
    private int user_id;
    private String description;
    private Date created_at;
    private Date updated_at;

    public Shops() {
    }

    public Shops(String name, int user_id) {
        this.name = name;
        this.user_id = user_id;
    }
    public int getId(){return id;}
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
        return "Shops{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", user_id=" + user_id +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                '}';
    }
}
