package com.jonaspetrauskas.civ.model;

import javax.persistence.*;

@Entity
@Table(name="responsekoment")
public class ResponseKomentaras {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String komentaras;
    private String komentaroData;

    @ManyToOne
    @JoinColumn(name = "komentarofor_id")
    private Komentarai komentarasfor;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User vartotojas;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getKomentaras() {
        return komentaras;
    }

    public void setKomentaras(String komentaras) {
        this.komentaras = komentaras;
    }

    public String getKomentaroData() {
        return komentaroData;
    }

    public void setKomentaroData(String komentaroData) {
        this.komentaroData = komentaroData;
    }

    public Komentarai getKomentarasfor() {
        return komentarasfor;
    }

    public void setKomentarasfor(Komentarai komentarasfor) {
        this.komentarasfor = komentarasfor;
    }

    public User getVartotojas() {
        return vartotojas;
    }

    public void setVartotojas(User vartotojas) {
        this.vartotojas = vartotojas;
    }
}
