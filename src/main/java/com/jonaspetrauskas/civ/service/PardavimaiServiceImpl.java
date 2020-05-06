package com.jonaspetrauskas.civ.service;

import com.jonaspetrauskas.civ.model.PardavimaiLent;
import com.jonaspetrauskas.civ.model.PardavimuPaskaiciavimas;
import com.jonaspetrauskas.civ.model.User;
import com.jonaspetrauskas.civ.repository.PardavimaiLentRep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
public class PardavimaiServiceImpl implements PardavimaiService{

    @Autowired
    PardavimaiLentRep pardavimaiLentRep;



    @Override
    public PardavimaiLent paskirstymasPar(PardavimaiLent pardavimaiLent) {
        PardavimaiLent pa = pardavimaiLent;

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate nuokada = LocalDate.parse(pa.getSprendimoPriemimoData(), formatter);
        if(nuokada.getMonthValue()>=1 && nuokada.getMonthValue()<=3){
            pa.setKetvirtis("I");
        }else if(nuokada.getMonthValue()>=4 && nuokada.getMonthValue()<=6){
            pa.setKetvirtis("II");
        }else if(nuokada.getMonthValue()>=7 && nuokada.getMonthValue()<=9){
            pa.setKetvirtis("III");
        }else if(nuokada.getMonthValue()>=10 && nuokada.getMonthValue()<=12){
            pa.setKetvirtis("IV");
        }

        return pa;
    }

