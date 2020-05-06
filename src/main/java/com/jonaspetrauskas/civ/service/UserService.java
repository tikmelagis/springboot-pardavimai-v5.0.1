package com.jonaspetrauskas.civ.service;

import com.jonaspetrauskas.civ.model.User;

public interface UserService {
    void save(User user);

    void resetpass(User user);

    User findByUsername(String username);
}
