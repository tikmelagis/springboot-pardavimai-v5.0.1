package com.jonaspetrauskas.civ.service;

import com.jonaspetrauskas.civ.model.BiudzetoInfo;

import java.util.List;
import java.util.Map;

public interface BiudzetasService {

    public List<BiudzetoInfo> biudzetoInfoListas(String metai);

    Map<Integer, String> menesiai();
}
