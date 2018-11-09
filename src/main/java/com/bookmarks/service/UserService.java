package com.bookmarks.service;

import com.bookmarks.dao.model.Role;
import com.bookmarks.dao.model.UserInfo;
import com.bookmarks.dao.repository.RoleRepository;
import com.bookmarks.dao.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Transactional
public class UserService {

    private Logger logger = LoggerFactory.getLogger(UserService.class);
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    public User save(UserInfo userInfo) {
        try {
            System.out.println("in method save in UserService");
            userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
            Role role = roleRepository.getOne(2L);
            Set<Role> roles = new HashSet<>(Collections.singleton(role));
            userInfo.setRoles(roles);
            userRepository.save(userInfo);
            // вконце создаем юзера для дальнейшей авторизации в StartController в методе registration()

            Set<GrantedAuthority> grantedAuthorities = new HashSet<>();

            roles.forEach(v -> {
                grantedAuthorities.add(new SimpleGrantedAuthority(v.getName()));
            });

            return new User(userInfo.getUsername(), userInfo.getPassword(), grantedAuthorities);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public UserInfo findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public List<UserInfo> findAll() {
        return userRepository.findAll();
    }
}
