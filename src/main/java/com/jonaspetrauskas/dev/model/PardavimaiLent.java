package com.jonaspetrauskas.dev.model;


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
    //sutartine suma
    private float sutartineSuma;
    //pirmas aktavimas
    private float sutartineSumaTiksli;
    private String planuojamaAtlikimoData;
    private Integer ticketFMSid;
    //antras aktavimas
    private float sutartineSumaTiksli2;
    private String planuojamaAtlikimoData2;
    private Integer ticketFMSid2;
    //trecias aktavimas
    private float sutartineSumaTiksli3;
    private String planuojamaAtlikimoData3;
    private Integer ticketFMSid3;
    //ketvirtas aktavimas
    private float sutartineSumaTiksli4;
    private String planuojamaAtlikimoData4;
    private Integer ticketFMSid4;

    @ManyToOne
    @JoinColumn(name = "bunitas_id")
    private BusinessUnit bunitas;

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

    public float getSutartineSumaTiksli2() {
        return sutartineSumaTiksli2;
    }

    public void setSutartineSumaTiksli2(float sutartineSumaTiksli2) {
        this.sutartineSumaTiksli2 = sutartineSumaTiksli2;
    }

    public String getPlanuojamaAtlikimoData2() {
        return planuojamaAtlikimoData2;
    }

    public void setPlanuojamaAtlikimoData2(String planuojamaAtlikimoData2) {
        this.planuojamaAtlikimoData2 = planuojamaAtlikimoData2;
    }

    public Integer getTicketFMSid2() {
        return ticketFMSid2;
    }

    public void setTicketFMSid2(Integer ticketFMSid2) {
        this.ticketFMSid2 = ticketFMSid2;
    }

    public BusinessUnit getBunitas() {
        return bunitas;
    }

    public void setBunitas(BusinessUnit bunitas) {
        this.bunitas = bunitas;
    }

    public float getSutartineSuma() {
        return sutartineSuma;
    }

    public void setSutartineSuma(float sutartineSuma) {
        this.sutartineSuma = sutartineSuma;
    }

    public float getSutartineSumaTiksli3() {
        return sutartineSumaTiksli3;
    }

    public void setSutartineSumaTiksli3(float sutartineSumaTiksli3) {
        this.sutartineSumaTiksli3 = sutartineSumaTiksli3;
    }

    public String getPlanuojamaAtlikimoData3() {
        return planuojamaAtlikimoData3;
    }

    public void setPlanuojamaAtlikimoData3(String planuojamaAtlikimoData3) {
        this.planuojamaAtlikimoData3 = planuojamaAtlikimoData3;
    }

    public Integer getTicketFMSid3() {
        return ticketFMSid3;
    }

    public void setTicketFMSid3(Integer ticketFMSid3) {
        this.ticketFMSid3 = ticketFMSid3;
    }

    public float getSutartineSumaTiksli4() {
        return sutartineSumaTiksli4;
    }

    public void setSutartineSumaTiksli4(float sutartineSumaTiksli4) {
        this.sutartineSumaTiksli4 = sutartineSumaTiksli4;
    }

    public String getPlanuojamaAtlikimoData4() {
        return planuojamaAtlikimoData4;
    }

    public void setPlanuojamaAtlikimoData4(String planuojamaAtlikimoData4) {
        this.planuojamaAtlikimoData4 = planuojamaAtlikimoData4;
    }

    public Integer getTicketFMSid4() {
        return ticketFMSid4;
    }

    public void setTicketFMSid4(Integer ticketFMSid4) {
        this.ticketFMSid4 = ticketFMSid4;
    }
}
