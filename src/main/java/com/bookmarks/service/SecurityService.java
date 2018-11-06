package com.bookmarks.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SecurityService {
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    @Qualifier("userDetailServiceImpl")
    private UserDetailsService userDetailsService;
    @Autowired
    private AuthenticationManager authenticationManager;

    public void login(String userName, String password) {
        UserDetails userDetails = userDetailsService.loadUserByUsername(userName);
        System.out.println("password = " + password + " " + "userDetails.getPassword() = " + userDetails.getPassword());
//        log.info(" userDetails from user service {}", userDetails);
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());
//        log.info("usernamePasswordAuthenticationToken = {}", usernamePasswordAuthenticationToken);
        authenticationManager.authenticate(usernamePasswordAuthenticationToken);

        if (usernamePasswordAuthenticationToken.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
            System.out.println(String.format("Auto login %s successfully! ", userName));
        }
    }

    //авторизируем пользователя
    public void login(UserDetails user, String password) {
        System.out.println(user);
        System.out.println(String.format("login successful (%s) , %s", user.getUsername(), user.getPassword()));
        UsernamePasswordAuthenticationToken upat = new UsernamePasswordAuthenticationToken(user, password, user.getAuthorities());
        System.out.println("authenticate");
        authenticationManager.authenticate(upat);
        System.out.println("authenticate end");
        SecurityContextHolder.getContext().setAuthentication(upat);
        System.out.println("authenticate end end");
    }
}

