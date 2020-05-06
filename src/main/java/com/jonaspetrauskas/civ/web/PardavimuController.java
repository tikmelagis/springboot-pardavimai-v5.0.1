package com.jonaspetrauskas.civ.web;

import com.jonaspetrauskas.civ.model.BusinessUnit;
import com.jonaspetrauskas.civ.model.PardavimaiLent;
import com.jonaspetrauskas.civ.model.User;
import com.jonaspetrauskas.civ.repository.PardavimaiLentRep;
import com.jonaspetrauskas.civ.repository.UserRepository;
import com.jonaspetrauskas.civ.service.PardavimaiService;
import com.jonaspetrauskas.civ.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
public class PardavimuController {

    @Autowired
    private PardavimaiLentRep pardavimaiLentRep;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PardavimaiService pardavimaiService;


    @RequestMapping(value = "/pardavimolent")
    public ModelAndView pardavimoLent(Principal principal, @RequestParam(name = "pardavimoid", required=false) String pardavimoId,@RequestParam(name = "metais", required=false) String metai){
        ModelAndView mv = new ModelAndView();
        User us = userService.findByUsername(principal.getName());
        mv.addObject("metai", pardavimaiService.metai());

            if(metai!=null){
                mv.addObject("pasirinktiMetai",metai);
                if(pardavimaiLentRep.findAllByUseriukas_Id(us.getId())!=null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(),"I",metai));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(),"II",metai));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(),"III",metai));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(),"IV",metai));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us,metai));
                }
            }else{

                String defaultMetai = LocalDate.now().getYear()+"";
                mv.addObject("pasirinktiMetai",defaultMetai);
                if(pardavimaiLentRep.findAllByUseriukas_Id(us.getId())!=null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(),"I",defaultMetai));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(),"II",defaultMetai));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(),"III",defaultMetai));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(),"IV",defaultMetai));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us,defaultMetai));
                }
            }


        if(pardavimoId!=null){
            if(pardavimoId.equals("new")){
                mv.addObject("modaladd", true);
                mv.addObject("modalupdate", false);
                mv.addObject("pardavimas", new PardavimaiLent());
            }else{
                mv.addObject("modaladd", true);
                mv.addObject("modalupdate", false);
                mv.addObject("pardavimas", pardavimaiLentRep.findById(Integer.parseInt(pardavimoId)));
            }

        }else {
            mv.addObject("pardavimas", new PardavimaiLent());
        }
        mv.setViewName("pardavimolent");
        return mv;
    }


    @RequestMapping(value = "/addPardavima")
    public ModelAndView addPardavima(@ModelAttribute("pardavimas") PardavimaiLent pardavimaiLent, Principal principal,@RequestParam(name = "metais") String metai ){
        ModelAndView mv = new ModelAndView();
        User user = userService.findByUsername(principal.getName());
        pardavimaiLent.setUseriukas(user);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate nuokada = LocalDate.parse(pardavimaiLent.getSprendimoPriemimoData(), formatter);
        pardavimaiLent.setMetai(String.valueOf(nuokada.getYear()));
        pardavimaiLentRep.save(pardavimaiService.paskirstymasPar(pardavimaiLent));

        mv.setViewName("redirect:/pardavimolent?metais="+metai);
        return mv;
    }

    @RequestMapping(value = "/admin/addPardavima")
    public ModelAndView addAdminPardavima(@ModelAttribute("pardavimas") PardavimaiLent pardavimaiLent, @RequestParam(name = "darbuotojoid") String darbuotojoId, @RequestParam(name = "metais") String metai ){
        ModelAndView mv = new ModelAndView();
        User user = userRepository.getOne(Long.parseLong(darbuotojoId));
        pardavimaiLent.setUseriukas(user);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate nuokada = LocalDate.parse(pardavimaiLent.getSprendimoPriemimoData(), formatter);
        pardavimaiLent.setMetai(String.valueOf(nuokada.getYear()));
        pardavimaiLentRep.save(pardavimaiService.paskirstymasPar(pardavimaiLent));

        mv.setViewName("redirect:/admin/pardavimolent?darbuotojoid="+darbuotojoId+"&metais="+metai);
        return mv;
    }

    @RequestMapping(value = "/pardavimolent/{id}/delete")
    public ModelAndView deletePard(@PathVariable("id") Integer id, @RequestParam(name = "metais") String metai ){
        ModelAndView mv = new ModelAndView();
        pardavimaiLentRep.delete(pardavimaiLentRep.getOne(id));

        mv.setViewName("redirect:/pardavimolent?metais="+metai);
        return mv;
    }

    @RequestMapping(value = "/admin/pardavimolent/{id}/delete")
    public ModelAndView deleteAdminPard(@PathVariable("id") Integer id, @RequestParam(name = "darbuotojoid") String darbuotojoId,@RequestParam(name = "metais") String metai ){
        ModelAndView mv = new ModelAndView();
        pardavimaiLentRep.delete(pardavimaiLentRep.getOne(id));

        mv.setViewName("redirect:/admin/pardavimolent?darbuotojoid="+darbuotojoId+"&metais="+metai);
        return mv;
    }


    @RequestMapping(value = "/admin/pardavimolent")
    public ModelAndView adminLent(Principal principal,@RequestParam(name = "pardavimoid", required=false) String pardavimoId,@RequestParam(name = "metais", required=false) String metai,@RequestParam(name = "darbuotojoid",required=false) String darbuotojoid){
        ModelAndView mv= new ModelAndView();
        mv.addObject("metai", pardavimaiService.metai());
        mv.addObject("visiDarbuotojai", userRepository.findAll());
        List<BusinessUnit> bunit = userService.findByUsername(principal.getName()).getUnitas();
        mv.addObject("esamasUsername",userService.findByUsername(principal.getName()));
        mv.addObject("visiPagalBusinessUnitDarbuotojai",userRepository.findAllByUnitasInAndRoles_Name(bunit, "ROLE_USER"));

        if(darbuotojoid!=null) {
            User us2 = userRepository.getOne(Long.parseLong(darbuotojoid));
            mv.addObject("pasirinktasDarbuotojas", us2);
            if (metai != null) {
                mv.addObject("pasirinktiMetai", metai);
                if (pardavimaiLentRep.findAllByUseriukas_Id(us2.getId()) != null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us2.getId(), "I", metai));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us2.getId(), "II", metai));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us2.getId(), "III", metai));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us2.getId(), "IV", metai));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us2, metai));
                }
            } else {

                String defaultMetai = LocalDate.now().getYear() + "";
                mv.addObject("pasirinktiMetai", defaultMetai);
                if (pardavimaiLentRep.findAllByUseriukas_Id(us2.getId()) != null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us2.getId(), "I", defaultMetai));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us2.getId(), "II", defaultMetai));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us2.getId(), "III", defaultMetai));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us2.getId(), "IV", defaultMetai));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us2, defaultMetai));
                }
            }
        }else{
            User us= userService.findByUsername(principal.getName());
            mv.addObject("pasirinktasDarbuotojas", us);
            if (metai != null) {
                mv.addObject("pasirinktiMetai", metai);
                if (pardavimaiLentRep.findAllByUseriukas_Id(us.getId()) != null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(), "I", metai));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(), "II", metai));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(), "III", metai));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(), "IV", metai));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us, metai));
                }
            } else {

                String defaultMetai = LocalDate.now().getYear() + "";
                mv.addObject("pasirinktiMetai", defaultMetai);
                if (pardavimaiLentRep.findAllByUseriukas_Id(us.getId()) != null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(), "I", defaultMetai));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(), "II", defaultMetai));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(), "III", defaultMetai));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetai(us.getId(), "IV", defaultMetai));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us, defaultMetai));
                }
            }
        }



        if(pardavimoId!=null){
            if(pardavimoId.equals("new")){
                mv.addObject("modaladd", true);
                mv.addObject("modalupdate", false);
                mv.addObject("pardavimas", new PardavimaiLent());
            }else{
                mv.addObject("modaladd", true);
                mv.addObject("modalupdate", false);
                mv.addObject("pardavimas", pardavimaiLentRep.findById(Integer.parseInt(pardavimoId)));
            }

        }else {
            mv.addObject("pardavimas", new PardavimaiLent());
        }
        mv.setViewName("adminpardavimolent");


        return mv;
    }



}
