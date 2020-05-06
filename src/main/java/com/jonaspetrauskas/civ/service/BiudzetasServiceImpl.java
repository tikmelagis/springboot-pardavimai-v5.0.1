package com.jonaspetrauskas.civ.service;

import com.jonaspetrauskas.civ.model.Biudzetas;
import com.jonaspetrauskas.civ.model.BiudzetoInfo;
import com.jonaspetrauskas.civ.model.BusinessUnit;
import com.jonaspetrauskas.civ.model.PardavimaiLent;
import com.jonaspetrauskas.civ.repository.BiudzetasRep;
import com.jonaspetrauskas.civ.repository.BusinessUnitRep;
import com.jonaspetrauskas.civ.repository.PardavimaiLentRep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BiudzetasServiceImpl implements BiudzetasService{



    @Autowired
    private PardavimaiLentRep pardavimaiLentRep;

    @Autowired
    private BiudzetasRep biudzetasRep;

    @Autowired
    private BusinessUnitRep businessUnitRep;



    @Override
    public List<BiudzetoInfo> biudzetoInfoListas(String metai){
        List<BiudzetoInfo> biudzetoInfoList = new ArrayList<>();



        for(int i=1; i<=12;i++){
            for(BusinessUnit bu: businessUnitRep.findAll()){
                Biudzetas biudzetasNull= new Biudzetas("-","-",0,0,bu);
                Biudzetas biudzetas;
                if(biudzetasRep.findAllByMetaiAndBusinessUnitAndMenuo(metai, bu,""+i)!=null) {
                    if(biudzetasRep.findAllByMetaiAndBusinessUnitAndMenuo(metai, bu,""+i).size()==1){
                        biudzetas = biudzetasRep.findAllByMetaiAndBusinessUnitAndMenuo(metai,bu,""+i).get(0);
                    }else{
                        biudzetas = biudzetasNull;
                    }
                }else{
                    biudzetas = biudzetasNull;
                }
                BiudzetoInfo bi=new BiudzetoInfo();
                float menesioPardavimoPlanas=0;
                float menesioAktavimoSuma=0;
                for(PardavimaiLent p: pardavimaiLentRep.findAllByUseriukas_Unitas(bu)){
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    LocalDate nuokada = LocalDate.parse(p.getSprendimoPriemimoData(), formatter);
                    int menesis1 = nuokada.getMonthValue();
                    String metai1 = String.valueOf(nuokada.getYear());
                    if(menesis1==i && metai1.equals(metai)){
                        menesioPardavimoPlanas=menesioPardavimoPlanas+p.getPristatomuDarbuKainaPreliminari();
                    }
                    if(p.getPlanuojamaAtlikimoData().isEmpty()==false) {
                        try{
                            LocalDate ikikada = LocalDate.parse(p.getPlanuojamaAtlikimoData(), formatter);
                            int menesis2 = ikikada.getMonthValue();
                            String metai2 = String.valueOf(ikikada.getYear());
                            if(menesis2==i && metai2.equals(metai)){
                                menesioAktavimoSuma=menesioAktavimoSuma+p.getSutartineSumaTiksli();
                            }
                        }catch (DateTimeParseException e){
                            System.out.println("PAGAUTA");
                        }

                    }

                }
                bi.setMetai(metai);
                bi.setMenuo(""+i);
                bi.setUnit(bu.getName());
                bi.setMenesioBiudzetas(biudzetas.getMenesioBiudzetasUkio());
                bi.setMenesioPardavimoPlanas(menesioPardavimoPlanas);
                bi.setMenesioAktavimoSuma(menesioAktavimoSuma);
                bi.setUzaktuotaSumaFMS(biudzetas.getFaktiskaiUzaktuotaSumaFMS());

                biudzetoInfoList.add(bi);
            }
        }

        return biudzetoInfoList;
    }

    @Override
    public Map<Integer, String> menesiai() {
        Map<Integer, String> men=new HashMap<>();
        men.put(1,"Sausis");
        men.put(2,"Vasaris");
        men.put(3,"Kovas");
        men.put(4,"Balandis");
        men.put(5,"Gegužė");
        men.put(6,"Birželis");
        men.put(7,"Liepa");
        men.put(8,"Rugpjūtis");
        men.put(9,"Rugsėjis");
        men.put(10,"Spalis");
        men.put(11,"Lapkritis");
        men.put(12,"Gruodis");
        return men;
    }
}
