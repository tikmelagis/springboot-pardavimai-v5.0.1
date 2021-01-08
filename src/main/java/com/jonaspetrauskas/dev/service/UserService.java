package com.jonaspetrauskas.dev.service;

import com.jonaspetrauskas.dev.model.BusinessUnit;
import com.jonaspetrauskas.dev.model.User;

import java.util.List;


public interface UserService {
    void save(User user);

    void resetpass(User user);

    User findByUsername(String username);

    List<User> nau(BusinessUnit unit, List<User> userList);
}
