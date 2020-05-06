package com.jonaspetrauskas.civ.service;

import com.jonaspetrauskas.civ.model.User;
import com.jonaspetrauskas.civ.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        if(user.getId()==null) {
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
            System.out.println("NaujasUseris");
        }
        System.out.println("SenasUseris");
        userRepository.save(user);
    }

    @Override
    public void resetpass(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
