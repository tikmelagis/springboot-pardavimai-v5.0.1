package com.jonaspetrauskas.civ.service;

import com.jonaspetrauskas.civ.model.PardavimaiLent;
import com.jonaspetrauskas.civ.model.PardavimuPaskaiciavimas;
import com.jonaspetrauskas.civ.model.User;


import java.util.List;

public interface PardavimaiService {



    public PardavimaiLent paskirstymasPar(PardavimaiLent pardavimaiLent);

    public PardavimuPaskaiciavimas paskaiciavimas(User user, String metai);

    public List<String> metai();


}
