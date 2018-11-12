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
import java.util.Collections;

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

    //    @GetMapping
//    public String home(Model model, @ModelAttribute("aimMenu") String nameMenu, @ModelAttribute("listBookmark") ArrayList<Bookmark> listBookmark) {
//        System.out.println("in /home");
//        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        if (!listBookmark.isEmpty()) {
//            System.out.println("listBookmark != null " + listBookmark);
//            model.addAttribute("listBookmark", listBookmark);
//        } else if (){
//            System.out.println("listBookmark == null");
//            model.addAttribute("listBookmark", new ArrayList<Bookmark>(Collections.singleton(new Bookmark("у вас пока нет закладок"))));
//        }
//
//        model.addAttribute("aimMenu", nameMenu);
//        model.addAttribute("menu", new Menu());
//        model.addAttribute("bookmark", new Bookmark());
//        model.addAttribute("bookmarkEdit", new Bookmark());
//        model.addAttribute("listMenu", menuService.findMenuByNameUser(userDetails.getUsername()));
//        return "home";
//    }
    @GetMapping
    public String home(Model model, @ModelAttribute("aimMenu") Menu aimMenu, @ModelAttribute("listBookmark") ArrayList<Bookmark> listBookmark) {
        System.out.println("in /home");

        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("aimMenu", aimMenu);
        model.addAttribute("listBookmark", listBookmark);
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

    @GetMapping("/selectBookmark/{idMenu}")
    public String selectMenuBookmark(@PathVariable("idMenu") Long idMenu, RedirectAttributes redirectAttributes) {
        System.out.println("-------- in /home/selectBookmark");

        Menu aimMenu = menuService.findMenuById(idMenu);
        redirectAttributes.addFlashAttribute("aimMenu", aimMenu);
        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenu(aimMenu));

        return "redirect:/home";
    }

    @PostMapping("/bookmark/add")
    public String addBookmarkInTargetMenu(@ModelAttribute Bookmark bookmark, @RequestParam("aimMenuId") Long
            aimMenuId, RedirectAttributes redirectAttributes) {

        System.out.println("-------- in /home/bookmark/add");
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Menu aimMenu = menuService.findMenuById(aimMenuId);
        bookmarkService.save(bookmark, aimMenu);

        redirectAttributes.addFlashAttribute("aimMenu", aimMenu);
        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenu(aimMenu));

        return "redirect:/home";
    }

    @GetMapping("/menu/del/{aimMenuId}/{idMenu}")
    public String delMenu(@PathVariable("aimMenuId") Long aimMenuId, @PathVariable("idMenu") Long
            idMenuDel, RedirectAttributes redirectAttributes) {
        System.out.println("home/menu/del/{aimMenuId}/{idMenu}");
        menuService.deleteById(idMenuDel);

        Menu aimMenu;
        if (aimMenuId.longValue() == idMenuDel.longValue()) {
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            UserInfo userInfo = userService.findByUsername(userDetails.getUsername());
            aimMenu = menuService.findFirstMenuOfThisUser(userInfo);
        } else {
            aimMenu = menuService.findMenuById(aimMenuId);
        }

        redirectAttributes.addFlashAttribute("aimMenu", aimMenu);
        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenu(aimMenu));

        return "redirect:/home";
    }

//    @GetMapping("/menu/edit/{aimMenu}/{idMenu}")
//    public String editMenu(@PathVariable("aimMenu") String aimMenu,
//                           @PathVariable("idMenu") int idMenu, RedirectAttributes redirectAttributes) {
//
//
//        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//
//        redirectAttributes.addFlashAttribute("aimMenu", aimMenu);
//        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenuAndUserInfo(aimMenu, userService.findByUsername(userDetails.getUsername())));
//
//        return "redirect:/home";
//    }
//
//    @GetMapping("/bookmark/del/{aimMenu}/{idBookmark}")
//    public String delBookmark(@PathVariable("aimMenu") String aimMenu, @PathVariable("idBookmark") Long
//            idBookmark, RedirectAttributes redirectAttributes) {
//
//        bookmarkService.deleteById(idBookmark);
//
//        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//
//        redirectAttributes.addFlashAttribute("aimMenu", aimMenu);
//        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenuAndUserInfo(aimMenu, userService.findByUsername(userDetails.getUsername())));
//
//        return "redirect:/home";
//    }
//
//    @GetMapping("/bookmark/edit/{aimMenu}/{idBookmark}")
//    public String editBookmark(@PathVariable("aimMenu") String aimMenu,
//                               @PathVariable("idBookmark") int idBookmark, RedirectAttributes redirectAttributes) {
//        System.out.println("aimMenu = " + aimMenu + "idBookmark = " + idBookmark);
//
//        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//
//        redirectAttributes.addFlashAttribute("aimMenu", aimMenu);
//        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenuAndUserInfo(aimMenu, userService.findByUsername(userDetails.getUsername())));
//
//        return "redirect:/home";
//    }
}
