package com.jonaspetrauskas.dev.web;

import com.jonaspetrauskas.dev.model.ChangePass;
import com.jonaspetrauskas.dev.model.Role;
import com.jonaspetrauskas.dev.model.User;
import com.jonaspetrauskas.dev.repository.BusinessUnitRep;
import com.jonaspetrauskas.dev.repository.PardavimaiLentRep;
import com.jonaspetrauskas.dev.repository.RoleRepository;
import com.jonaspetrauskas.dev.repository.UserRepository;
import com.jonaspetrauskas.dev.service.UserService;
import com.jonaspetrauskas.dev.validator.PassChangeValidator;
import com.jonaspetrauskas.dev.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.security.Principal;


@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PassChangeValidator passChangeValidator;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private PardavimaiLentRep pardavimaiLentRep;

    @Autowired
    private BusinessUnitRep businessUnitRep;


    @RequestMapping(value = "/users/addUser")
    public ModelAndView addUser(@Valid @ModelAttribute("useris") User userForm, BindingResult bindingResult, RedirectAttributes redirectAttributes,@RequestParam(name = "status", required=false) String status){
        ModelAndView mv=new ModelAndView();
        if(status.equals("0")) {
            userValidator.validate(userForm, bindingResult);
            if (bindingResult.hasErrors()) {
                redirectAttributes.addFlashAttribute("bindcreate", bindingResult);
                redirectAttributes.addFlashAttribute("usform", userForm);
                mv.setViewName("redirect:/users?userid=" + "new");
                return mv;
            }
            userService.save(userForm);
        }else if(status.equals("1")){
            userService.save(userForm);
            mv.setViewName("redirect:/users");
            return mv;
        }
        mv.setViewName("redirect:/users");
        return mv;
    }

    @RequestMapping(value = "/users")
    public ModelAndView usersList(Model model,@RequestParam(name = "userid", required=false) String userId, @RequestParam(name = "idtochange", required=false) Long idtochange, Principal principal){
        ModelAndView mv=new ModelAndView();
        User useris= userService.findByUsername(principal.getName());
        mv.addObject("vartotojas", useris);
        mv.addObject("adminas", roleRepository.findById(1L));
        for(Role r: useris.getRoles()){
            if(r.getName().equals("ROLE_ADMIN")){
                mv.addObject("rolesvisos",roleRepository.findAll());

            }
            else{
                mv.addObject("rolesvisos",roleRepository.findAllByNameNotContains("ROLE_ADMIN"));

            }
        }
        mv.addObject("users", userRepository.findAll());

        mv.addObject("unitaivisi",businessUnitRep.findAll());


        if(userId!=null){
            if(userId.equals("new")){
                mv.addObject("modaladd", true);
                mv.addObject("modalupdate", false);
                mv.addObject("modalchangepass", false);
                mv.addObject("changepassform",new ChangePass());

                mv.addObject("status", "0");

                if(model.asMap().get("bindcreate")!=null){
                    BindingResult brCreate =(BindingResult) model.asMap().get("bindcreate");
                    User user = (User) model.asMap().get("usform");
                    mv.addObject("useris",user);
                    if(brCreate.hasErrors()){
                        mv.addObject("ereCreate", brCreate);
                        mv.setViewName("/userlist");
                        return mv;
                    }
                }
                mv.addObject("useris", new User());



            }else if(idtochange!=null){
                mv.addObject("modaladd", false);
                mv.addObject("modalupdate", false);
                mv.addObject("modalchangepass", true);
                mv.addObject("useris", userRepository.getOne(Long.parseLong(userId)));
                //mv.addObject("changepassform",new ChangePass(Long.parseLong(userId),"",""));
                if(model.asMap().get("bind")!=null){
                    BindingResult br =(BindingResult) model.asMap().get("bind");
                    ChangePass changePass = (ChangePass) model.asMap().get("ch");
                    mv.addObject("changepassform",changePass);
                    if(br.hasErrors()){
                        mv.addObject("ere", br);
                        mv.setViewName("/userlist");
                        return mv;
                    }
                }
                mv.addObject("changepassform",new ChangePass(Long.parseLong(userId),"",""));

            }else{
                mv.addObject("modaladd", false);
                mv.addObject("modalupdate", true);
                mv.addObject("modalchangepass", false);
                mv.addObject("useris", userRepository.findById(Long.parseLong(userId)));
                mv.addObject("changepassform",new ChangePass());

                mv.addObject("status", "1");

            }
        }else {
            mv.addObject("useris", new User());
            mv.addObject("changepassform",new ChangePass());
        }



        mv.setViewName("/userlist");
        return mv;
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Vartotojas arba/ir slaptažodis nėra teisingi");

        if (logout != null)
            model.addAttribute("message", "Atsijungėte sėkminai !");

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"})
    public ModelAndView welcome(Model model, Principal principal) {
        ModelAndView mv = new ModelAndView();
        User us = userService.findByUsername(principal.getName());
        if(pardavimaiLentRep.findAllByUseriukas_Id(us.getId())!=null) {
            mv.addObject("stufas", pardavimaiLentRep.findAllByUseriukas_Id(us.getId()));
        }
        mv.setViewName("welcome");
        return mv;
    }


    @RequestMapping(value = "/admin/home")
    public ModelAndView adminas(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("admin");
        return mv;
    }

    @RequestMapping(value = "/changePassword")
    public ModelAndView changePassword(@Valid @ModelAttribute("changepassform") ChangePass changePass, BindingResult bindingResult, RedirectAttributes redirectAttributes){
        ModelAndView mv = new ModelAndView();
        User user= userRepository.getOne(changePass.getId2());
        passChangeValidator.validate(changePass,bindingResult);
        if(bindingResult.hasErrors()){

            redirectAttributes.addFlashAttribute("bind",bindingResult);
            redirectAttributes.addFlashAttribute("ch",changePass);
            mv.setViewName("redirect:/users?userid="+changePass.getId2()+"&idtochange="+changePass.getId2());
            return mv;
        }

        user.setPassword(changePass.getPassword2());
        userService.resetpass(user);


        mv.setViewName("redirect:/users");
        return  mv;
    }


    @RequestMapping(value ="/chpu")
    public ModelAndView chpu(Principal principal, Model model) {
        ModelAndView mv = new ModelAndView();
        ChangePass cp = new ChangePass();
        cp.setId2(userService.findByUsername(principal.getName()).getId());
        mv.addObject("changepassform",cp);

        if(model.asMap().get("bind")!=null){
            BindingResult br =(BindingResult) model.asMap().get("bind");
            ChangePass changePass = (ChangePass) model.asMap().get("ch");
            mv.addObject("changepassform",changePass);
            if(br.hasErrors()){
                mv.addObject("ere", br);
                mv.setViewName("/changepassword");
                return mv;
            }
        }

        mv.setViewName("changepassword");
        return mv;
    }

    @RequestMapping(value = "/changePasswordUser")
    public ModelAndView changePasswordUser(@Valid @ModelAttribute("changepassform") ChangePass changePass, BindingResult bindingResult, RedirectAttributes redirectAttributes){
        ModelAndView mv = new ModelAndView();
        User user= userRepository.getOne(changePass.getId2());
        passChangeValidator.validate(changePass,bindingResult);
        if(bindingResult.hasErrors()){

            redirectAttributes.addFlashAttribute("bind",bindingResult);
            redirectAttributes.addFlashAttribute("ch",changePass);
            mv.setViewName("redirect:/chpu");
            return mv;
        }

        user.setPassword(changePass.getPassword2());
        userService.resetpass(user);


        mv.setViewName("redirect:/");
        return  mv;
    }




}
