package com.jonaspetrauskas.civ.web;

import com.jonaspetrauskas.civ.model.Biudzetas;
import com.jonaspetrauskas.civ.model.BusinessUnit;
import com.jonaspetrauskas.civ.repository.BiudzetasRep;
import com.jonaspetrauskas.civ.repository.BusinessUnitRep;
import com.jonaspetrauskas.civ.service.BiudzetasService;
import com.jonaspetrauskas.civ.service.PardavimaiService;
import com.jonaspetrauskas.civ.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BiudzetasController {

    @Autowired
    private BiudzetasService biudzetasService;

    @Autowired
    private PardavimaiService pardavimaiService;

    @Autowired
    private BiudzetasRep biudzetasRep;

    @Autowired
    private BusinessUnitRep businessUnitRep;

    @Autowired
    private UserService userService;

    @RequestMapping(value="/biudzetas")
    public ModelAndView budList(Principal principal, @RequestParam(name = "metai1", required=false) String metai,
                                @RequestParam(name="menuo1",  required=false) String menuo,
                                @RequestParam(name = "unitasName", required=false)String unitasName ){
        ModelAndView mv= new ModelAndView();
        mv.addObject("metukai", pardavimaiService.metai());
        List<String> buninames=new ArrayList<>();
        for(BusinessUnit b: userService.findByUsername(principal.getName()).getUnitas()){
                buninames.add(b.getName());
        }
        mv.addObject("principal",buninames);

        if(metai!=null) {
            if(menuo!=null && unitasName!=null) {
                mv.addObject("modaladd", true);
                BusinessUnit bus= businessUnitRep.findByName(unitasName);
                if (biudzetasRep.existsByMetaiAndMenuoAndBusinessUnit(metai, menuo, bus) == true) {
                    mv.addObject("pasirinktiMetai", metai);
                    mv.addObject("biudzetas", biudzetasService.biudzetoInfoListas(metai));
                    mv.addObject("menesiai", biudzetasService.menesiai());
                    mv.addObject("addUpBud",biudzetasRep.findBiudzetasByMetaiEqualsAndMenuoEqualsAndBusinessUnitEquals(metai, menuo, bus));
                    mv.addObject("metai2",metai);
                    mv.addObject("menuo2",menuo);
                    mv.addObject("unitas2",bus);
                }else{
                    mv.addObject("metai2",metai);
                    mv.addObject("menuo2",menuo);
                    mv.addObject("unitas2",bus);
                    mv.addObject("pasirinktiMetai", metai);
                    mv.addObject("biudzetas", biudzetasService.biudzetoInfoListas(metai));
                    mv.addObject("menesiai", biudzetasService.menesiai());
                    mv.addObject("addUpBud", new Biudzetas());

                }
            } else {
                mv.addObject("pasirinktiMetai", metai);
                mv.addObject("biudzetas", biudzetasService.biudzetoInfoListas(metai));
                mv.addObject("menesiai", biudzetasService.menesiai());
                mv.addObject("addUpBud", new Biudzetas());

            }
        }else{
            mv.addObject("pasirinktiMetai", LocalDate.now().getYear());
            mv.addObject("biudzetas", biudzetasService.biudzetoInfoListas(String.valueOf(LocalDate.now().getYear())));
            mv.addObject("menesiai", biudzetasService.menesiai());
            mv.addObject("addUpBud", new Biudzetas());

        }


        mv.setViewName("/bendriukiupardavimai");
        return mv;
    }


    @RequestMapping(value = "/admin/addUpdateBud")
    public ModelAndView addbudup(@ModelAttribute("addUpBud")Biudzetas biudzetas,
                                 @RequestParam(name = "metai1") String metai,
                                 @RequestParam(name="menuo1") String menuo,
                                 @RequestParam(name = "unitasName")String unitasName){
        ModelAndView mv = new ModelAndView();

        BusinessUnit bus= businessUnitRep.findByName(unitasName);
        Biudzetas biu;

        if (biudzetas.getId()!=null) {
            biu = biudzetas;
            System.out.println("SENAS");
        } else {
            biu = new Biudzetas();
            biu.setMetai(metai);
            biu.setMenuo(menuo);
            biu.setBusinessUnit(bus);
            biu.setMenesioBiudzetasUkio(biudzetas.getMenesioBiudzetasUkio());
            biu.setFaktiskaiUzaktuotaSumaFMS(biudzetas.getFaktiskaiUzaktuotaSumaFMS());
            System.out.println("NAUJAS");
        }
        biudzetasRep.save(biu);
        mv.setViewName("redirect:/biudzetas?metai1="+metai);
        return mv;
    }

}
