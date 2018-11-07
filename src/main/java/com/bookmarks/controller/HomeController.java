package com.bookmarks.controller;

import com.bookmarks.dao.model.Bookmark;
import com.bookmarks.dao.model.Menu;
import com.bookmarks.dao.model.UserInfo;
import com.bookmarks.service.BookmarkService;
import com.bookmarks.service.MenuService;
import com.bookmarks.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private BookmarkService bookmarkService;
    @Autowired
    private MenuService menuService;
    @Autowired
    @Qualifier("userDetailServiceImpl")
    private UserDetailsService userDetailsService;
    @Autowired
    private UserService userService;

    @GetMapping
    public String home(Model model, @ModelAttribute("aimMenu") String nameMenu, @ModelAttribute("listBookmark") ArrayList<Bookmark> listBookmark) {
        System.out.println("in /home");
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (listBookmark != null) {
            model.addAttribute("listBookmark", listBookmark);
        } else {
            model.addAttribute("listBookmark", bookmarkService.findBookmarkByFirstMenu());
        }

        model.addAttribute("aimMenu", nameMenu);
        model.addAttribute("menu", new Menu());
        model.addAttribute("bookmark", new Bookmark());
        model.addAttribute("listMenu", menuService.findMenuByNameUser(userDetails.getUsername()));
        return "home";
    }

    @PostMapping("/menu/add")
    public String add(@ModelAttribute Menu menu, Model model) {
        System.out.println("-------- in /home/menu/add");
        System.out.println(menu.toString());

        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        UserInfo userInfo = userService.findByUsername(userDetails.getUsername());

        System.out.println("userInfo = " + userInfo.toString());

        menu.setUserInfo(userInfo);
        menuService.save(menu);
        return "redirect:/home";
    }

    @GetMapping("{menu}")
    public String selectMenuBookmark(@PathVariable("menu") String nameMenu, RedirectAttributes redirectAttributes) {
        System.out.println("-------- in /home/{menu}");
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println("-------- in /home/{menu} --------2");
        redirectAttributes.addFlashAttribute("aimMenu", nameMenu);
        UserInfo userInfo = userService.findByUsername(userDetails.getUsername());
        System.out.println("-------- in /home/{menu} --------3");
        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenuAndUserInfo(nameMenu, userInfo ));
        System.out.println("-------- in /home/{menu} --------4");

        return "redirect:/home";
    }

    @PostMapping("/bookmark/add")
    public String addBookmarkInTargetMenu(@ModelAttribute Bookmark bookmark, @RequestParam("aimMenu") String nameMenu, RedirectAttributes redirectAttributes) {
        System.out.println("-------- in /home/bookmark/add");
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println("-------- in /home/bookmark/add ---------2");
        UserInfo userInfo = userService.findByUsername(userDetails.getUsername());
        bookmarkService.save(bookmark, menuService.findMenuByNameMenu(nameMenu, userInfo), userInfo);
        System.out.println("-------- in /home/bookmark/add ---------3");
        redirectAttributes.addFlashAttribute("aimMenu", nameMenu);
        System.out.println("-------- in /home/bookmark/add ---------4");
        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenuAndUserInfo(nameMenu, userService.findByUsername(userDetails.getUsername())));
        System.out.println("-------- in /home/bookmark/add ---------5");
        return "redirect:/home";
    }
}
