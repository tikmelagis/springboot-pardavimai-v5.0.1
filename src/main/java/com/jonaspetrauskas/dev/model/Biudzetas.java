package com.jonaspetrauskas.dev.model;

import javax.persistence.*;

@Entity
@Table(name="biudzetas")
public class Biudzetas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String metai;
    private String menuo;
    private float menesioBiudzetasUkio;
    private float faktiskaiUzaktuotaSumaFMS;

    @ManyToOne
    @JoinColumn(name = "businessunit_id")
    private BusinessUnit businessUnit;

    public Biudzetas(){}

    public Biudzetas(String metai, String menuo, float menesioBiudzetasUkio, float faktiskaiUzaktuotaSumaFMS, BusinessUnit businessUnit) {
        this.metai = metai;
        this.menuo = menuo;
        this.menesioBiudzetasUkio = menesioBiudzetasUkio;
        this.faktiskaiUzaktuotaSumaFMS = faktiskaiUzaktuotaSumaFMS;
        this.businessUnit = businessUnit;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMetai() {
        return metai;
    }

    public void setMetai(String metai) {
        this.metai = metai;
    }

    public String getMenuo() {
        return menuo;
    }

    public void setMenuo(String menuo) {
        this.menuo = menuo;
    }

    public float getMenesioBiudzetasUkio() {
        return menesioBiudzetasUkio;
    }

    public void setMenesioBiudzetasUkio(float menesioBiudzetasUkio) {
        this.menesioBiudzetasUkio = menesioBiudzetasUkio;
    }

    public float getFaktiskaiUzaktuotaSumaFMS() {
        return faktiskaiUzaktuotaSumaFMS;
    }

    public void setFaktiskaiUzaktuotaSumaFMS(float faktiskaiUzaktuotaSumaFMS) {
        this.faktiskaiUzaktuotaSumaFMS = faktiskaiUzaktuotaSumaFMS;
    }

    public BusinessUnit getBusinessUnit() {
        return businessUnit;
    }

    public void setBusinessUnit(BusinessUnit businessUnit) {
        this.businessUnit = businessUnit;
    }
}
