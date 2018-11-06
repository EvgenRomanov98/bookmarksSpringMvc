package com.bookmarks.controller;

import com.bookmarks.dao.model.Bookmark;
import com.bookmarks.dao.model.Menu;
import com.bookmarks.dao.model.UserInfo;
import com.bookmarks.service.MenuService;
import com.bookmarks.service.SecurityService;
import com.bookmarks.service.UserService;
import com.bookmarks.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class StartController {

    @Autowired
    private SecurityService securityService;
    @Autowired
    private UserService userService;
    @Autowired
    private UserValidator userValidator;
    @Autowired
    private MenuService menuService;
//
//    @InitBinder
//    protected void initBinder(WebDataBinder binder) {
//        binder.addValidators(userValidator);
//    }


    @GetMapping
    public String start() {
        return "index";
    }

    @GetMapping("login")
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Your username and password is invalid.");
        }
        if (logout != null) {
            model.addAttribute("message", "You have been logged out successfully.");
        }
        return "login";
    }


    @GetMapping("registration")
    public String registration(Model model) {
        model.addAttribute("userInfoForm", new UserInfo());
        System.out.println("in /registration get");
        return "registration";
    }

    @PostMapping("registration")
    public String registration(@ModelAttribute("userInfoForm") UserInfo userInfoForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userInfoForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        System.out.println("in /registration post " + userInfoForm.getUsername() + " " + userInfoForm.getPasswordConfirm());

        UserDetails user = userService.save(userInfoForm);
        securityService.login(user, userInfoForm.getPasswordConfirm()); // возвращаю юзера при save с заполненными ролями, что бы не ходить в базу данных

        System.out.println("in /registration post end");
        return "redirect:home";

    }

    @GetMapping("home")
    public String home(Model model, @ModelAttribute("aimMenu") String nameMenu, @ModelAttribute("listBookmark") ArrayList<Bookmark> listBookmark) {
        System.out.println("in /home");

        if (listBookmark != null){
            model.addAttribute("listBookmark", listBookmark);
        }
        
        model.addAttribute("aimMenu", nameMenu);
        model.addAttribute("menu", new Menu());
        model.addAttribute("bookmark", new Bookmark());
        model.addAttribute("listMenu", menuService.findAll());
        return "home";
    }
}