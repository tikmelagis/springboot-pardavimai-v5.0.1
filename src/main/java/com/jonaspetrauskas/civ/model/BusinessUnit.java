package com.jonaspetrauskas.civ.model;


import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="businessunit")
public class BusinessUnit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    @ManyToMany(mappedBy = "unitas")
    private List<User> user1= new ArrayList<>();


    public BusinessUnit(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<User> getUser1() {
        return user1;
    }

    public void setUser1(List<User> user1) {
        this.user1 = user1;
    }
}
