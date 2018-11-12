package com.bookmarks.dao.repository;

import com.bookmarks.dao.model.Bookmark;
import com.bookmarks.dao.model.Menu;
import com.bookmarks.dao.model.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookmarkRepository extends JpaRepository<Bookmark, Long> {

    List<Bookmark> findBookmarkByMenu_Id(Long id);
    void deleteBookmarkByMenu_Id(Long idMenu);
    List<Bookmark> findBookmarkByMenu(Menu menu);

}
