package com.bookmarks.service;

import com.bookmarks.dao.model.Bookmark;
import com.bookmarks.dao.model.Menu;
import com.bookmarks.dao.repository.BookmarkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BookmarkService {
    @Autowired
    private BookmarkRepository bookmarkRepository;

    public void save(Bookmark bookmark, Menu menu) {
        bookmark.setMenu(menu);
        bookmarkRepository.save(bookmark);
    }

    public List<Bookmark> findByMenu(String nameMenu){
        return bookmarkRepository.findBookmarkByMenu_NameMenu(nameMenu);
    }
}
