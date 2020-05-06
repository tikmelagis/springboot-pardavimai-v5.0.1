package com.jonaspetrauskas.civ.model;


import javax.persistence.*;
import java.util.List;


@Entity
@Table(name = "pardavimailent")
public class PardavimaiLent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String metai;
    private String ketvirtis;
    private String objektoPavadinimas;
    private String sprendimoPriemimoBudas;
    private String sprendimoPriemimoData;
    private String darbuTipas;
    private String darbuPavadinimas;
    private float pristatomuDarbuKainaPreliminari;
    private String pagrindasPatvirtintas;
    private String pasirinktasRangovas;
    private float sutartineSumaTiksli;
    private String planuojamaAtlikimoData;
    private Integer ticketFMSid;

    @ManyToOne
    @JoinColumn(name = "useris_id")
    private User useriukas;

    @OneToMany(mappedBy = "pardavimas", cascade = CascadeType.ALL)
    private List<Komentarai> komentaraiList;

    @OneToMany(mappedBy = "pardavimas", cascade = CascadeType.ALL)
    private List<Attachmentai> attachmentaiList;

    public PardavimaiLent(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUseriukas() {
        return useriukas;
    }

    public void setUseriukas(User useriukas) {
        this.useriukas = useriukas;
    }

    public String getMetai() {
        return metai;
    }

    public void setMetai(String metai) {
        this.metai = metai;
    }

    public String getKetvirtis() {
        return ketvirtis;
    }

    public void setKetvirtis(String ketvirtis) {
        this.ketvirtis = ketvirtis;
    }

    public String getObjektoPavadinimas() {
        return objektoPavadinimas;
    }

    public void setObjektoPavadinimas(String objektoPavadinimas) {
        this.objektoPavadinimas = objektoPavadinimas;
    }

    public String getSprendimoPriemimoBudas() {
        return sprendimoPriemimoBudas;
    }

    public void setSprendimoPriemimoBudas(String sprendimoPriemimoBudas) {
        this.sprendimoPriemimoBudas = sprendimoPriemimoBudas;
    }

    public String getSprendimoPriemimoData() {
        return sprendimoPriemimoData;
    }

    public void setSprendimoPriemimoData(String sprendimoPriemimoData) {
        this.sprendimoPriemimoData = sprendimoPriemimoData;
    }

    public String getDarbuTipas() {
        return darbuTipas;
    }

    public void setDarbuTipas(String darbuTipas) {
        this.darbuTipas = darbuTipas;
    }

    public String getDarbuPavadinimas() {
        return darbuPavadinimas;
    }

    public void setDarbuPavadinimas(String darbuPavadinimas) {
        this.darbuPavadinimas = darbuPavadinimas;
    }

    public float getPristatomuDarbuKainaPreliminari() {
        return pristatomuDarbuKainaPreliminari;
    }

    public void setPristatomuDarbuKainaPreliminari(float pristatomuDarbuKainaPreliminari) {
        this.pristatomuDarbuKainaPreliminari = pristatomuDarbuKainaPreliminari;
    }

    public String getPagrindasPatvirtintas() {
        return pagrindasPatvirtintas;
    }

    public void setPagrindasPatvirtintas(String pagrindasPatvirtintas) {
        this.pagrindasPatvirtintas = pagrindasPatvirtintas;
    }

    public String getPasirinktasRangovas() {
        return pasirinktasRangovas;
    }

    public void setPasirinktasRangovas(String pasirinktasRangovas) {
        this.pasirinktasRangovas = pasirinktasRangovas;
    }

    public float getSutartineSumaTiksli() {
        return sutartineSumaTiksli;
    }

    public void setSutartineSumaTiksli(float sutartineSumaTiksli) {
        this.sutartineSumaTiksli = sutartineSumaTiksli;
    }

    public String getPlanuojamaAtlikimoData() {
        return planuojamaAtlikimoData;
    }

    public void setPlanuojamaAtlikimoData(String planuojamaAtlikimoData) {
        this.planuojamaAtlikimoData = planuojamaAtlikimoData;
    }

    public List<Komentarai> getKomentaraiList() {
        return komentaraiList;
    }

    public void setKomentaraiList(List<Komentarai> komentaraiList) {
        this.komentaraiList = komentaraiList;
    }

    public List<Attachmentai> getAttachmentaiList() {
        return attachmentaiList;
    }

    public void setAttachmentaiList(List<Attachmentai> attachmentaiList) {
        this.attachmentaiList = attachmentaiList;
    }

    public Integer getTicketFMSid() {
        return ticketFMSid;
    }

    public void setTicketFMSid(Integer ticketFMSid) {
        this.ticketFMSid = ticketFMSid;
    }
}
