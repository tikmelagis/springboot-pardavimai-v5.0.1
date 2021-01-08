package com.jonaspetrauskas.dev.web;

import com.jonaspetrauskas.dev.model.BusinessUnit;
import com.jonaspetrauskas.dev.model.MenesioPlanas;
import com.jonaspetrauskas.dev.model.PardavimaiLent;
import com.jonaspetrauskas.dev.model.User;
import com.jonaspetrauskas.dev.repository.BusinessUnitRep;
import com.jonaspetrauskas.dev.repository.MenesioPlanasRep;
import com.jonaspetrauskas.dev.repository.PardavimaiLentRep;
import com.jonaspetrauskas.dev.repository.UserRepository;
import com.jonaspetrauskas.dev.service.PardavimaiService;
import com.jonaspetrauskas.dev.service.UserService;
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
import java.time.format.DateTimeParseException;
import java.util.List;

@Controller
public class PardavimuController {

    @Autowired
    private BusinessUnitRep businessUnitRep;

    @Autowired
    private PardavimaiLentRep pardavimaiLentRep;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PardavimaiService pardavimaiService;

    @Autowired
    private MenesioPlanasRep menesioPlanasRep;


    @RequestMapping(value = "/pardavimolent")
    public ModelAndView pardavimoLent(Principal principal,
                                      @RequestParam(name = "pardavimoid", required=false) String pardavimoId,
                                      @RequestParam(name = "metais", required=false) String metai,
                                      @RequestParam(name = "unit", required=false) Integer unitID,
                                      @RequestParam(name = "scrolas", required=false)Float scrolas){
        ModelAndView mv = new ModelAndView();
        mv.addObject("scrolas", scrolas);

        User us = userService.findByUsername(principal.getName());
        mv.addObject("metai", pardavimaiService.metai());
        mv.addObject("esamasUsername",us);

        BusinessUnit unit;


        if(unitID!=null){
           unit = businessUnitRep.getOne(unitID);
            mv.addObject("pasirinktasUnit", unit);
        }else{
            unit=userService.findByUsername(principal.getName()).getUnitas().get(0);
            mv.addObject("pasirinktasUnit", unit);
        }

        if(metai!=null){
                mv.addObject("pasirinktiMetai",metai);
                if(pardavimaiLentRep.findAllByUseriukas_Id(us.getId())!=null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(),"I",metai, unit));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(),"II",metai, unit));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(),"III",metai, unit));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(),"IV",metai, unit));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us,metai, unit));

                    mv.addObject("planasMenesio", menesioPlanasRep.findAllByPlanasMetaiAndPlanasUnit_IdAndPlanasUser_Id(Integer.parseInt(metai), unitID, us.getId()));
                }
        }else{

                String defaultMetai = LocalDate.now().getYear()+"";
                mv.addObject("pasirinktiMetai",defaultMetai);
                if(pardavimaiLentRep.findAllByUseriukas_Id(us.getId())!=null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(),"I",defaultMetai, unit));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(),"II",defaultMetai, unit));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(),"III",defaultMetai, unit));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(),"IV",defaultMetai, unit));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us,defaultMetai, unit));

                    mv.addObject("planasMenesio", menesioPlanasRep.findAllByPlanasMetaiAndPlanasUnit_IdAndPlanasUser_Id(Integer.parseInt(defaultMetai), unitID, us.getId()));
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
    public ModelAndView addPardavima(@ModelAttribute("pardavimas") PardavimaiLent pardavimaiLent, Principal principal,
                                     @RequestParam(name = "metais") String metai,
                                     @RequestParam(name = "unit") Integer unitID,
                                     @RequestParam(name = "scrolas")Float scrolas){
        ModelAndView mv = new ModelAndView();
        User user = userService.findByUsername(principal.getName());
        pardavimaiLent.setUseriukas(user);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate nuokada = LocalDate.parse(pardavimaiLent.getSprendimoPriemimoData(), formatter);
        pardavimaiLent.setMetai(String.valueOf(nuokada.getYear()));
        pardavimaiLent.setBunitas(businessUnitRep.getOne(unitID));
        pardavimaiLentRep.save(pardavimaiService.paskirstymasPar(pardavimaiLent));

        mv.setViewName("redirect:/pardavimolent?metais="+metai+"&unit="+unitID+"&scrolas="+scrolas);
        return mv;
    }

    @RequestMapping(value = "/admin/addPardavima")
    public ModelAndView addAdminPardavima(@ModelAttribute("pardavimas") PardavimaiLent pardavimaiLent,
                                          @RequestParam(name = "darbuotojoid") String darbuotojoId,
                                          @RequestParam(name = "metais") String metai,
                                          @RequestParam(name = "unit") Integer unitID,
                                          @RequestParam(name = "scrolas")Float scrolas){
        ModelAndView mv = new ModelAndView();
        User user = userRepository.getOne(Long.parseLong(darbuotojoId));
        pardavimaiLent.setUseriukas(user);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate nuokada = LocalDate.parse(pardavimaiLent.getSprendimoPriemimoData(), formatter);
        try{
            LocalDate lc = LocalDate.parse(pardavimaiLent.getPlanuojamaAtlikimoData2(),formatter);
        }catch (DateTimeParseException e){
            pardavimaiLent.setPlanuojamaAtlikimoData2(null);
        }
        pardavimaiLent.setMetai(String.valueOf(nuokada.getYear()));
        pardavimaiLent.setBunitas(businessUnitRep.getOne(unitID));
        pardavimaiLentRep.save(pardavimaiService.paskirstymasPar(pardavimaiLent));

        mv.setViewName("redirect:/admin/pardavimolent?darbuotojoid="+darbuotojoId+"&metais="+metai+"&unit="+unitID+"&scrolas="+scrolas);
        return mv;
    }

    @RequestMapping(value = "/pardavimolent/{id}/delete")
    public ModelAndView deletePard(@PathVariable("id") Integer id,
                                   @RequestParam(name = "metais") String metai,
                                   @RequestParam(name = "scrolas", required=false)Float scrolas){
        ModelAndView mv = new ModelAndView();
        pardavimaiLentRep.delete(pardavimaiLentRep.getOne(id));

        mv.setViewName("redirect:/pardavimolent?metais="+metai+"&scrolas="+scrolas);
        return mv;
    }

    @RequestMapping(value = "/admin/pardavimolent/{id}/delete")
    public ModelAndView deleteAdminPard(@PathVariable("id") Integer id,
                                        @RequestParam(name = "darbuotojoid") String darbuotojoId,
                                        @RequestParam(name = "metais") String metai,
                                        @RequestParam(name = "scrolas", required=false)Float scrolas){
        ModelAndView mv = new ModelAndView();
        pardavimaiLentRep.delete(pardavimaiLentRep.getOne(id));

        mv.setViewName("redirect:/admin/pardavimolent?darbuotojoid="+darbuotojoId+"&metais="+metai+"&scrolas="+scrolas);
        return mv;
    }


    @RequestMapping(value = "/admin/pardavimolent")
    public ModelAndView adminLent(Principal principal,@RequestParam(name = "pardavimoid", required=false) String pardavimoId,
                                  @RequestParam(name = "metais", required=false) String metai,
                                  @RequestParam(name = "darbuotojoid",required=false) String darbuotojoid,
                                  @RequestParam(name = "unit", required=false) Integer unitID,
                                  @RequestParam(name = "scrolas", required=false)Float scrolas,
                                  @RequestParam(name = "menuoPlanas", required=false)Long menuoPlanas,
                                  @RequestParam(name = "menuo", required=false)Integer menuo){
        ModelAndView mv= new ModelAndView();
        mv.addObject("scrolas", scrolas);
        mv.addObject("metai", pardavimaiService.metai());
        List<BusinessUnit> bunit = userService.findByUsername(principal.getName()).getUnitas();
        mv.addObject("esamasUsername",userService.findByUsername(principal.getName()));

        BusinessUnit unit;

        if(unitID!=null){
            unit = businessUnitRep.getOne(unitID);
            mv.addObject("pasirinktasUnit", unit);
            mv.addObject("visiPagalBusinessUnitDarbuotojai",userService.nau(unit,userRepository.findAllByRoles_Name( "ROLE_USER") ));
            mv.addObject("visiDarbuotojai", userService.nau(unit,userRepository.findAll()));
        }else{
            unit=userService.findByUsername(principal.getName()).getUnitas().get(0);
            mv.addObject("pasirinktasUnit", unit);
            mv.addObject("visiPagalBusinessUnitDarbuotojai",userService.nau(unit,userRepository.findAllByRoles_Name( "ROLE_USER") ));
            mv.addObject("visiDarbuotojai", userService.nau(unit, userRepository.findAll()));
        }

        if(darbuotojoid!=null) {
            User us2 = userRepository.getOne(Long.parseLong(darbuotojoid));
            mv.addObject("pasirinktasDarbuotojas", us2);
            if (metai != null) {
                mv.addObject("pasirinktiMetai", metai);
                if (pardavimaiLentRep.findAllByUseriukas_Id(us2.getId()) != null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us2.getId(), "I", metai, unit));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us2.getId(), "II", metai, unit));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us2.getId(), "III", metai, unit));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us2.getId(), "IV", metai, unit));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us2, metai, unit));

                    mv.addObject("planasMenesio", menesioPlanasRep.findAllByPlanasMetaiAndPlanasUnit_IdAndPlanasUser_Id(Integer.parseInt(metai), unitID, Long.parseLong(darbuotojoid)));
                }
            } else {

                String defaultMetai = LocalDate.now().getYear() + "";
                mv.addObject("pasirinktiMetai", defaultMetai);
                if (pardavimaiLentRep.findAllByUseriukas_Id(us2.getId()) != null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us2.getId(), "I", defaultMetai, unit));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us2.getId(), "II", defaultMetai, unit));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us2.getId(), "III", defaultMetai, unit));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us2.getId(), "IV", defaultMetai, unit));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us2, defaultMetai, unit));

                    mv.addObject("planasMenesio", menesioPlanasRep.findAllByPlanasMetaiAndPlanasUnit_IdAndPlanasUser_Id(Integer.parseInt(defaultMetai), unitID, Long.parseLong(darbuotojoid)));
                }
            }
        }else{
            User us= userService.findByUsername(principal.getName());
            mv.addObject("pasirinktasDarbuotojas", us);
            if (metai != null) {
                mv.addObject("pasirinktiMetai", metai);
                if (pardavimaiLentRep.findAllByUseriukas_Id(us.getId()) != null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(), "I", metai, unit));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(), "II", metai, unit));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(), "III", metai, unit));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(), "IV", metai, unit));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us, metai, unit));

                    mv.addObject("planasMenesio", menesioPlanasRep.findAllByPlanasMetaiAndPlanasUnit_IdAndPlanasUser_Id(Integer.parseInt(metai), unitID, us.getId()));
                }
            } else {

                String defaultMetai = LocalDate.now().getYear() + "";
                mv.addObject("pasirinktiMetai", defaultMetai);
                if (pardavimaiLentRep.findAllByUseriukas_Id(us.getId()) != null) {

                    mv.addObject("Iketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(), "I", defaultMetai, unit));
                    mv.addObject("IIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(), "II", defaultMetai, unit));
                    mv.addObject("IIIketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(), "III", defaultMetai, unit));
                    mv.addObject("IVketvirtis", pardavimaiLentRep.findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(us.getId(), "IV", defaultMetai, unit));

                    mv.addObject("infoall", pardavimaiService.paskaiciavimas(us, defaultMetai, unit));

                    mv.addObject("planasMenesio", menesioPlanasRep.findAllByPlanasMetaiAndPlanasUnit_IdAndPlanasUser_Id(Integer.parseInt(defaultMetai), unitID, us.getId()));
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


        if(menuoPlanas!=null){
            mv.addObject("modaladd", false);
            mv.addObject("modalupdate", false);
            mv.addObject("modalplanas", true);

            mv.addObject("menesioPlanasForm",menesioPlanasRep.getOne(menuoPlanas));
        }else if(menuo!=null){
            mv.addObject("modaladd", false);
            mv.addObject("modalupdate", false);
            mv.addObject("modalplanas", true);

            MenesioPlanas mp = new MenesioPlanas();
            mp.setPlanasMetai(Integer.parseInt(metai));
            mp.setPlanasUser(userRepository.getOne(Long.parseLong(darbuotojoid)));
            mp.setPlanasUnit(businessUnitRep.getOne(unitID));
            mp.setPlanasMenuo(menuo);
            mv.addObject("menesioPlanasForm",mp);
        }else{

            mv.addObject("modalplanas", false);
            mv.addObject("menesioPlanasForm",new MenesioPlanas());
        }

        mv.setViewName("adminpardavimolent");


        return mv;
    }

    @RequestMapping(value = "/addMenesioPlanas")
    public ModelAndView planasAdd(@ModelAttribute("menesioPlanasForm") MenesioPlanas menesioPlanas,
                                  @RequestParam(name = "scrolas")Float scrolas){
        ModelAndView mv= new ModelAndView();

        menesioPlanasRep.save(menesioPlanas);

        mv.setViewName("redirect:/admin/pardavimolent?metais="+menesioPlanas.getPlanasMetai()+"&unit="+menesioPlanas.getPlanasUnit().getId()+"&scrolas="+scrolas+"&darbuotojoid="+menesioPlanas.getPlanasUser().getId());
        return mv;
    }


}
