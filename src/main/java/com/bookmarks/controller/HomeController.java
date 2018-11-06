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

    @PostMapping("/menu/add")
    public String add(@ModelAttribute Menu menu, Model model) {
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
        redirectAttributes.addFlashAttribute("aimMenu", nameMenu);
        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findByMenu(nameMenu));

        return "redirect:home";
    }

    @PostMapping("/bookmark/add")
    public String addBookmarkInTargetMenu(@ModelAttribute Bookmark bookmark, @RequestParam("aimMenu") String nameMenu, RedirectAttributes redirectAttributes) {
        bookmarkService.save(bookmark, menuService.findMenuByNameMenu(nameMenu));
        redirectAttributes.addFlashAttribute("aimMenu", nameMenu);
        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findByMenu(nameMenu));
        return "redirect:/home";
    }
}
