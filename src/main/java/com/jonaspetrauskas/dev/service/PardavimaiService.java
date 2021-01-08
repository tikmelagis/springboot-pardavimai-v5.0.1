package com.jonaspetrauskas.dev.service;

import com.jonaspetrauskas.dev.model.BusinessUnit;
import com.jonaspetrauskas.dev.model.PardavimaiLent;
import com.jonaspetrauskas.dev.model.PardavimuPaskaiciavimas;
import com.jonaspetrauskas.dev.model.User;


import java.util.List;

public interface PardavimaiService {



    public PardavimaiLent paskirstymasPar(PardavimaiLent pardavimaiLent);


    public PardavimuPaskaiciavimas paskaiciavimas(User user, String metai, BusinessUnit unit);

    public List<String> metai();


}
