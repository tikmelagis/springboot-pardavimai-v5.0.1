package com.jonaspetrauskas.civ.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "komentarai")
public class Komentarai {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String komentaras;
    private String komentaroData;


    @ManyToOne
    @JoinColumn(name = "pardavimo_id")
    private PardavimaiLent pardavimas;

    @OneToMany(mappedBy = "komentarasfor", orphanRemoval = true)
    private List<ResponseKomentaras> responseKomentarasList;

    @ManyToOne
    @JoinColumn(name="user_id")
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

    public PardavimaiLent getPardavimas() {
        return pardavimas;
    }

    public void setPardavimas(PardavimaiLent pardavimas) {
        this.pardavimas = pardavimas;
    }

    public List<ResponseKomentaras> getResponseKomentarasList() {
        return responseKomentarasList;
    }

    public void setResponseKomentarasList(List<ResponseKomentaras> responseKomentarasList) {
        this.responseKomentarasList = responseKomentarasList;
    }

    public User getVartotojas() {
        return vartotojas;
    }

    public void setVartotojas(User vartotojas) {
        this.vartotojas = vartotojas;
    }
}
