package com.jonaspetrauskas.dev.model;


import javax.persistence.*;

@Entity
@Table(name = "menesioplanas")
public class MenesioPlanas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer planasMetai;
    private Integer planasMenuo;
    private float planasElektra;
    private float planasSantechnika;
    private float planasStatyba;
    //new kiti
    private float planasKiti;

    @ManyToOne
    @JoinColumn(name = "businessunit_id")
    private BusinessUnit planasUnit;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User planasUser;

    public MenesioPlanas(){

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getPlanasMetai() {
        return planasMetai;
    }

    public void setPlanasMetai(Integer planasMetai) {
        this.planasMetai = planasMetai;
    }

    public Integer getPlanasMenuo() {
        return planasMenuo;
    }

    public void setPlanasMenuo(Integer planasMenuo) {
        this.planasMenuo = planasMenuo;
    }

    public float getPlanasElektra() {
        return planasElektra;
    }

    public void setPlanasElektra(float planasElektra) {
        this.planasElektra = planasElektra;
    }

    public float getPlanasSantechnika() {
        return planasSantechnika;
    }

    public void setPlanasSantechnika(float planasSantechnika) {
        this.planasSantechnika = planasSantechnika;
    }

    public float getPlanasStatyba() {
        return planasStatyba;
    }

    public void setPlanasStatyba(float planasStatyba) {
        this.planasStatyba = planasStatyba;
    }

    public BusinessUnit getPlanasUnit() {
        return planasUnit;
    }

    public void setPlanasUnit(BusinessUnit planasUnit) {
        this.planasUnit = planasUnit;
    }

    public User getPlanasUser() {
        return planasUser;
    }

    public void setPlanasUser(User planasUser) {
        this.planasUser = planasUser;
    }

    public float getPlanasKiti() {
        return planasKiti;
    }

    public void setPlanasKiti(float planasKiti) {
        this.planasKiti = planasKiti;
    }
}
