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
import java.util.List;

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
    public String home(Model model, @ModelAttribute("aimMenu") Menu aimMenu, @ModelAttribute("listBookmark") ArrayList<Bookmark> listBookmark) {
        System.out.println("in /home");

        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        System.out.println("listBookmark = " + listBookmark);
        System.out.println(listBookmark.isEmpty());
        if (aimMenu == null && listBookmark.isEmpty()) {
            List<Menu> listMenu = menuService.findMenuByNameUser(userDetails.getUsername());
            if (!listMenu.isEmpty()) {
                listBookmark = (ArrayList<Bookmark>) bookmarkService.findBookmarkByFirstMenu(userDetails.getUsername());
                aimMenu = listMenu.get(0);
                model.addAttribute("aimMenu", aimMenu);
                model.addAttribute("listBookmark", listBookmark);
            } else {
                model.addAttribute("aimMenu", aimMenu);
                model.addAttribute("listBookmark", listBookmark);
            }

        } else {
            model.addAttribute("aimMenu", aimMenu);
            model.addAttribute("listBookmark", listBookmark);
        }
        model.addAttribute("menu", new Menu());
        model.addAttribute("bookmark", new Bookmark());
        model.addAttribute("listMenu", menuService.findMenuByNameUser(userDetails.getUsername()));

        return "home";
    }


    @PostMapping("/menu/add")
    public String add(@ModelAttribute Menu menu, RedirectAttributes redirectAttributes) {
        System.out.println("-------- in /home/menu/add");
        System.out.println(menu.toString());

        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        UserInfo userInfo = userService.findByUsername(userDetails.getUsername());

        System.out.println("userInfo = " + userInfo.toString());

        menu.setUserInfo(userInfo);
        menuService.save(menu);

        redirectAttributes.addFlashAttribute("aimMenu", menu);
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

        System.out.println("aimMenuId = "+aimMenuId);
        System.out.println("idMenu = "+idMenuDel);

        menuService.deleteById(idMenuDel);

        Menu aimMenu;
        if (aimMenuId.longValue() == idMenuDel.longValue()) {
            System.out.println("aimMenuId.longValue() == idMenuDel.longValue()");
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            aimMenu = menuService.findFirstMenuOfThisUser(userDetails.getUsername());
        } else {
            System.out.println("else = " + aimMenuId);
            aimMenu = menuService.findMenuById(aimMenuId);
        }

        redirectAttributes.addFlashAttribute("aimMenu", aimMenu);
        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenu(aimMenu));

        return "redirect:/home";
    }

    @PostMapping("/menu/edit/{aimMenuId}/{editMenuId}")
    public String editMenu(@PathVariable("aimMenuId") Long aimMenuId,
                           @PathVariable("editMenuId") Long editMenuId,
                           @RequestParam("nameMenu") String editMenuName, RedirectAttributes redirectAttributes) {
        System.out.println("in /menu/edit/{aimMenuId}/{editMenuId}");

        Menu editMenu = menuService.findMenuById(editMenuId);
        editMenu.setNameMenu(editMenuName);
        menuService.saveAndFlush(editMenu);

        Menu aimMenu = menuService.findMenuById(aimMenuId);

        redirectAttributes.addFlashAttribute("aimMenu", aimMenu);
        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenu(aimMenu));

        return "redirect:/home";
    }

    @GetMapping("/bookmark/del/{aimMenuId}/{delBookmarkId}")
    public String delBookmark(@PathVariable("aimMenuId") Long aimMenuId, @PathVariable("delBookmarkId") Long
            delBookmarkId, RedirectAttributes redirectAttributes) {

        System.out.println("in /bookmark/del/{aimMenuId}/{delBookmarkId}");

        bookmarkService.deleteById(delBookmarkId);
        Menu aimMenu = menuService.findMenuById(aimMenuId);

        redirectAttributes.addFlashAttribute("aimMenu", aimMenu);
        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenu(aimMenu));

        return "redirect:/home";
    }

    @GetMapping("/bookmark/edit/{aimMenuId}/{editBookmarkId}")
    public String editBookmark(@PathVariable("aimMenuId") Long aimMenuId,
                               @PathVariable("editBookmarkId") Long editBookmarkId, RedirectAttributes redirectAttributes,
                               @RequestParam("bookmarkLink") String bookmarkLink,
                               @RequestParam("bookmarkComment") String bookmarkComment) {

        System.out.println("in /bookmark/edit/{aimMenuId}/{editBookmarkId}");

        Bookmark editBookmark = bookmarkService.findBookmarkById(editBookmarkId);
        editBookmark.setLink(bookmarkLink);
        editBookmark.setComment(bookmarkComment);
        bookmarkService.saveAndFlush(editBookmark);

        Menu aimMenu = menuService.findMenuById(aimMenuId);

        redirectAttributes.addFlashAttribute("aimMenu", aimMenu);
        redirectAttributes.addFlashAttribute("listBookmark", bookmarkService.findBookmarkByMenu(aimMenu));

        return "redirect:/home";
    }
}
