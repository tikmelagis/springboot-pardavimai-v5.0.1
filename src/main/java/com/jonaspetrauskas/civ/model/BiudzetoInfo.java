package com.jonaspetrauskas.civ.model;

public class BiudzetoInfo {

    private String metai;
    private String menuo;
    private String unit;
    private float menesioBiudzetas;
    private float menesioPardavimoPlanas;
    private float menesioAktavimoSuma;
    private float uzaktuotaSumaFMS;

    public BiudzetoInfo(){}



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

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public float getMenesioBiudzetas() {
        return menesioBiudzetas;
    }

    public void setMenesioBiudzetas(float menesioBiudzetas) {
        this.menesioBiudzetas = menesioBiudzetas;
    }

    public float getMenesioPardavimoPlanas() {
        return menesioPardavimoPlanas;
    }

    public void setMenesioPardavimoPlanas(float menesioPardavimoPlanas) {
        this.menesioPardavimoPlanas = menesioPardavimoPlanas;
    }

    public float getMenesioAktavimoSuma() {
        return menesioAktavimoSuma;
    }

    public void setMenesioAktavimoSuma(float menesioAktavimoSuma) {
        this.menesioAktavimoSuma = menesioAktavimoSuma;
    }

    public float getUzaktuotaSumaFMS() {
        return uzaktuotaSumaFMS;
    }

    public void setUzaktuotaSumaFMS(float uzaktuotaSumaFMS) {
        this.uzaktuotaSumaFMS = uzaktuotaSumaFMS;
    }
}
