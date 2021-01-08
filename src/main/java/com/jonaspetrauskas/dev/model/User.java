package com.jonaspetrauskas.dev.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String vardas;
    private String pavarde;
    private boolean active;
    private String password;
    @Transient
    private String passwordConfirm;

    @OneToMany(mappedBy = "useriukas", orphanRemoval = true)
    private List<PardavimaiLent> pardavimai= new ArrayList<>();

    @ManyToMany
    private List<BusinessUnit> unitas;

    @ManyToMany
    private Set<Role> roles;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public String getPasswordConfirm() {

        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public List<PardavimaiLent> getPardavimai() {
        return pardavimai;
    }

    public void setPardavimai(List<PardavimaiLent> pardavimai) {
        this.pardavimai = pardavimai;
    }

    public List<BusinessUnit> getUnitas() {
        return unitas;
    }

    public void setUnitas(List<BusinessUnit> unitas) {
        this.unitas = unitas;
    }

    public String getVardas() {
        return vardas;
    }

    public void setVardas(String vardas) {
        this.vardas = vardas;
    }

    public String getPavarde() {
        return pavarde;
    }

    public void setPavarde(String pavarde) {
        this.pavarde = pavarde;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
