package com.jonaspetrauskas.dev.service;

import com.jonaspetrauskas.dev.model.BiudzetasInfoUser;
import com.jonaspetrauskas.dev.model.BiudzetoInfo;

import java.util.List;
import java.util.Map;

public interface BiudzetasService {

    public List<BiudzetoInfo> biudzetoInfoListas(String metai);

    Map<Integer, String> menesiai();

    public List<BiudzetasInfoUser> biudzetoInfoPagalUser(String metai);
}
