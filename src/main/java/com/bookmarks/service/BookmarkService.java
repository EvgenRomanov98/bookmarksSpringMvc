package com.bookmarks.service;

import com.bookmarks.dao.model.Bookmark;
import com.bookmarks.dao.model.Menu;
import com.bookmarks.dao.model.UserInfo;
import com.bookmarks.dao.repository.BookmarkRepository;
import com.bookmarks.dao.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class BookmarkService {
    @Autowired
    private BookmarkRepository bookmarkRepository;
    @Autowired
    private MenuRepository menuRepository;

    public void save(Bookmark bookmark, Menu menu, UserInfo userInfo) {
        bookmark.setMenu(menu);
        bookmark.setUserInfo(userInfo);
        bookmarkRepository.save(bookmark);
    }

    public List<Bookmark> findBookmarkByMenuAndUserInfo(String nameMenu, UserInfo userInfo) {
        System.out.println("in findBookmarkByMenuAndUserInfo");

        Menu menu = menuRepository.findByNameMenuAndUserInfo(nameMenu, userInfo);
        return bookmarkRepository.findBookmarkByMenuAndUserInfo(menu, userInfo);
    }

    //перегрузка, как возможный вариант вышестоящего метода
    public List<Bookmark> findBookmarkByMenuAndUserInfo(Menu menu, UserInfo userInfo) {
        return bookmarkRepository.findBookmarkByMenuAndUserInfo(menu, userInfo);
    }

    public List<Bookmark> findBookmarkByFirstMenu(String userName) {
        Menu menu = menuRepository.findMenuByUserInfo_Username(userName).get(0);
        return bookmarkRepository.findBookmarkByMenu_Id(menu.getId());
    }

    public void deleteById(Long idBookmark) {
        bookmarkRepository.deleteById(idBookmark);
    }
}
