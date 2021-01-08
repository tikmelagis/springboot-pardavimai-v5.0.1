package com.jonaspetrauskas.dev.model;

public class BiudzetasInfoUser {

    private User user;
    private BusinessUnit businessUnit;
    private float planuojamaSuma;
    private float aktavimoSuma;
    private Integer menuo;
    private Integer metai;

    public BiudzetasInfoUser(){}

    public BiudzetasInfoUser(User user, BusinessUnit businessUnit, float planuojamaSuma, float aktavimoSuma, Integer menuo, Integer metai) {
        this.user = user;
        this.businessUnit = businessUnit;
        this.planuojamaSuma = planuojamaSuma;
        this.aktavimoSuma = aktavimoSuma;
        this.menuo = menuo;
        this.metai = metai;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public BusinessUnit getBusinessUnit() {
        return businessUnit;
    }

    public void setBusinessUnit(BusinessUnit businessUnit) {
        this.businessUnit = businessUnit;
    }

    public float getPlanuojamaSuma() {
        return planuojamaSuma;
    }

    public void setPlanuojamaSuma(float planuojamaSuma) {
        this.planuojamaSuma = planuojamaSuma;
    }

    public float getAktavimoSuma() {
        return aktavimoSuma;
    }

    public void setAktavimoSuma(float aktavimoSuma) {
        this.aktavimoSuma = aktavimoSuma;
    }

    public Integer getMenuo() {
        return menuo;
    }

    public void setMenuo(Integer menuo) {
        this.menuo = menuo;
    }

    public Integer getMetai() {
        return metai;
    }

    public void setMetai(Integer metai) {
        this.metai = metai;
    }
}
