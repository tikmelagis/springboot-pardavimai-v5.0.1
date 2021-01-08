package com.jonaspetrauskas.dev.service;

import com.jonaspetrauskas.dev.model.*;
import com.jonaspetrauskas.dev.repository.BiudzetasRep;
import com.jonaspetrauskas.dev.repository.BusinessUnitRep;
import com.jonaspetrauskas.dev.repository.PardavimaiLentRep;
import com.jonaspetrauskas.dev.repository.UserRepository;
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

    @Autowired
    private UserRepository userRepository;



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
                for(PardavimaiLent p: pardavimaiLentRep.findAllByBunitas(bu)){
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

                        }

                    }
                    try{
                        if(p.getPlanuojamaAtlikimoData2().isEmpty()==false ){

                            LocalDate ikikada2 = LocalDate.parse(p.getPlanuojamaAtlikimoData2(), formatter);
                            int menesis3= ikikada2.getMonthValue();
                            String metai3 = String.valueOf(ikikada2.getYear());
                            if(menesis3==i && metai3.equals(metai)){
                                menesioAktavimoSuma=menesioAktavimoSuma+p.getSutartineSumaTiksli2();
                            }
                        }
                    }catch (DateTimeParseException e){

                    }catch (NullPointerException e){

                    }

                    try{
                        if(p.getPlanuojamaAtlikimoData3().isEmpty()==false ){

                            LocalDate ikikada3 = LocalDate.parse(p.getPlanuojamaAtlikimoData3(), formatter);
                            int menesis4= ikikada3.getMonthValue();
                            String metai4 = String.valueOf(ikikada3.getYear());
                            if(menesis4==i && metai4.equals(metai)){
                                menesioAktavimoSuma=menesioAktavimoSuma+p.getSutartineSumaTiksli3();
                            }
                        }
                    }catch (DateTimeParseException e){

                    }catch (NullPointerException e){

                    }
                    try{
                        if(p.getPlanuojamaAtlikimoData4().isEmpty()==false ){

                            LocalDate ikikada4 = LocalDate.parse(p.getPlanuojamaAtlikimoData4(), formatter);
                            int menesis5= ikikada4.getMonthValue();
                            String metai5 = String.valueOf(ikikada4.getYear());
                            if(menesis5==i && metai5.equals(metai)){
                                menesioAktavimoSuma=menesioAktavimoSuma+p.getSutartineSumaTiksli4();
                            }
                        }
                    }catch (DateTimeParseException e){

                    }catch (NullPointerException e){

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

    @Override
    public List<BiudzetasInfoUser> biudzetoInfoPagalUser(String metai) {
        List<BiudzetasInfoUser> bi = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        for(int i=1; i<=12;i++){
            for(BusinessUnit b: businessUnitRep.findAll()){
                for(User u: userRepository.findAllByRoles_NameAndUnitas("ROLE_USER", b)){
                    float menesioAktavimoSuma =0;
                    float menesioPlanavimoSuma =0;
                    for(PardavimaiLent p: pardavimaiLentRep.findAllByUseriukas_IdAndBunitas(u.getId(),b)){
                        //planuojami
                        try{
                            if(p.getSprendimoPriemimoData().isEmpty()==false){
                                LocalDate nuokada = LocalDate.parse(p.getSprendimoPriemimoData(), formatter);
                                int menesisNuo= nuokada.getMonthValue();
                                String metaiPardNuo = String.valueOf(nuokada.getYear());
                                if(menesisNuo==i && metaiPardNuo.equals(metai)){
                                    menesioPlanavimoSuma=menesioPlanavimoSuma+p.getPristatomuDarbuKainaPreliminari();
                                }
                            }
                        }catch (DateTimeParseException e){

                        }catch (NullPointerException e){

                        }
                        //aktavimas 1
                        try{
                            if(p.getPlanuojamaAtlikimoData().isEmpty()==false ){
                                LocalDate ikikada = LocalDate.parse(p.getPlanuojamaAtlikimoData(), formatter);
                                int menesis= ikikada.getMonthValue();
                                String metaiPard = String.valueOf(ikikada.getYear());
                                if(menesis==i && metaiPard.equals(metai)){
                                    menesioAktavimoSuma=menesioAktavimoSuma+p.getSutartineSumaTiksli();
                                }
                            }
                        }catch (DateTimeParseException e){

                        }catch (NullPointerException e){

                        }
                        //aktavimas 2
                        try{
                            if(p.getPlanuojamaAtlikimoData2().isEmpty()==false ){
                                LocalDate ikikada2 = LocalDate.parse(p.getPlanuojamaAtlikimoData2(), formatter);
                                int menesis2= ikikada2.getMonthValue();
                                String metaiPard2 = String.valueOf(ikikada2.getYear());
                                if(menesis2==i && metaiPard2.equals(metai)){
                                    menesioAktavimoSuma=menesioAktavimoSuma+p.getSutartineSumaTiksli2();
                                }
                            }
                        }catch (DateTimeParseException e){

                        }catch (NullPointerException e){

                        }
                        //aktavimas 3
                        try{
                            if(p.getPlanuojamaAtlikimoData3().isEmpty()==false ){
                                LocalDate ikikada3 = LocalDate.parse(p.getPlanuojamaAtlikimoData3(), formatter);
                                int menesis3= ikikada3.getMonthValue();
                                String metaiPard3 = String.valueOf(ikikada3.getYear());
                                if(menesis3==i && metaiPard3.equals(metai)){
                                    menesioAktavimoSuma=menesioAktavimoSuma+p.getSutartineSumaTiksli3();
                                }
                            }
                        }catch (DateTimeParseException e){

                        }catch (NullPointerException e){

                        }
                        //aktavimas 4
                        try{
                            if(p.getPlanuojamaAtlikimoData4().isEmpty()==false ){
                                LocalDate ikikada4 = LocalDate.parse(p.getPlanuojamaAtlikimoData4(), formatter);
                                int menesis4= ikikada4.getMonthValue();
                                String metaiPard4 = String.valueOf(ikikada4.getYear());
                                if(menesis4==i && metaiPard4.equals(metai)){
                                    menesioAktavimoSuma=menesioAktavimoSuma+p.getSutartineSumaTiksli4();
                                }
                            }
                        }catch (DateTimeParseException e){

                        }catch (NullPointerException e){

                        }
                    }
                    bi.add(new BiudzetasInfoUser(u,b,menesioPlanavimoSuma, menesioAktavimoSuma,i,Integer.parseInt(metai)));
                }
            }



        }


        return bi;
    }


}
