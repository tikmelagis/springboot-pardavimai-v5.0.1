package com.jonaspetrauskas.dev.web;


import com.jonaspetrauskas.dev.model.Attachmentai;
import com.jonaspetrauskas.dev.model.Komentarai;
import com.jonaspetrauskas.dev.model.ResponseKomentaras;
import com.jonaspetrauskas.dev.repository.PardavimaiLentRep;
import com.jonaspetrauskas.dev.repository.komentarai.AttachmentaiRep;
import com.jonaspetrauskas.dev.repository.komentarai.KomentaraiRep;
import com.jonaspetrauskas.dev.repository.komentarai.ResponseKomentaraiRep;
import com.jonaspetrauskas.dev.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class KomentaraiController {

    private static final String UPLOADED_FOLDER = "/opt/tomcat/webapps/files/";
    //private static final String UPLOADED_FOLDER = System.getProperty( "catalina.base")+"/webapps/";

    @Autowired
    private PardavimaiLentRep pardavimaiLentRep;

    @Autowired
    private KomentaraiRep komentaraiRep;

    @Autowired
    private UserService userService;

    @Autowired
    private AttachmentaiRep attachmentaiRep;

    @Autowired
    private ResponseKomentaraiRep responseKomentaraiRep;

    @RequestMapping(value = "/viewPardavimas/{pardavimoid}")
    public ModelAndView viewPardavimas(@PathVariable("pardavimoid") Integer pardavimoid,
                                       @RequestParam(name = "komentaras", required=false) String komentadd,
                                       @RequestParam(name = "responsekomentaras", required=false) String responsekomentaras,
                                       @RequestParam(name = "attachmentas", required=false) String atachmentas){
        ModelAndView mv = new ModelAndView();
        mv.addObject("pardavimas",pardavimaiLentRep.getOne(pardavimoid));
        mv.addObject("komentarai", komentaraiRep.findAllByPardavimas_Id(pardavimoid));
        mv.addObject("attachmentai", attachmentaiRep.findAllByPardavimas_Id(pardavimoid));
        mv.addObject("komentForm", new Komentarai());
        mv.addObject("responseForm",new ResponseKomentaras());
        mv.addObject("attachmentForm", new Attachmentai());

        if(komentadd!=null){
            mv.addObject("modaladd", true);

        }else{
            mv.addObject("modaladd", false);
        }
        if(responsekomentaras!=null){
            mv.addObject("modaladdresp", true);
            mv.addObject("komentaroid", responsekomentaras);
        }else{
            mv.addObject("modaladdresp", false);
        }
        if(atachmentas!=null){
            mv.addObject("modaladdfile", true);
        }else{
            mv.addObject("modaladdfile", false);
        }

        mv.setViewName("/viewpardavimas");
        return mv;
    }

    @RequestMapping(value = "/komentadd/{pardavimoid}")
    public ModelAndView komentAdd(@PathVariable("pardavimoid") Integer pardavimoid, @ModelAttribute("komentForm") Komentarai komentaras, Principal principal){
        ModelAndView mv=new ModelAndView();
        komentaras.setPardavimas(pardavimaiLentRep.getOne(pardavimoid));
        LocalDateTime esamaslaikas= LocalDateTime.now();
        String komentaroData =  esamaslaikas.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        komentaras.setKomentaroData(komentaroData);
        komentaras.setVartotojas(userService.findByUsername(principal.getName()));

        komentaraiRep.save(komentaras);
        mv.setViewName("redirect:/viewPardavimas/"+komentaras.getPardavimas().getId());
        return mv;
    }

    @RequestMapping(value = "/komentaddresponse/{komentaroid}")
    public ModelAndView komentAddResponse(@PathVariable("komentaroid") Long komentaroid,
                                          @ModelAttribute("responseForm") ResponseKomentaras responseKomentaras,
                                          Principal principal){
        ModelAndView mv = new ModelAndView();
        responseKomentaras.setKomentarasfor(komentaraiRep.getOne(komentaroid));
        responseKomentaras.setVartotojas(userService.findByUsername(principal.getName()));
        LocalDateTime esamaslaikas= LocalDateTime.now();
        String responseData =  esamaslaikas.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        responseKomentaras.setKomentaroData(responseData);

        responseKomentaraiRep.save(responseKomentaras);
        mv.setViewName("redirect:/viewPardavimas/"+komentaraiRep.getOne(komentaroid).getPardavimas().getId());
        return mv;
    }

    @RequestMapping(value = "/upload/{pardavimoid}")
    public ModelAndView uploadFile(@ModelAttribute("attachmentForm")Attachmentai attachmentai,
                                   @PathVariable("pardavimoid") Integer pardavimoid, Principal principal ) {
        ModelAndView mv=new ModelAndView();
        MultipartFile file = attachmentai.getMultipartFile();
        attachmentai.setPardavimas(pardavimaiLentRep.getOne(pardavimoid));
        attachmentai.setVartotojas(userService.findByUsername(principal.getName()));
        LocalDateTime esamaslaikas= LocalDateTime.now();
        String ikelimoData =  esamaslaikas.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        attachmentai.setIkelimoData(ikelimoData);
        try {
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER  +pardavimoid+file.getOriginalFilename());
            Files.write(path, bytes);
            attachmentai.setFilePath(pardavimoid+file.getOriginalFilename());
        } catch (IOException e) {
            e.printStackTrace();
        }

        attachmentaiRep.save(attachmentai);
        mv.setViewName("redirect:/viewPardavimas/"+pardavimoid);
        return mv;
    }

    @RequestMapping(value="/getpdf/{attid}")
    public ResponseEntity<byte[]> getPDF1(@PathVariable("attid") Long attid,
                                          @RequestParam(name = "todo", required=false) String todo) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        String filename = attachmentaiRep.getOne(attid).getFilePath();
        String extension = "";

        int i = filename.lastIndexOf('.');
        if (i > 0) {
            extension = filename.substring(i+1);
        }

        if(extension.equals("jpg") || extension.equals("jpeg")){
            headers.setContentType(MediaType.parseMediaType("image/jpeg"));
        }else if(extension.equals("pdf")){
            headers.setContentType(MediaType.parseMediaType("application/pdf"));
        }else if(extension.equals("png")){
            headers.setContentType(MediaType.parseMediaType("image/png"));
        }else if(extension.equals("txt")){
            headers.setContentType(MediaType.parseMediaType("text/plain"));
        }else if(extension.equals("gif")){
            headers.setContentType(MediaType.parseMediaType("image/gif"));
        }else if(extension.equals("xlsx")){
            headers.setContentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
        }else if(extension.equals("xltx")){
            headers.setContentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.template"));
        }else if(extension.equals("xlsm")){
            headers.setContentType(MediaType.parseMediaType("application/vnd.ms-excel.sheet.macroEnabled.12"));
        }else if(extension.equals("xltm")){
            headers.setContentType(MediaType.parseMediaType("application/vnd.ms-excel.template.macroEnabled.12"));
        }else if(extension.equals("xlam")){
            headers.setContentType(MediaType.parseMediaType("application/vnd.ms-excel.addin.macroEnabled.12"));
        }else if(extension.equals("xlsb")){
            headers.setContentType(MediaType.parseMediaType("application/vnd.ms-excel.sheet.binary.macroEnabled.12"));
        }else if(extension.equals("xls") || extension.equals("xlt") || extension.equals("xla")){
            headers.setContentType(MediaType.parseMediaType("application/vnd.ms-excel"));
        }else if(extension.equals("doc") || extension.equals("dot")){
            headers.setContentType(MediaType.parseMediaType("application/msword"));
        }else if(extension.equals("docx")){
            headers.setContentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.wordprocessingml.document"));
        }else if(extension.equals("dotx")){
            headers.setContentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.wordprocessingml.template"));
        }else if(extension.equals("docm")){
            headers.setContentType(MediaType.parseMediaType("application/vnd.ms-word.document.macroEnabled.12"));
        }else if(extension.equals("dotm")){
            headers.setContentType(MediaType.parseMediaType("application/vnd.ms-word.template.macroEnabled.12"));
        }


        if(todo.equals("view")) {
            headers.add("content-disposition", "inline; filename=" + filename);
        }else if(todo.equals("download")){
            headers.add("Content-Disposition", "attachment; filename=" + filename);
        }
        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
        Path path = Paths.get(UPLOADED_FOLDER + filename);
        byte[] bt= Files.readAllBytes(path);
        return new ResponseEntity<byte[]>(bt,headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/getpdf/{attid}/delete/{pardavimoid}")
    public ModelAndView attDelete(@PathVariable("attid") Long attid,@PathVariable("pardavimoid") Integer pardavimoid ){
        ModelAndView mv = new ModelAndView();
        Path path = Paths.get(UPLOADED_FOLDER  +attachmentaiRep.getOne(attid).getFilePath());
        try
        {
            Files.deleteIfExists(path);

        }
        catch(NoSuchFileException e)
        {
            System.out.println("No such file/directory exists");
        } catch (IOException e) {
            e.printStackTrace();
        }
        attachmentaiRep.deleteById(attid);
        mv.setViewName("redirect:/viewPardavimas/"+pardavimoid);
        return mv;
    }


}
