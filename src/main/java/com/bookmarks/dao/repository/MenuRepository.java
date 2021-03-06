package com.bookmarks.dao.repository;

import com.bookmarks.dao.model.Menu;
import com.bookmarks.dao.model.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuRepository extends JpaRepository<Menu, Long> {


    Menu findByNameMenuAndUserInfo(String nameMenu, UserInfo userInfo);
    List<Menu> findMenuByUserInfo_Username(String userName);
    Menu findMenuById(Long idMenu);
}
