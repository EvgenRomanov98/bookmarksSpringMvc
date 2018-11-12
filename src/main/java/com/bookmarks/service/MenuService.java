package com.bookmarks.service;

import com.bookmarks.dao.model.Menu;
import com.bookmarks.dao.model.UserInfo;
import com.bookmarks.dao.repository.BookmarkRepository;
import com.bookmarks.dao.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MenuService {
    @Autowired
    private MenuRepository menuRepository;
    @Autowired
    private BookmarkRepository bookmarkRepository;

    public void save(Menu menu) {
        menuRepository.save(menu);
    }

    public List<Menu> findAll() {
        return menuRepository.findAll();
    }

    public Menu findMenuByNameMenu(String nameMenu, UserInfo userInfo) {
        return menuRepository.findByNameMenuAndUserInfo(nameMenu, userInfo);
    }

    public List<Menu> findMenuByNameUser(String userName) {
        return menuRepository.findMenuByUserInfo_Username(userName);
    }

    public void deleteById(Long idBookmark) {
        bookmarkRepository.deleteBookmarkByMenu_Id(idBookmark);
        menuRepository.deleteById(idBookmark);
    }

    public Menu findMenuById(Long idMenu) {
        return menuRepository.findMenuById(idMenu);
    }

    public Menu findFirstMenuOfThisUser(UserInfo userInfo) {
        try {
            return menuRepository.findAll().get(0);
        } catch (Exception e) {
            System.out.println("catch in findFirstMenuOfThisUser menuService");
            e.printStackTrace();
            return null;
        }
    }
}
