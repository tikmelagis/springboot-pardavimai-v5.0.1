package com.jonaspetrauskas.dev.service;

import com.jonaspetrauskas.dev.model.BusinessUnit;
import com.jonaspetrauskas.dev.model.User;
import com.jonaspetrauskas.dev.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public List<User> nau(BusinessUnit unit, List<User> userList) {
        List<User> ll= new ArrayList<>();
        for(User u: userList){
            if(u.getUnitas().stream().anyMatch(o -> o.equals(unit))){
                    ll.add(u);
            }
        }

        return ll;
    }


}