    @Override
    public PardavimuPaskaiciavimas paskaiciavimas(User user, String metai) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        List<PardavimaiLent> pardavimaiLentList = pardavimaiLentRep.findAllByUseriukas_IdAndMetai(user.getId(),metai);
        List<PardavimaiLent> pardavimaiLentList1 = pardavimaiLentRep.findAllByUseriukas_IdAndPlanuojamaAtlikimoDataContains(user.getId(),metai);
        float planuojamiPar1=0;
        float planuojamiPar2=0;
        float planuojamiPar3=0;
        float planuojamiPar4=0;
        float planuojamiPar5=0;
        float planuojamiPar6=0;
        float planuojamiPar7=0;
        float planuojamiPar8=0;
        float planuojamiPar9=0;
        float planuojamiPar10=0;
        float planuojamiPar11=0;
        float planuojamiPar12=0;
        float planuojamasAkt1=0;
        float planuojamasAkt2=0;
        float planuojamasAkt3=0;
        float planuojamasAkt4=0;
        float planuojamasAkt5=0;
        float planuojamasAkt6=0;
        float planuojamasAkt7=0;
        float planuojamasAkt8=0;
        float planuojamasAkt9=0;
        float planuojamasAkt10=0;
        float planuojamasAkt11=0;
        float planuojamasAkt12=0;
        float ket1Elektra=0;
        float ket2Elektra=0;
        float ket3Elektra=0;
        float ket4Elektra=0;
        float ket1Santechnika=0;
        float ket2Santechnika=0;
        float ket3Santechnika=0;
        float ket4Santechnika=0;
        float ket1Statyba=0;
        float ket2Statyba=0;
        float ket3Statyba=0;
        float ket4Statyba=0;
        float ket1Kita=0;
        float ket2Kita=0;
        float ket3Kita=0;
        float ket4Kita=0;
        for (PardavimaiLent p:pardavimaiLentList) {
            LocalDate nuokada = LocalDate.parse(p.getSprendimoPriemimoData(), formatter);
            if (nuokada.getMonthValue() == 1) {
                planuojamiPar1 = planuojamiPar1 + p.getPristatomuDarbuKainaPreliminari();
            }
            if (nuokada.getMonthValue() == 2) {
                planuojamiPar2 = planuojamiPar2 + p.getPristatomuDarbuKainaPreliminari();
            }
            if (nuokada.getMonthValue() == 3) {
                planuojamiPar3 = planuojamiPar3 + p.getPristatomuDarbuKainaPreliminari();
            }
            if (nuokada.getMonthValue() == 4) {
                planuojamiPar4 = planuojamiPar4 + p.getPristatomuDarbuKainaPreliminari();
            }
            if (nuokada.getMonthValue() == 5) {
                planuojamiPar5 = planuojamiPar5 + p.getPristatomuDarbuKainaPreliminari();
            }
            if (nuokada.getMonthValue() == 6) {
                planuojamiPar6 = planuojamiPar6 + p.getPristatomuDarbuKainaPreliminari();
            }
            if (nuokada.getMonthValue() == 7) {
                planuojamiPar7 = planuojamiPar7 + p.getPristatomuDarbuKainaPreliminari();
            }
            if (nuokada.getMonthValue() == 8) {
                planuojamiPar8 = planuojamiPar8 + p.getPristatomuDarbuKainaPreliminari();
            }
            if (nuokada.getMonthValue() == 9) {
                planuojamiPar9 = planuojamiPar9 + p.getPristatomuDarbuKainaPreliminari();
            }
            if (nuokada.getMonthValue() == 10) {
                planuojamiPar10 = planuojamiPar10 + p.getPristatomuDarbuKainaPreliminari();
            }
            if (nuokada.getMonthValue() == 11) {
                planuojamiPar11 = planuojamiPar11 + p.getPristatomuDarbuKainaPreliminari();
            }
            if (nuokada.getMonthValue() == 12) {
                planuojamiPar12 = planuojamiPar12 + p.getPristatomuDarbuKainaPreliminari();
            }
//////////
            if (p.getKetvirtis().equals("I")) {
                switch (p.getDarbuTipas()) {
                    case "Elektra":
                        ket1Elektra = ket1Elektra + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Statyba":
                        ket1Statyba = ket1Statyba + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Santechnika":
                        ket1Santechnika = ket1Santechnika + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Kita":
                        ket1Kita = ket1Kita + p.getPristatomuDarbuKainaPreliminari();
                        break;
                }
            }
            if (p.getKetvirtis().equals("II")) {
                switch (p.getDarbuTipas()) {
                    case "Elektra":
                        ket2Elektra = ket2Elektra + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Statyba":
                        ket2Statyba = ket2Statyba + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Santechnika":
                        ket2Santechnika = ket2Santechnika + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Kita":
                        ket2Kita = ket2Kita + p.getPristatomuDarbuKainaPreliminari();
                        break;
                }
            }
            if (p.getKetvirtis().equals("III")) {
                switch (p.getDarbuTipas()) {
                    case "Elektra":
                        ket3Elektra = ket3Elektra + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Statyba":
                        ket3Statyba = ket3Statyba + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Santechnika":
                        ket3Santechnika = ket3Santechnika + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Kita":
                        ket3Kita = ket3Kita + p.getPristatomuDarbuKainaPreliminari();
                        break;
                }
            }
            if (p.getKetvirtis().equals("IV")) {
                switch (p.getDarbuTipas()) {
                    case "Elektra":
                        ket4Elektra = ket4Elektra + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Statyba":
                        ket4Statyba = ket4Statyba + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Santechnika":
                        ket4Santechnika = ket4Santechnika + p.getPristatomuDarbuKainaPreliminari();
                        break;
                    case "Kita":
                        ket4Kita = ket4Kita + p.getPristatomuDarbuKainaPreliminari();
                        break;
                }
            }
/////////
        }
        for (PardavimaiLent p1: pardavimaiLentList1) {

            LocalDate ikikada = LocalDate.parse(p1.getPlanuojamaAtlikimoData(), formatter);
            if(ikikada.getMonthValue()==1){
                planuojamasAkt1=planuojamasAkt1+p1.getSutartineSumaTiksli();
            }
            if(ikikada.getMonthValue()==2){
                planuojamasAkt2=planuojamasAkt2+p1.getSutartineSumaTiksli();
            }
            if(ikikada.getMonthValue()==3){
                planuojamasAkt3=planuojamasAkt3+p1.getSutartineSumaTiksli();
            }
            if(ikikada.getMonthValue()==4){
                planuojamasAkt4=planuojamasAkt4+p1.getSutartineSumaTiksli();
            }
            if(ikikada.getMonthValue()==5){
                planuojamasAkt5=planuojamasAkt5+p1.getSutartineSumaTiksli();
            }
            if(ikikada.getMonthValue()==6){
                planuojamasAkt6=planuojamasAkt6+p1.getSutartineSumaTiksli();
            }
            if(ikikada.getMonthValue()==7){
                planuojamasAkt7=planuojamasAkt7+p1.getSutartineSumaTiksli();
            }
            if(ikikada.getMonthValue()==8){
                planuojamasAkt8=planuojamasAkt8+p1.getSutartineSumaTiksli();
            }
            if(ikikada.getMonthValue()==9){
                planuojamasAkt9=planuojamasAkt9+p1.getSutartineSumaTiksli();
            }
            if(ikikada.getMonthValue()==10){
                planuojamasAkt10=planuojamasAkt10+p1.getSutartineSumaTiksli();
            }
            if(ikikada.getMonthValue()==11){
                planuojamasAkt11=planuojamasAkt11+p1.getSutartineSumaTiksli();
            }
            if(ikikada.getMonthValue()==12){
                planuojamasAkt12=planuojamasAkt12+p1.getSutartineSumaTiksli();
            }
        }
        PardavimuPaskaiciavimas ps=new PardavimuPaskaiciavimas(planuojamiPar1,planuojamiPar2,planuojamiPar3,planuojamiPar4,
                planuojamiPar5,planuojamiPar6,planuojamiPar7, planuojamiPar8, planuojamiPar9, planuojamiPar10,planuojamiPar11,
                planuojamiPar12,planuojamasAkt1,planuojamasAkt2,planuojamasAkt3,planuojamasAkt4,planuojamasAkt5,planuojamasAkt6,
                planuojamasAkt7,planuojamasAkt8,planuojamasAkt9,planuojamasAkt10,planuojamasAkt11,planuojamasAkt12,ket1Elektra,
                ket2Elektra,ket3Elektra,ket4Elektra,ket1Santechnika,ket2Santechnika,ket3Santechnika,ket4Santechnika,
                ket1Statyba,ket2Statyba,ket3Statyba,ket4Statyba,ket1Kita,ket2Kita,ket3Kita,ket4Kita
                );



        return ps;
    }

    @Override
    public List<String> metai() {
        List<String> met= new ArrayList<>();

        met.add("2019");
        met.add("2020");
        met.add("2021");
        met.add("2022");
        met.add("2023");
        met.add("2024");
        met.add("2025");
        met.add("2026");
        met.add("2027");
        met.add("2028");
        met.add("2029");

        return met;
    }


}
